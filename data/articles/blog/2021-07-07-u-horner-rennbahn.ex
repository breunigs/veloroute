defmodule Data.Article.Blog.UHornerRennbahn do
  use Article.Default

  def created_at(), do: ~D[2021-07-07]

  def title(), do: "U4 Ausfädelung Horner Rennbahn (Alltagsroute 8)"

  def start(), do: ~d[2020-04-01]
  def stop(), do: ~d[2026-12-31]
  def construction_site_id_hh(), do: [7145]

  def type(), do: :construction

  def tags(), do: ["8"]

  def links(_assigns) do
    [
      {"Infoseite der Hochbahn zur U4 Horner Geest",
       "https://www.schneller-durch-hamburg.de/u4-horner-geest"},
      {"E-Mail Austausch mit der Polizei Hamburg (nicht öffentlich)"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Hintergrund</h4> <p> Die Baustelle um die Haltestelle „Horner Rennbahn“ ist notwendig, um die U4 hier auszufädeln und in Richtung <.m bounds="10.080345,53.554824,10.136024,53.567566">Horner Geest</.m> zu verlängern. Das passieren des Baustellenbereichs ist nur eingeschränkt möglich, teilweise muss geschoben werden. </p>
    <p>Dieser Abschnitt war vor dem Bau der U-Bahn für den Radverkehr ausgebaut. Entsprechend sind hier keine wesentlichen Änderungen zu erwarten.</p>
    <h4>Umleitung</h4> <p> Es wurde eine Umleitung eingerichtet, die die Baustelle großzügig umfährt. Leider muss am <.m bounds="10.081105,53.550073,10.088175,53.551692">Pagenfelder Platz</.m> auch auf dieser ein kurzes Stück geschoben werden. Die gedachte Führung ist nicht sofort ersichtlich und <em>anders</em> als im Video zu sehen: </p> <ul>
    <li>In Richtung Bergedorf soll auf der Pagenfelder Straße bis zur Kreuzung geschoben werden. Diese kann dann über die zwei Radampeln fahrend gequert werden.</li>
    <li>In Richtung Innenstadt quert man die Kreuzung zunächst normal und schiebt dann das Rad ein Stück die Rennbahnstraße hoch. An der Einmündung der Nebenstraße kann man wieder aufsteigen.</li>
    </ul>
    <h4>Meinung</h4> <p>Der Umleitung lässt sich gut folgen und die Schiebestrecke am <.m bounds="10.081105,53.550073,10.088175,53.551692">Pagenfelder Platz</.m> ist kürzer als die durch die Baustelle. Aufwendigere Maßnahmen um eine durchgehende Fahrt zu ermöglichen werden von der Polizei Hamburg mit Verweis auf die Verhältnismäßigkeit abgelehnt. Dies ist auf einer Hauptstrecke inakzeptabel, insbesondere da die Bauzeit mehrere Jahre beträgt.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
