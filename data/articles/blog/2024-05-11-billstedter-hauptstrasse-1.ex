defmodule Data.Article.Blog.BillstedterHauptstrasse1 do
  use Article.Default

  def title(), do: "Billstedter Hauptstraße – zwischen Am Alten Zoll und Hertelstieg (Radroute 8)"

  def summary(),
    do:
      "Radfahrstreifen werden verbreitert und teilweise als Protected-Bike-Lane hergerichtet. Platz an der Möllner Landstraße wird umgestaltet, bleibt durch den Erhalt der KFZ-Parkplätze aber hässlich."

  def type(), do: :planned

  def start(), do: ~d[2024-09-20]
  def stop(), do: ~d[2026-01-15]
  def construction_site_id_hh(), do: [1_013_172]

  def tags(), do: ["8"]

  def map_image do
    {name(),
     [{"SBI beratende Ingenieure für BAU-VERKEHR-VERMESSUNGS GmbH", "https://www.sbi.de/"}]}
  end

  def links(_assigns) do
    [
      {"Infoseite der Stadt",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/mitte/themen/planen-bauen-wohnen/verkehr/neugestaltung-der-billstedter-hauptstrasse-vr-8-1003918"},
      {"Ausschreibung Umbau", "Mai 2024",
       "https://web.archive.org/web/20240511081145/https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/e57e41bd-8b1e-4ffd-a8a6-dc8b1e2c702e"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind beidseitig rund 1,6m breite <.ref>Radfahrstreifen</.ref> vorhanden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es sind beidseitig rund 2,5m breite <.ref>Radfahrstreifen</.ref> bzw. 2,25m breite <.ref>Protected-Bike-Lanes</.ref> vorgesehen. Die Trennsteine werden für Einfahrten, Einmündungen und bei KFZ-Parkplätzen rechts des Radwegs unterbrochen.</p>

    <p>Auf <.v bounds="10.10192,53.537984,10.106929,53.54026" lon={10.103921} lat={53.539273} dir="backward" ref="8">Höhe des Platzes</.v> soll in Straßenmitte eine neue Baumreihe gepflanzt werden. Diese wird gepflastert und dient auch als Sprunginsel, damit die Straße zu Fuß leichter gequert werden kann. Entsprechend ist in diesem Bereich ein Radfahrstreifen geplant. Die KFZ-Parkplätze auf der Nordseite bleiben in etwa wie heute, wofür einige Bäume gefällt werden.</p>

    <p>Linksabbiegen ist nur <.ref>direkt</.ref> möglich, sofern man nicht über den Gehweg schieben möchte.</p>

    <h4>Meinung</h4>
    <p>Die Radfahrstreifen zu verbreitern und vom KFZ-Verkehr abzutrennen ist gut.</p>

    <p>Auch den Platz als solchen herzurichten ist eine gute Idee. Dazu passt allerdings nicht, dass die Sprunginsel und der Platz von einer Reihe an KFZ-Parkplätzen durchschnitten wird. Als Ladezone in Ordnung, ist KFZ-Parken angesichts der zahlreichen und teils kostenlosen Parkhäuser unverständlich. Dafür die Bäume auf dem Platz zu opfern ist sehr kurzsichtig gedacht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
