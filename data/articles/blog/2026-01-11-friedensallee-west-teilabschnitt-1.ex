defmodule Data.Article.Blog.FriedensalleeWestTeilabschnitt1 do
  use Article.Default

  def title(), do: "Friedensallee – Abschnitt 1 um S-Bahrenfeld (Radroute 7)"

  def summary(),
    do:
      "Erstmals durchgängige Radinfra unter S-Bahrenfeld. Geplante Bezirksroute entlang der S-Bahn-Gleise erhält geradlinige Querung."

  def type(), do: :planned

  def start(), do: ~d[2026Q2]
  def stop(), do: ~d[2026Q4]

  def tags(), do: ["radroute-7"]

  def map_image do
    {name(),
     [
       {"Ingenieurbüro Münster GmbH", "https://ib-muenster.de/kontakt/"},
       {"Bezirksamt Altona – Fachamt öffentlicher Raum",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/altona/bezirksamt/dezernat-wirtschaft-bauen-umwelt-50986"}
     ]}
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf, Erläuterungen und Karte", ~d[2026-01],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1017549"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Direkt unter den Gleisen gibt es keine Radwege. Die Auf- bzw. Ableitungen sind schlecht zu erreichen bzw. gefährlich.</p>

    <p>Eine sinnvolle Querungsmöglichkeit von der <.v bounds="9.908384,53.558609,9.913369,53.560991" lon={9.909841} lat={53.560046} dir="backward" ref={Radroute7}>Hegarstraße</.v> zum Weg nördlich der Gleise besteht nicht. Hier soll später einmal eine neue Bezirksroute verlaufen.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Unter den Gleisen wird auf beiden Seiten ein rund 1,90m breiter <.ref>Schutzstreifen</.ref> aufgemalt. Davor bzw. danach schließen <.ref>Radfahrstreifen</.ref> an, die mit 1,65m bis 2,5m unterschiedlich breit ausfallen. Im <.v bounds="9.909312,53.558357,9.914296,53.560739" lon={9.91068} lat={53.559664} dir="backward" ref={Radroute7}>Osten (Innenstadtseite)</.v> überwiegen 1,6m, im Westen 1,75m.</p>

    <p>Die <.ref>Querungshilfe</.ref> mit Ampel direkt unter den Gleisen entfällt und wird durch Ampeln direkt an den Einmündungen <.v bounds="9.909312,53.558357,9.914296,53.560739" lon={9.910682} lat={53.559667} dir="backward" ref={Radroute7}>Friesenweg</.v> bzw. <.v bounds="9.908384,53.558609,9.913369,53.560991" lon={9.909841} lat={53.560046} dir="backward" ref={Radroute7}>Hegarstraße</.v> ersetzt. Letztere wird zu einer vollständigen Kreuzung ausgebaut, um die Friedensalle geradlinig queren zu können.</p>

    <p>Die Bushaltestellen sind künftig direkt gegenüber und von der S-Bahn aus gesehen „hinter“ der Hegarstraße. Sie unterbrechen jeweils die Radfahrstreifen. Wer sich auf der Fahrbahn einordnet, kann auch an wartenden Bussen vorbeiradeln.</p>

    <p>Am <.v bounds="9.906261,53.559422,9.911246,53.561803" lon={9.907959} lat={53.56086} dir="backward" ref={Radroute7}>westlichen Ende</.v> schließen die Radwege an die vorhandenen Hochbordradwege an. Siehe <.a ref={FriedensalleeWestTeilabschnitt2}>Planungsabschnitt 2</.a> für die dort angedachten Änderungen.</p>

    <h4>Meinung</h4>
    <p>Der Umbau steht seit 12 Jahren aus und spricht Bände wie wenig der Stadt am Radverkehr liegt. Immerhin sind die Standards heute höher als damals, was in der Planung berücksichtigt wurde.</p>

    <p>Gut sind die durchgehenden Radwege, auch wenn sie wegen der Enge unter den Gleisen nicht vom KFZ-Verkehr getrennt werden. Angesichts der massiven <.m bounds="9.898515,53.56287,9.926704,53.567214">Von-Sauer-Straße</.m> und <.m bounds="9.896272,53.552293,9.919763,53.558573">Behringstraße</.m> hätte man sich aber ruhig fragen dürfen, ob die Friedensalle als dritter Autobahnzubringer noch zeitgemäß ist.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
