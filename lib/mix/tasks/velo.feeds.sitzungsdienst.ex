defmodule Mix.Tasks.Velo.Feeds.Sitzungsdienst do
  use Mix.Task
  use Tesla

  @filter_keywords ~w(velo straße radverkehr fahrrad verschickung baustelle twiete chaussee allee bezirksroute)

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

  @seen "seen"
  @seen_last_run "seen_last_run"

  @shortdoc "Checks for updates in Hamburg's Bezirksversammlungen"
  def run(_) do
    status = show_all_districts(load_status())

    Enum.reduce(Allris.districts(), %{}, &Map.put(&2, &1, today()))
    |> Map.put(@seen, [])
    |> Map.put(@seen_last_run, status[@seen_last_run])
    |> write_status()
  end

  @spec show_all_districts(status()) :: status()
  defp show_all_districts(status) do
    results = Stream.flat_map(Allris.districts(), &check_district(&1, status))
    seen = MapSet.new(status[@seen])

    results
    |> Enum.reduce({status, nil}, fn result, {status, task} ->
      if MapSet.member?(seen, result) do
        {write_status_put(status, result), task}
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
    # go a while back to ensure we don't get shown the same docs again, just
    # because their discussion was postponed and similar changes
    [d, m, y] = String.split(status[district], ".") |> Enum.map(&String.to_integer/1)
    date = Date.new!(y, m, d) |> Date.add(-30)
    from = "#{date.day}.#{date.month}.#{date.year}"
    de_date_range = "#{from}-#{today()}"

    Stream.flat_map(@filter_keywords, fn keyword ->
      query(district, keyword, de_date_range)
    end)
    |> Stream.uniq_by(fn %{"type" => type, "id" => id} -> {type, id} end)
  end

  @spec query(binary(), binary(), binary()) :: [result()]
  defp query(district, keyword, de_date_range) do
    url = "https://sitzungsdienst-#{district}.hamburg.de/bi/yw041.asp"
    params = %{ajx: 1, to: 1, vo: 1, si: 1, q: keyword, d: de_date_range}

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

  @typep status :: %{binary() => de_date() | [result()]}
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
      |> Map.put_new(@seen, [])
      |> Map.put_new(@seen_last_run, [])

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
    status
    |> Map.put(@seen_last_run, [result | status[@seen_last_run]])
    |> write_status()
  end

  @spec write_status(status()) :: status()
  defp write_status(%{@seen => seen, @seen_last_run => seen_lr} = status) do
    json =
      status
      |> Map.put(@seen, Enum.uniq(seen_lr ++ seen))
      |> Map.delete(@seen_last_run)
      |> Jason.encode!()

    File.write!(@path, json)
    status
  end
end
