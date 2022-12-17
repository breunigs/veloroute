defmodule Data.Article.Blog.NiendorferStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-3-niendorfer-strasse"
  def created_at(), do: ~D[2018-10-13]

  def title(), do: "Niendorfer Straße (Veloroute 3)"

  def start(), do: ~d[2020-06-22]
  def stop(), do: ~d[2022-04-30]

  def type(), do: :finished
  def construction_site_id_hh(), do: [9604]
  def tags(), do: ["3"]

  def links(_assigns) do
    [
      {"Infoseite der Stadt zur Niendorfer Straße",
       "https://www.hamburg.de/eimsbuettel/niendorferstrasse/"},
      {"Abschnitt 1, Rütersbarg bis vor Bahnbrücke",
       "https://www.hamburg.de/contentblob/11283742/3f910482a9f157bba00f9ba2ec615297/data/karte1-niendorferstrasse.pdf"},
      {"Abschnitt 2, ab Bahnbrücke",
       "https://www.hamburg.de/contentblob/11283744/4d436df71d5d3133b686d459d9b7e9c5/data/karte2-niendorferstrasse.pdf"},
      {"Abschnitt 3, bis Kollaustraße",
       "https://www.hamburg.de/contentblob/11574420/bfee5024d06df69c42fc44cad2108df7/data/karte3-niendorferstrasse.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Aktuell ist die Niendorfer Straße für Radfahrende nicht gut befahrbar. Man hat die Wahl zwischen viel zu schmalen Fahrradwegen, die auf Höhe der Bahnbrücke im Nichts enden oder der Fahrbahn, wo man von KFZ in hohem Tempo knapp überholt wird.</p> <p>In Zukunft wird die Straße je nach Platz mit 1,5m breiten Schutzstreifen ausgestattet, stückweise auch als Radfahrstreifen (1,5m – 2,25m, je nach Platz). Nur im Bereich der Bahnbrücke ist der Querschnitt so schmal, das weiterhin Mischverkehr herrscht. Stadtauswärts erhält der Radverkehr hier keine optische Hilfe, sondern er muss sich sicher in die KFZ Spur einfädeln. Mir ist nicht klar, warum die Engstelle einseitig zu Lasten der Radfahrende so dargestellt wird.</p> <p>Am <.m bounds="9.954156,53.601367,9.955811,53.605998">Rütersbarg</.m> wird die Kreuzung durch einen Kreisel ersetzt. Das sollte das Linksabbiegen im Vergleich zu jetzt viel sicherer machen. Das man durch einen haltenden Bus hier stadteinwärts blockiert wird, sollte bei aktuell vier Bussen pro Tag verschmerzbar sein.</p> <p>Geplant ist die Maßnahme ab Frühjahr 2019 umzusetzen.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
