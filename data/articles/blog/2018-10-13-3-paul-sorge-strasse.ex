defmodule Data.Article.Blog.PaulSorgeStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-3-paul-sorge-strasse"
  def created_at(), do: ~D[2018-10-13]

  def title(), do: "Paul-Sorge-Straße (Veloroute 3)"

  def start(), do: ~d[2020-09-07]
  def stop(), do: ~d[2022-06-30]

  def type(), do: :construction
  def construction_site_id_hh(), do: [11126]
  def tags(), do: ["3"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds="9.949604,53.621327,9.953476,53.640349">Paul-Sorge-Straße</.m> besitzt momentan beidseitig schmale Hochbordradwege von nur ca. 1m Breite. In Zukunft soll der Radverkehr stattdessen auf 1,5m breiten Schutzstreifen geführt werden.</p>
    <p>
    Die Kreuzungen sind jeweils unterschiedlich geplant.<br>
    <.m bounds="9.949767,53.623506,9.954832,53.623924">An der Lohe</.m>: „klassische Kreuzung“, direktes Abbiegen nur im KFZ-Mischverkehr. Die Fahrradspuren reichen aber bis zur Haltelinie.<br>
    <.m bounds="9.943965,53.628192,9.950354,53.629057">Joachim-Mähl-Straße</.m>/<.m bounds="9.949783,53.629057,9.953655,53.629601">Johannkamp</.m>: jeweils mit Aufstellbereichen für Fahrräder vor den KFZ an der Ampel.<br>
    Der <.m bounds="9.952631,53.548139,10.071319,53.633413">Krähenweg</.m> erhält ebenfalls einen Aufstellbereich; Linksabbieger aus der <.m bounds="9.949604,53.621327,9.953476,53.640349">Paul-Sorge-Straße</.m> erhalten eine eigene Wartebucht für indirektes Linksabbiegen. Die Ampel bleibt.<br>
    <.m bounds="9.944989,53.638293,9.954121,53.64797">Nordalbingerweg</.m>/<.m bounds="9.951993,53.640167,9.959454,53.640945">Emmy-Beckmann-Weg</.m>: die Fahrradspur reicht bis zur Ampel und ist im Vergleich zu den KFZ etwas vorgezogen. Einen vergrößerten Aufstellbereich gibt es aber nicht. Die Kreuzung ist nicht Teil der Umplanung und die Wege werden nur in den Bestand übergeführt. Rechtsabbiegen bei Rot ist nicht vorgesehen.</p>
    <p>Alle anderen Einmündungen und Kreuzungen haben keine eigenen Radspuren und es wird im Mischverkehr abgebogen. Die Paul-Sorge-Straße hat jeweils Vorfahrt.
    </p>
    <p>Gegenüber dem <.m bounds="9.945263,53.627268,9.950438,53.627994">Seesrein</.m> sowie zwischen <.m bounds="9.952383,53.633035,9.962823,53.635846">Schippelsweg</.m> und <.m bounds="9.939061,53.636829,9.949023,53.640125">Viehlohweg</.m> werden neue StadtRAD Stationen gebaut. Die Anzahl der Abstellbügel für private Fahrräder erhöht sich entlang der gesamten Straße.</p> <p>Geplant ist die Maßnahme ab Herbst 2019 in drei Teilabschnitten umzusetzen (<.m bounds="9.949767,53.623506,9.954832,53.623924">An der Lohe</.m> → <.m bounds="9.943965,53.628192,9.950354,53.629057">Joachim-Mähl-Straße</.m> → <.m bounds="9.944989,53.638293,9.954121,53.64797">Nordalbingerweg</.m>). Ursprünglich war Frühjahr 2019 angedacht, was sich aber offenbar <.a href="https://www.niendorfer-wochenblatt.de/2019/03/27/veloroute-3-kommt-nach-niendorf/">durch Nachbesserungen am Plan</.a> verschob.</p>
    <ul>
    <li><.a href="https://www.hamburg.de/eimsbuettel/paulsorgestrasse/">Infoseite der Stadt zur Paul-Sorge-Straße</.a></li>
    <li><.a href="https://www.hamburg.de/contentblob/11687976/5b8b69991f6e66c19d033be1ca914e1a/data/planung-paulsorgestrasse20180827.pdf">Präsentation mit Planausschnitten</.a></li>
    </ul>
    """
  end
end
