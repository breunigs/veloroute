# defmodule Mix.Tasks.Velo.Feeds do
# end

defmodule Mix.Tasks.Velo.Feeds.Bauweiser do
  use Mix.Task
  use Tesla
  use Memoize
  require Logger
  import Guards

  @path "data/auto_generated/feeds_seen/bauweiser.json"
  @base "https://bauweiser.hamburg.de/api/steckbriefeweb/"
  @days_to_check [0, 7] ++ Enum.to_list(30..360//30)
  @requirements ["app.start"]

  plug Tesla.Middleware.BaseUrl, @base
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Timeout, timeout: 60_000

  def url_for_id(id) do
    "#{@base}id/#{id}"
  end

  @shortdoc "Checks for updates in Bauweiser and updates articles that reference the IDs"
  def run(_) do
    seen_ids = load_seen()
    current_ids = Parallel.flat_map(@days_to_check, &find_ids_in_n_days(&1))
    known_ids = Enum.flat_map(articles_with_ids(), & &1.construction_site_id_hh())

    infos =
      (known_ids ++ current_ids)
      |> Enum.uniq()
      |> Parallel.map(4, &details(&1))
      |> Util.compact()
      |> Enum.filter(fn %{id: id, updated: updated} ->
        last_seen = seen_ids[id]
        !last_seen || Date.compare(last_seen, updated) == :lt
      end)

    indexed = Enum.into(infos, %{}, fn %{id: id} = d -> {id, d} end)

    articles_with_ids()
    |> Enum.each(fn art ->
      relevant = Enum.map(art.construction_site_id_hh(), &indexed[&1]) |> Util.compact()
      update_article(art, relevant)
    end)

    remain = Map.keys(indexed) -- known_ids

    remain
    |> Enum.reject(fn id ->
      upd = indexed[id]
      Date.diff(upd[:stop], upd[:start]) <= 5
    end)
    |> Enum.reduce(seen_ids, fn id, seen_ids ->
      upd = indexed[id]

      IO.puts("""


      #{upd[:title]}
        def start(), do: ~d[#{upd[:start]}]
        def stop(), do: ~d[#{upd[:stop]}]
        def construction_site_id_hh(), do: [#{id}]
        velo: #{upd[:velo]}
        curl -s #{url_for_id(upd[:id])} | jq
      """)

      case IO.gets("Continue?") do
        :eof -> exit({:shutdown, 1})
        {:error, _reason} -> exit({:shutdown, 1})
        _input -> true
      end

      write_seen(Map.put(seen_ids, id, upd[:updated]))
    end)
  end

  defp write_seen(%{} = seen) do
    json = Jason.encode!(seen)
    File.write!(@path, json)
    seen
  end

  defp find_ids_in_n_days(days) when is_integer(days) and days >= 0 do
    date = Date.utc_today() |> Date.add(days)

    with {:ok, response} <- get("list", query: [date: "#{date}"]) do
      Enum.map(response.body, fn entry -> entry["id"] end)
    else
      e ->
        Logger.warning("Failed to retrieve list Bauweiser date=#{date}: #{inspect(e)}")
        []
    end
  end

  defp details(id) when is_integer(id) do
    try do
      {:ok, %{body: j}} = get("id/#{id}")

      %{
        id: id,
        title: "#{j["titel"]} -- #{j["veranlasser"]}",
        updated: date(j["updateDatetime"]),
        link: j["internetLink"],
        start: date(dig(j, ~w/bauintervall start/)),
        stop: date(dig(j, ~w/bauintervall end/)),
        velo:
          velo_related?(j["anlass"]) || velo_related?(j["umfang"]) || velo_related?(j["mehrwert"])
      }
    rescue
      e ->
        Logger.warning("Failed to retrieve Bauweiser id=#{id}: #{inspect(e)}")
        nil
    end
  end

  defp articles_with_ids() do
    Article.List.category("Blog")
    |> Enum.reject(&(&1.construction_site_id_hh() == []))
  end

  defp dig(j, terms) do
    String.trim(get_in(j, terms) || "")
  end

  defp velo_related?(nil), do: false

  defp velo_related?(text) do
    text = String.downcase(text)

    Enum.any?(~w/veloroute radverkehr radfahr fahrrad bezirksroute/, fn term ->
      String.contains?(text, term)
    end)
  end

  defp date(str) do
    str = String.split(str, ~r/\s|T/, parts: 2) |> hd()
    {:ok, date} = Date.from_iso8601(str)
    date
  end

  defp load_seen() do
    case File.read(@path) do
      {:ok, file} ->
        Jason.decode!(file)
        |> Enum.into(%{}, fn {k, v} ->
          {String.to_integer(k), date(v)}
        end)

      {:error, error} ->
        Logger.warning("failed to load seen Bauweiser IDs from #{@path} (#{inspect(error)})")
        %{}
    end
  end

  defp update_article(_art, []), do: nil

  defp update_article(art, relevant) when is_module(art) do
    new_start = find_new_date(art, :start, relevant)
    new_stop = find_new_date(art, :stop, relevant)

    cond do
      past?(new_start) && past?(new_stop) ->
        # ignore updates if they are both in the past and likely were manually
        # removed from the article
        nil

      new_start || new_stop ->
        path = Util.module_source_path(art)
        code = File.read!(path)

        code = if new_stop, do: replace_with_fallback(code, :stop, new_stop), else: code
        code = if new_start, do: replace_with_fallback(code, :start, new_start), else: code

        File.write!(path, code)
        IO.puts("Updated #{art} in #{path}")

      true ->
        nil
    end
  end

  defp past?(date)
  defp past?(nil), do: false
  defp past?(date), do: Date.compare(date, Date.utc_today()) == :lt

  defp find_new_date(art, field, relevant) do
    exact = apply(art, field, [])
    exact = if exact, do: Data.RoughDate.as_full_date(exact)

    new = Util.compact([exact] ++ Enum.map(relevant, & &1[field]))

    new =
      case field do
        :start -> Enum.min(new, Date)
        :stop -> Enum.max(new, Date)
      end

    if new != exact, do: new
  end

  def replace_with_fallback(code, _key, nil), do: code

  def replace_with_fallback(code, key, val) do
    str = "def #{key}(), do: ~d[#{val}]"
    code = String.replace(code, ~r/def #{key}\(\), do: .*/, str)

    if String.contains?(code, str) do
      code
    else
      String.replace(code, ~r/def created_at\(\), .*/, "\\0\n  #{str}")
    end
  end
end
