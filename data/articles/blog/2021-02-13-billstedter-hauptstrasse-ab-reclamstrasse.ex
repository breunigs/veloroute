defmodule Data.Article.Blog.BillstedterHauptstrasseAbReclamstrasse do
  use Article.Default

  def created_at(), do: ~D[2021-02-13]
  def updated_at(), do: ~D[2021-02-19]
  def title(), do: "Billstedter Hauptstraße (Reclamstraße bis Billstedter Mühlenweg)"

  def start(), do: ~d[2022-01-31]
  def stop(), do: ~d[2023-01-31]
  def construction_site_id_hh(), do: [25103]

  def type(), do: :construction

  def tags(), do: ["radfahrstreifen", "8", "M6.1a"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Stand 19. Februar 2021:</h4>
    <p>Die Lagepläne wurden mittlerweile veröffentlicht. Der Artikel wurde entsprechend konkretisiert.</p>

    <h4>Alter Zustand</h4>
    <p>Die Veloroute wird im Abschnitt auf <.ref>Hochbordradwegen</.ref> geführt. Diese sind hier häufig uneben und zu schmal zum Überholen. Die Veloroute teilt sich an dieser Stelle in zwei Äste auf: in Fahrtrichtung <.m bounds="10.130434,53.528104,10.150129,53.530305">Mümmelmannsberg</.m> und über <.m bounds="10.162676,53.514149,10.167365,53.514713">Boberg</.m> nach <.m bounds="10.205741,53.489657,10.207563,53.490361">Bergedorf</.m>. Durch eine <.v bounds="10.107714,53.533153,10.11884,53.535732" lon={10.1134581} lat={53.5342123} dir="backward" ref={@ref}>Unterführung der Billstedter Hauptstraße</.v> erreichen Radfahrende die jeweils andere Straßenseite ohne Warten. Für die Fahrtbeziehung Innenstadt/Mümmelmannsberg bedeutet das eine vermeidbare Steigung.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen die Billstedter Straße neu aufzuteilen. Von den Häusern zur Straßenmitte ist die Nutzung bisher: Fußweg, Hochbordradweg, KFZ-Spur zum Parken, KFZ-Spur zum Fahren. Geplant ist sie in Fußweg, KFZ-Parken, <.ref>Radfahrstreifen</.ref>, KFZ-Spur zum Fahren zu ändern. Die Aufteilung ist dann vergleichbar mit <.v bounds="10.09812,53.537165,10.112144,53.540376" lon={10.1034174} lat={53.5395639} dir="backward" ref={@ref}>dem vorausgehenden Streckenabschnitt</.v>. Die Breite der Radfahrstreifen beträgt rund 2,0m, wobei zu parkenden Autos rund 0,5m Sicherheitsabstand gegen <.ref>Dooring</.ref> vorgesehen sind.</p>
    <p>An der <.v bounds="10.114349,53.532809,10.116558,53.533836" lon={10.1082492} lat={53.5371335} dir="forward" ref={@ref}>Bushaltestelle Billstedter Mühlenweg</.v> wird der Radfahrstreifen durch die Haltezone der Busse geführt. Der Radverkehr kann hier entweder hinter dem Bus warten, oder sich in den fließenden KFZ-Verkehr einordnen und vorbeifahren.</p>
    <p>Die Radfahrstreifen werden auch auf der Überführung weitergeführt, sodass der Radverkehr vom/zum Mümmelmannsberg nicht mehr durch die Senke fahren muss. Der Radfahrstreifen ist hier sogar rund 2,50m breit, erhält aber keine Trenner zu den KFZ Spuren.</p>
    <p>Die Rampen und die Unterführung werden ebenfalls ausgebessert. Die Rad- und Fußwege werden jeweils mindestens 2,0m breit. Die Teilstücke mit Gegenverkehr erhalten rund 4,0m Breite, wobei aufgemalte Richtungspfeile die Abbiegemöglichkeiten verdeutlichen.</p>


    <h4>Meinung</h4>
    <p>Die Planung wirkt stimmig und folgt dem Hamburger Standard. Die Fahrtbeziehung zum Mümmelmannsberg wurde stark verbessert.</p>
    <p>Im gleich aufgebauten, vorhergehenden Abschnitt verhindern häufiges Falschparken, aber auch normales Einparken eine angenehme Nutzung. In dieser Hinsicht stellt auch die neue Planung keine Lösung bereit. Es hängt rein am (Un)vermögen der Autofahrenden ob die Veloroute hier gut befahrbar wird.</p>
    <p>Da die Planung bereits im Frühjahr 2019 abgeschlossen war, wurde eine <.ref>Protected-Bike-Lane</.ref> vermutlich gar nicht geprüft. Diese vom <.a href="https://radentscheid-hamburg.de/">Radentscheid Hamburg</.a> bevorzugte Lösung verhindert solche Probleme effektiv.</p>

    <h4>Quelle</h4>
    <p>
    <.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/14892540/veloroute-08-ausbau/">Infoseite der Stadt zu Veloroute 8</.a> (Abschnitt „Billstedter Hauptstraße, von Reclamstraße bis Billstedter Mühlenweg“). Lagepläne am Ende der Seite.
    </p>
    """
  end
end
