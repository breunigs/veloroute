defmodule Data.Article.Blog.AmLuisenhof do
  use Article.Default

  def created_at(), do: ~D[2021-05-22]

  def title(), do: "Am Luisenhof – Busüberlieger (Bezirksroute Wandsbek W5)"

  def start(), do: ~d[2024-07-15]
  def stop(), do: ~d[2025-03-31]
  def construction_site_id_hh(), do: [677_843]

  def type(), do: :construction

  def tags(), do: ["br-wandsbek-w5"]

  @attrib [
    {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
    {"LEHNE Ingenieurgesellschaft mbH für Bauen und Umwelt", "https://www.lehne-ing.de/kontakt"}
  ]
  def map_image do
    Data.MapImage.new(__MODULE__, @attrib, {
      %{lat: 53.607313198, lon: 10.111803808},
      %{lat: 53.608036482, lon: 10.115421484},
      %{lat: 53.607325617, lon: 10.115825668},
      %{lat: 53.606602333, lon: 10.112207992}
    })
  end

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2024-07],
       "https://lsbg.hamburg.de/resource/blob/932490/01bfdd46689cf3d140bd213fd589d691/u-farmsen-ueberlieger-juli-2024-data.pdf"},
      {"Bauvergabe", "März 2024",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/02842548-8a4f-4c5a-b3e8-226d28b107cd/details"},
      {"Erläuterungen und Lageplan", "2023, Überarbeitung",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1018980"},
      {"Erläuterungen und Lageplan", "2022, veralteter Entwurf",
       "https://web.archive.org/web/20240527122028/https://via-bus.hamburg.de/contentblob/16224440/9dbb0168cfd3fba685218fc5e164d159/data/03-mb26-u-farmsen-schlussverschickung-ueberliegerplaetze.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird auf <.ref>Hochbordradwegen</.ref> unterschiedlicher Breiten, Oberflächen und Ebenheiten geführt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Im Zuge der Busbeschleunigung werden am Luisenhof Warteflächen für Busse angelegt. Der <.ref>Hochbordradweg</.ref> im Süden bleibt in seiner Lage im Wesentlichen gleich, wird aber auf 2,0m verbreitert. Der Radweg auf der Nordseite wird ebenfalls so breit, in seinem Verlauf aber deutlich nach Norden verschoben. Dies gilt analog auch für die Fußwege, die auf rund 2,65m verbreitert werden.</p>

    <p>Die <.m bounds="10.112885,53.606964,10.115808,53.608041">Einmündung des Bramfelder Weges</.m> wird mit einer Ampel ausgestattet. Die Querung der Einmündung ist geradliniger als heute.</p>

    <p>Zum Queren des Luisenhof sind auf der Ostseite eine Rad- und Fußfurt vorgesehen, jeweils mit eigener Ampel. Auf der Westseite erhält nur der Radverkehr eine Furt, die ohne Mittelinsel in einem Bogen auf den Hochbordradweg führt.</p>

    <h4>Meinung</h4>
    <p>Die Planung ist gut. Die Breite und Führung der neuen Radwege ist ansprechend. Konflikte mit anderen Verkehrsarten bleiben wie bisher minimal, bzw. werden sogar geringer weil alle genug Verkehrsfläche bekommen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
