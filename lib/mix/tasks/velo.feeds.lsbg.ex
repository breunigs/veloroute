defmodule Mix.Tasks.Velo.Feeds.Lsbg do
  use Mix.Task
  use Tesla

  @base "https://lsbg.hamburg.de"
  @index "#{@base}/baumassnahmen-und-planungen"
  @path "data/auto_generated/feeds_seen/lsbg.json"
  @requirements ["app.start"]

  # plug Tesla.Middleware.FormUrlencoded
  plug Tesla.Middleware.Timeout, timeout: 60_000

  plug Tesla.Middleware.Retry,
    delay: 10_000,
    max_retries: 3,
    max_delay: 60_000

  @shortdoc "Checks for updates in Hamburg's LSBG"
  def run(_) do
    status = load_status()

    projects()
    |> Stream.map(&details/1)
    |> Enum.reduce(
      {status, nil},
      fn
        {:error, reason}, acc ->
          IO.puts(:stderr, reason)
          acc

        detail, {status, task} ->
          if status[detail.source] == detail.checksum do
            # already seen and no changes
            {status, task}
          else
            status = write_status_put(status, task)
            task = Task.async(fn -> show(detail) end)
            {status, task}
          end
      end
    )
    |> write_status_put()
  end

  defp projects() do
    with {:ok, %{body: body}} <- get(@index),
         {:ok, document} <- Floki.parse_fragment(body) do
      document
      |> Floki.find("a.map")
      |> Enum.map(&Floki.attribute(&1, "href"))
      |> Enum.map(&absolute/1)
      |> Enum.uniq()
    end
  end

  @typep detail :: %{text: binary(), links: binary(), checksum: binary(), source: binary()}

  @spec details(binary()) :: detail() | {:error, binary()}
  defp details(link) do
    with {:ok, %{body: body}} <- get(link),
         {:ok, document} <- Floki.parse_fragment(body) do
      links =
        document
        |> Floki.find("article a")
        |> Enum.map(&Floki.attribute(&1, "href"))
        |> Enum.map(&absolute/1)
        |> Enum.join("\n")

      text =
        document
        |> Floki.find("article")
        |> Enum.map(&Floki.text/1)
        |> Enum.map(&String.trim/1)
        |> Enum.reject(fn str -> str == "" end)
        |> Enum.join("\n\n")

      check = :crypto.hash(:md5, text <> links) |> Base.encode16(case: :lower)
      %{text: text, links: links, checksum: check, source: link}
    else
      error -> {:error, "failed to read/parse #{link}: #{inspect(error)}"}
    end
  end

  @spec absolute(binary() | [binary()]) :: binary()
  defp absolute([all]) when is_binary(all), do: absolute(all)
  defp absolute("http://" <> _rest = all), do: all
  defp absolute("mailto:" <> _rest = all), do: all
  defp absolute("https://" <> _rest = all), do: all
  defp absolute(all), do: @base <> all

  @spec show(detail()) :: detail() | no_return()
  @max_lines 15
  defp show(detail) do
    all = detail.text |> String.split("\n")
    part = Enum.take(all, @max_lines)
    shortened = if length(all) <= @max_lines, do: "", else: "\n(…)"

    IO.puts("""


    ===========================================
    LSBG: #{detail.source}
    ===========================================

    #{Enum.join(part, "\n")}#{shortened}

    all links:
    #{detail.links}
    ===========================================
    """)

    case IO.gets("Continue?") do
      :eof -> exit({:shutdown, 1})
      {:error, _reason} -> exit({:shutdown, 1})
      _input -> detail
    end
  end

  @typep status() :: %{binary() => binary()}

  @spec load_status() :: status()
  defp load_status() do
    with {:ok, raw} <- File.read(@path),
         {:ok, doc} <- Jason.decode(raw) do
      doc
    else
      err ->
        IO.puts("failed to read #{@path} (#{inspect(err)}), going to create empty file")
        %{}
    end
  end

  defp write_status_put({status, task}), do: write_status_put(status, task)

  @spec write_status_put(status(), Task.t() | nil | detail) :: status()
  defp write_status_put(status, %Task{} = task) do
    write_status_put(status, Task.await(task, :infinity))
  end

  defp write_status_put(status, nil), do: status

  defp write_status_put(status, %{checksum: sum, source: source}) do
    status
    |> Map.put(source, sum)
    |> write_status()
  end

  @spec write_status(status()) :: status()
  defp write_status(status) do
    json = Jason.encode!(status, pretty: true)
    File.write!(@path, json)
    status
  end
end
