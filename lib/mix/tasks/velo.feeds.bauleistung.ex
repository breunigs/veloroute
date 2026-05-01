# defmodule Mix.Tasks.Velo.Feeds do
# end

defmodule Mix.Tasks.Velo.Feeds.Bauleistung do
  use Mix.Task
  use Tesla
  require Logger

  @terms [
    "INST HVS",
    "velo",
    "radverkehr",
    "Inst. HVS",
    "Hauptverkehrsstraße",
    "Straßenbauarbeiten"
  ]

  @host "https://www.hamburg.de"
  @base "#{@host}/politik-und-verwaltung/ausschreibungen/bauleistungen-vob/884730!search"

  @path "data/auto_generated/feeds_seen/bauleistung.json"
  @requirements ["app.start"]

  plug Tesla.Middleware.BaseUrl, @base
  plug Tesla.Middleware.Timeout, timeout: 60_000
  adapter(Tesla.Adapter.Hackney, ssl_options: [{:verify, :verify_none}])

  @shortdoc "Checks for updates in Bauleistung VOB on hamburg.de"
  def run(_) do
    if not File.exists?(@path), do: File.write(@path, "{}")
    seen = JSON.decode!(File.read!(@path))

    results =
      @terms
      |> Stream.flat_map(&search/1)
      |> Stream.uniq()
      |> Stream.reject(fn %{url: url} -> Map.has_key?(seen, url) end)

    Enum.reduce(results, seen, fn result, seen ->
      IO.puts("""
      #{result.text}
      #{result.url}
      """)

      case IO.gets("Continue?") do
        :eof -> exit({:shutdown, 1})
        {:error, _reason} -> exit({:shutdown, 1})
        _input -> true
      end

      seen = Map.put(seen, result.url, Date.utc_today())
      File.write!(@path, JSON.encode!(seen))
      seen
    end)
  end

  def search(term) do
    with {:ok, %{status: 200, body: body}} <- get("", query: [query: term]),
         {:ok, html} <- Floki.parse_document(body) do
      html
      |> Floki.find("a.km1-teaser__heading-link")
      |> Enum.map(fn node ->
        href = node |> Floki.attribute("href") |> List.first()
        text = node |> Floki.text() |> String.trim()
        %{url: @host <> href, text: text}
      end)
    else
      e ->
        Logger.warning("Failed to retrieve Bauleistung: #{inspect(e)}")
        []
    end
  end
end
