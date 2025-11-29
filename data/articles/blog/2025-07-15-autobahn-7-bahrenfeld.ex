defmodule Data.Article.Blog.Autobahn7Bahrenfeld do
  use Article.Default

  def title(), do: "A7 Anschlussstelle Bahrenfeld (Radroute 7)"

  def summary(),
    do:
      "Beidseitig 2m breite Radfahrstreifen entlang der Hauptstraße. Fuß- und Radbrücke entlang des Autobahndeckels. Zufahrten von Straße zum Deckel kompliziert."

  def type(), do: :planned
  def tags(), do: ["radroute-7", "deckel-altona", "radroute-concept-b"]

  def links(_assigns) do
    [
      {"fertiger Entwurf – Bericht und Karten", ~d[2019-07],
       "https://fragdenstaat.de/anfrage/ausbau-a-7-umgestaltung-as-hh-bahrenfeld/#nachricht-1016122"}
    ]
  end

  def map_image do
    {name(),
     [
       {"DEGES", "https://www.deges.de/kontakt/"},
       {"ARGUS Stadt und Verkehr • Partnerschaft mbB", "https://www.argus-hh.de/kontakt-argus/"}
     ]}
  end

  def text(assigns) do
    assigns =
      assign(assigns,
        route_plan_path:
          [
            Settings.r(:video_serve_host),
            Settings.r(:video_serve_path),
            "map_images",
            "bab7-hh-bahrenfeld-fahrrad-beziehungen.webp"
          ]
          |> Util.compact()
          |> Path.join()
      )

    ~H"""
    <h4>Alter Zustand</h4>
    <p>Ursprünglich waren auf beiden Seiten <.ref>Hochbordradwege</.ref> vorhanden. Seit die Autobahn verbreitert wird, ändert sich die Verkehrsführung je nach Baufortschritt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Entlang der <.v bounds="9.897358,53.563978,9.9024,53.566304" lon={9.900019} lat={53.565144} dir="forward" ref={Radroute7}>Von-Sauer-Straße/Osdorfer</.v> Weg sind in beide Richtungen 2,0m breite <.ref>Radfahrstreifen</.ref> geplant. Diese sind ohne Trennelemente neben acht KFZ-Spuren.</p>

    <p><.v bounds="9.896166,53.564231,9.899738,53.566264" lon={9.897829} lat={53.565588} dir="backward" ref={Radroute7}>Im Westen</.v> sollen die Radfahrstreifen bis zur Kreuzung <.v bounds="9.896441,53.564997,9.898189,53.566208" lon={9.897491} lat={53.565673} dir="backward" ref={Radroute7}>Theodorstraße/Baurstraße</.v> so weitergeführt werden. <.v bounds="9.899702,53.56401,9.902137,53.565737" lon={9.900571} lat={53.564768} dir="forward" ref={Radroute7}>Im Osten</.v> wird dagegen von bzw. auf die vorhandenen Hochbordradwege aufgeleitet.</p>

    <p>Der Fahrt von der Straße auf den Autobahn-Deckel Altona soll vor jeder Autobahnrampe möglich sein. Dazu ist ein Wechsel auf den Gehweg notwendig, da es keine eigene Radführung gibt.</p>

    <p>Zum Queren der Hauptstraße in Nord-Süd Richtung bestehen zwei Möglichkeiten:</p>
    <ul>
      <li>eigene Fuß- und Radbrücke auf der Westseite, die beiden Seiten des Autobahndeckels miteinander verbindet.</li>
      <li>auf der Ostseite über zwei Verkehrsinseln, die jeweils mittig in den östlichen Rampen liegen. Durch diese abgesetzte Lage ergibt sich eine komplizierte Führung und Vorfahrtsregelung.</li>
    </ul>

    <p>Die Fahrt über die Verkehrsinseln ist daher vor allem für das „Linksabbiegen“ aus der Straße auf den Deckel und umgekehrt gedacht. Das Planungsbüro ARGUS hat zur Veranschaulichung der Wegbeziehungen diese Grafik erstellt:</p>

    <.a href={@route_plan_path} target="_blank">
      <img src={@route_plan_path} width="994" height="680" alt="Vorgesehene Wegbeziehungen Fahrrad nach Fertigstellung. Grob schematischer Plan. © ARGUS Stadt und Verkehr © DEGES" style="max-width: 100%; height: auto; margin-top: 0.5rem; margin-bottom: -0.5rem" title="Wegbeziehungen Fahrrad nach Fertigstellung.
    Schwarze Pfeile zeigen erlaubte Fahrtrichtung.
    © ARGUS Stadt und Verkehr
    © DEGES"/>
    </.a>

    <h4>Meinung</h4>
    <p>Ich hoffe, dass die Radfahrstreifen mit Trennelementen ausgestattet werden und so zu <.ref>Protected-Bike-Lanes</.ref> aufgewertet werden. Ansonsten ist die Ost-West Richtung  gelungen: alle Furten sind kurz und mit Ampeln geregelt. Es gibt genug Aufstellflächen an den Haltelinien und die Kurven erfordern kein Abbremsen.</p>

    <p>In Nord-Süd-Richtung ist die eigene Brücke eine attraktive Lösung um nicht durch den Autoverkehr aufgehalten zu werden. Dafür nimmt man auch die kurze Steigung gern in Kauf.</p>

    <p>Problematisch ist der Wechsel zwischen Straße und Deckel:</p>
    <ul>
      <li>Auf dem Deckel soll eine <.a ref={RadrouteConceptB}>neue Radroute</.a> entstehen. Alle Zufahrten als Gehwege (mit <.ref>Fahrrad frei</.ref>?) zu planen passt nicht zum eigenen Anspruch.</li>
      <li>Die Führung über die Verkehrsinseln ist umständlich und kompliziert. Ein Schilderwald soll's richten. Besser wäre eine geradlinige Furt, die man auf Anhieb versteht.</li>
      <li>Zum Linksabbiegen über die Brücke sind längere Umwege notwendig. Ob das in der Praxis  bequemer ist als die Furt mit ihren Ampeln, muss man ausprobieren.</li>
    </ul>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
