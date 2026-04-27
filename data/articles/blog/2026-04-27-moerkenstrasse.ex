defmodule Data.Article.Blog.Moerkenstrasse do
  use Article.Default

  def title(), do: "Mörkenstraße (Radroute 1)"

  def summary(),
    do:
      "Radfahrstreifen und teilweise Protected-Bike-Lane Richtung Innenstadt. Gegenrichtung bleibt gesperrt."

  def type(), do: :planned
  def tags(), do: ["radroute-1"]

  def start(), do: ~d[2027Q2]
  def stop(), do: ~d[2027Q2]

  def map_image do
    {name(),
     [
       {"Bezirksamt Altona – Fachamt öffentlicher Raum",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/altona/bezirksamt/dezernat-wirtschaft-bauen-umwelt-50986"}
     ]}
  end

  def links(_assigns) do
    [
      {"erster Entwurf, Pläne und Erläuterungen", ~d[2026-04],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1018127"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Mörkenstraße hat keine eigenen Radwege. Rad- und KFZ-Verkehr teilen sich die Fahrbahn im <.ref>Mischverkehr</.ref> bei Tempo 50.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>In Richtung Innenstadt soll ein mindestens 2,50m <.ref>Radfahrstreifen</.ref> aufgemalt werden. Er schließt nahtlos an die Radfahrstreifen davor und danach an.</p>

    <p>Bis zur <.v bounds="9.941924,53.549249,9.944474,53.550038" lon={9.943628} lat={53.549574} dir="forward" ref={Radroute1}>Funkstraße</.v> werden links des Radfahrstreifens KFZ-Parkplätze aufgemalt. Linksabbiegen ist über Aufstellbuchten vor und nach dem Parkstreifen möglich.</p>

    <p>Die <.v bounds="9.943194,53.548735,9.946843,53.550283" lon={9.944464} lat={53.549419} dir="forward" ref={Radroute1}>Elmenhorststraße</.v> wird als Gehwegüberfahrt angebunden. Weitere Einmündungen sollen enger gefasst werden. Ampeln werden nicht angepasst.</p>

    <p>Auf <.v bounds="9.94416,53.549051,9.947571,53.549941" lon={9.945517} lat={53.549433} dir="forward" ref={Radroute1}>Höhe der Polizei</.v> soll ein Abschnitt <.ref>Protected-Bike-Lane</.ref> ausgeführt werden.</p>

    <h4>Meinung</h4>
    <p>KFZ-Parkplätze in der Straßenmitte zu markieren, ist ungewöhnlich. Zwar bleibt der Radweg frei, wenn Fahrzeuge rückwärts einparken. Allerdings besteht die Gefahr, dass Autofahrer beim Vorwärtseinparken über den Radweg fahren ohne auf den Radverkehr zu achten.</p>

    <p>Im Kurvenbereich an der <.v bounds="9.946077,53.548994,9.94809,53.54993" lon={9.946595} lat={53.54944} dir="forward" ref={Radroute1}>Virchowstraße</.v> wäre die Protected-Bike-Lane am nötigsten. Leider endet sie bereits vorher.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
