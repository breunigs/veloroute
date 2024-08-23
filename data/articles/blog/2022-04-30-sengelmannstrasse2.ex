defmodule Data.Article.Blog.Sengelmannstrasse2 do
  use Article.Default

  def updated_at(), do: ~D[2024-03-14]

  def title(),
    do: "Sengelmannstraße – Höhe U-Bahn-Brücke (Radroute 5, Radroute Plus Bad Bramstedt)"

  def summary(),
    do:
      "Hochbordradwege sollen rund 2,0m breit werden. In Richtung Flughafen bleibt unter der Brücke eine Engstelle mit 1,60m."

  def type(), do: :construction

  def start(), do: ~d[2022-02]
  def stop(), do: ~d[2024-09-15]
  def construction_site_id_hh(), do: [393_350]

  def tags(), do: ["5N", "5", "rsw-bad-bramstedt"]

  def links(_assigns) do
    [
      {"Erläuterungen und Lagepläne aus einem anderen Verfahren", "März 2024",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/detailplaene-zweiter-abschnitt-848068"},
      {"Übersichtsseite Planung Radroute Plus Bad Bramstedt",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/themen/planen-bauen-wohnen/fachbereich-tiefbau/nachhaltige-mobilitaet/radroute-plus"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die vorhandenen <.ref>Hochbordradwege</.ref> sind rund 1,5m breit.</p>

    <h4>Planung</h4>
    <p>Im Zuge des Baus der U5 wird die Sengelmannstraße tiefer gelegt. Dabei werden auch die Radwege auf 2,0m verbreitert. In Richtung Flughafen bleiben unter der Brücke Engstellen – der Radweg wird hier 1,60m und der Fußweg 1,70m.</p>

    <p>Die <.v bounds="10.02215,53.608175,10.027486,53.61149" lon={10.023953} lat={53.610166} dir="backward" ref="rsw-bad-bramstedt">Ausfahrt aus der Nebenstraße</.v> verschiebt sich etwas nach Norden.</p>

    <h4>Meinung</h4>
    <p>Die verbleibende Engstelle ist ärgerlich, aber ohne Brückenneubau vermutlich nicht lösbar. Ansonsten sind die 2,0m Breite angenehm, auch wenn der gesamte Streckenzug asphaltierte Radwege verdient.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
