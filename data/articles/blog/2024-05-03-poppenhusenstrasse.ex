defmodule Data.Article.Blog.Poppenhusenstrasse do
  use Article.Default

  def title(), do: "Poppenhusenstraße (Radroute 5)"

  def summary(),
    do:
      "Straße wird für den Radverkehr in beide Richtungen freigegeben. Fahrbahn wird etwas breiter und das Parken mit Parkbuchten und Fahrrad-Anschließbügeln neu sortiert."

  def type(), do: :planned
  def start(), do: ~d[2025Q2]
  # def stop(), do: ~d[]

  def tags(), do: ["5"]

  @attrib {"Bezirksamt Hamburg-Nord",
           "https://www.hamburg.de/hamburg-nord/dezernat-wirtschaft-bauen-umwelt/"}
  def map_image do
    Data.MapImage.new(__MODULE__, @attrib, {
      %{lat: 53.585472656, lon: 10.042321296},
      %{lat: 53.586870805, lon: 10.044577814},
      %{lat: 53.586668720, lon: 10.044933286},
      %{lat: 53.585270630, lon: 10.042676616}
    })
  end

  def links(_assigns) do
    [
      {"1. Entwurf, Lageplan und Erläuterung", "Mai 2024",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1014004"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Einbahnstraße teilen sich Fahrrad und KFZ die Fahrbahn im <.ref>Mischverkehr</.ref>.</p>

    <div class="headlineForm">
      <h4>Planung</h4>
      <.map_image_toggle checked={@show_map_image}/>
    </div>
    <p>Die Straße wird für den Radverkehr in beide Richtungen freigegeben. Sie bleibt KFZ-Einbahnstraße. Die <.ref>Fahrbahn</.ref> soll 4,75m betragen, damit Fahrrad/Bus im Gegenverkehr sicher aneinander vorbeikommen.</p>

    <p>Es kommen erstmals Sitzbänke und Fahrrad-Anschließmöglichkeiten hinzu. Das KFZ-Parken wird durch Parkbuchten geordnet.</p>

    <h4>Meinung</h4>
    <p>An der guten Planung sind höchstens Details zu kritisieren. Etwa fehlt der <.v bounds="10.042704,53.585641,10.045656,53.587279" lon={10.044633} lat={53.586628} dir="forward" ref="5">Seite am Bahnhof</.v> eine Verkehrsinsel, die Linksabbieger daran hindert sich zu weit links aufzustellen. Radverkehr aus dem <.v bounds="10.042704,53.585641,10.045656,53.587279" lon={10.045048} lat={53.58672} dir="backward" ref="br-nord-n6">Wiesendamm</.v> könnte dann nicht mehr einbiegen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
