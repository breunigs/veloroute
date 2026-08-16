defmodule Search.Meilisearch.Verkehrszeichen do
  @behaviour Search.Meilisearch.Behaviour

  @dir "data/images/verkehrszeichen"
  @titles_path "#{@dir}/titles.json"
  @external_resource @dir
  @external_resource @titles_path

  @titles if File.exists?(@titles_path),
            do: @titles_path |> File.read!() |> JSON.decode!(),
            else: %{}

  @signs Path.wildcard("#{@dir}/{vz,zz}_*.svg")
         |> Enum.map(fn path ->
           basename = Path.basename(path, ".svg")
           [type, number] = String.split(basename, "_", parts: 2)
           full_type = if type == "vz", do: "Verkehrszeichen", else: "Zusatzzeichen"
           title = @titles[basename]

           %{
             id: basename,
             type: type,
             number: number,
             title: title,
             search_text: "#{String.upcase(type)} #{number} #{full_type} #{number} #{title}",
             image: "/images/verkehrszeichen/#{basename}.svg"
           }
         end)

  @impl true
  def id(), do: :verkehrszeichen

  @impl true
  def updated_at() do
    case File.stat(@dir) do
      {:ok, %{mtime: mtime}} ->
        mtime
        |> NaiveDateTime.from_erl!()
        |> DateTime.from_naive!("Etc/UTC")

      _ ->
        ~U[2020-01-01 00:00:00Z]
    end
  end

  @impl true
  def documents(), do: @signs

  @impl true
  def params(query, _lat, _lon) do
    %{q: query, limit: 10}
  end

  @impl true
  def format(%{"_rankingScore" => score}) when score < 0.9, do: nil

  def format(result) do
    %Search.Result{
      name: "#{String.upcase(result["type"])} #{result["number"]}",
      subtext: result["title"],
      bounds: Settings.r(:initial),
      relevance: Map.fetch!(result, "_rankingScore"),
      type: "verkehrszeichen",
      image: result["image"]
    }
  end

  @impl true
  def config() do
    %{
      displayedAttributes: ~w(type number title image),
      searchableAttributes: ~w(search_text),
      typoTolerance: %{enabled: false},
      synonyms: %{
        "vz" => ["verkehrszeichen"],
        "verkehrszeichen" => ["vz"],
        "zz" => ["zusatzzeichen"],
        "zusatzzeichen" => ["zz"]
      }
    }
  end
end
