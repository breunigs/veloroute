defmodule Mix.Tasks.Velo.Feeds.Sitzungsdienst do
  use Mix.Task
  use Tesla

  @filter_keywords ~w(velo straße radverkehr fahrrad verschickung baustelle twiete chaussee allee bezirksroute)
  # do not report all Sitzungen just because they have a location with an address
  @filter_keywords_sitzungen_ignore ~w(straße)

  @path "data/auto_generated/feeds_seen/sitzungsdienst.json"
  @requirements ["app.start"]

  @typep result :: %{binary() => binary()}
  @typep de_date :: binary()

  plug Tesla.Middleware.FormUrlencoded
  plug Tesla.Middleware.Timeout, timeout: 60_000

  plug Tesla.Middleware.Retry,
    delay: 10_000,
    max_retries: 3,
    max_delay: 60_000

  @shown_by_date "shown_by_date"

  @shortdoc "Checks for updates in Hamburg's Bezirksversammlungen"
  def run(_) do
    status = load_status() |> show_all_districts()

    Enum.reduce(Allris.districts(), status, &Map.put(&2, &1, today()))
    |> write_status()
  end

  @spec show_all_districts(status()) :: status()
  defp show_all_districts(status) do
    results = Stream.flat_map(Allris.districts(), &check_district(&1, status))
    shown = status[@shown_by_date] |> Map.values() |> List.flatten() |> MapSet.new()

    results
    |> Enum.reduce({status, nil}, fn result, {status, task} ->
      if MapSet.member?(shown, result_ident(result)) do
        {status, task}
      else
        status = write_status_put(status, task)
        task = Task.async(fn -> show(result) end)
        {status, task}
      end
    end)
    |> write_status_put()
  end

  @spec show(result()) :: result() | no_return()
  defp show(%{"desc" => desc} = result) do
    IO.puts("\n#{desc}\n#{url(result)}")

    case IO.gets("Continue?") do
      :eof -> exit({:shutdown, 1})
      {:error, _reason} -> exit({:shutdown, 1})
      _input -> result
    end
  end

  @spec url(result()) :: binary()
  defp url(%{"district" => district, "type" => type, "id" => id}) do
    Allris.url(district, type, id)
  end

  @spec check_district(binary(), status()) :: Enumerable.t()
  defp check_district(district, status) do
    [d, m, y] = String.split(status[district], ".") |> Enum.map(&String.to_integer/1)
    date = Date.new!(y, m, d) |> Date.add(-2)
    from = "#{date.day}.#{date.month}.#{date.year}"
    de_date_range = "#{from}-#{today()}"

    Stream.flat_map(@filter_keywords, fn keyword ->
      query(district, keyword, de_date_range)
    end)
    |> Stream.uniq_by(fn %{"type" => type, "id" => id} -> {type, id} end)
  end

  @spec query(binary(), binary(), binary()) :: [result()]
  defp query(district, keyword, de_date_range) do
    sitzungen = !(keyword in @filter_keywords_sitzungen_ignore)
    url = "https://sitzungsdienst-#{district}.hamburg.de/bi/yw041.asp"
    params = %{ajx: 1, to: 1, vo: 1, si: sitzungen, q: keyword, d: de_date_range}

    # IO.puts(:stderr, "Searching #{district} for #{keyword} within #{de_date_range}")
    {:ok, %{body: body}} = post(url, params)

    html = Floki.parse_fragment!(body)

    html
    |> Floki.find(~s|form input[type="hidden"][name][value]|)
    |> Enum.map(fn elem ->
      type = hd(Floki.attribute(elem, "name"))
      id = hd(Floki.attribute(elem, "value"))
      desc = Floki.find(html, ~s|a[href$="#{type}=#{id}"]|) |> Floki.text() |> String.trim()
      %{"district" => district, "type" => type, "id" => id, "desc" => desc}
    end)
  end

  defp today() do
    t = Date.utc_today()
    "#{t.day}.#{t.month}.#{t.year}"
  end

  @typep shown :: %{Date.t() => [binary()]}
  @typep status :: %{binary() => de_date() | shown()}
  @spec load_status() :: status
  defp load_status() do
    status =
      case File.read(@path) do
        {:ok, file} ->
          Jason.decode!(file)

        {:error, error} ->
          IO.puts(
            :stderr,
            "failed to load seen Sitzungsdienst status from #{@path} (#{inspect(error)})"
          )

          %{}
      end
      |> Map.put_new(@shown_by_date, %{})
      |> Map.update!(@shown_by_date, fn shown ->
        cleanup_before = Date.utc_today() |> Date.add(-60)

        Enum.into(shown, %{}, fn {date, list} ->
          {Date.from_iso8601!(date), list}
        end)
        |> Map.reject(fn {date, _list} -> Date.compare(date, cleanup_before) == :lt end)
      end)

    Enum.reduce(Allris.districts(), status, &Map.put_new(&2, &1, today()))
  end

  @spec write_status_put({status(), Task.t() | nil}) :: status()
  defp write_status_put({status, task}), do: write_status_put(status, task)

  @spec write_status_put(status(), result() | Task.t() | nil) :: status()
  defp write_status_put(status, %Task{} = task) do
    write_status_put(status, Task.await(task, :infinity))
  end

  defp write_status_put(status, nil), do: status

  defp write_status_put(status, result) do
    ident = result_ident(result)
    shown = Map.update(status[@shown_by_date], Date.utc_today(), [ident], fn l -> [ident | l] end)

    status
    |> Map.put(@shown_by_date, shown)
    |> write_status()
  end

  @spec write_status(status()) :: status()
  defp write_status(%{@shown_by_date => shown} = status) when is_map(shown) do
    json = Jason.encode!(status)
    File.write!(@path, json)
    status
  end

  defp result_ident(%{"type" => type, "id" => id}), do: "#{type}=#{id}"
end
