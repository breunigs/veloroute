defmodule Data.Article.Static.PinnebergVeloroute3 do
  use Article.Static

  def id(), do: "pinneberg-3"
  def display_id(), do: "3"
  def route_group(), do: :alltag
  def title(), do: "Pinneberg: Veloroute 3"

  def color(), do: "#ec7f44"

  def summary(),
    do: "Veloroute 3 führt von Pinnebergs Zentrum nach Waldenau"

  def tags(), do: [id(), "pinneberg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 2,
        group: "Pinneberg 3",
        direction: :forward,
        from: "Pinneberg Zentrum",
        to: "Waldenau-Datum",
        parent_ref: __MODULE__,
        text: "vom Pinnebergs Zentrum nach Waldenau",
        videos: [
          {"2022-02-27-pinneberg/GX013248", "00:00:21.622", "00:01:45.238"},
          {"2022-02-27-pinneberg/GX013249", :start, :end},
          {"2022-02-27-pinneberg/GX013250", :start, "00:02:30.183"},
          {"2022-02-27-pinneberg/GX013251", "00:00:00.100", "00:00:52.452"}
        ]
      },
      %Video.Track{
        renderer: 2,
        group: "Pinneberg 3",
        direction: :backward,
        from: "Waldenau-Datum",
        to: "Pinneberg Zentrum",
        parent_ref: __MODULE__,
        text: "von Waldenau zum Pinneberger Zentrum",
        videos: [
          {"2022-02-27-pinneberg/GX013230", "00:02:27.748", :end},
          {"2022-02-27-pinneberg/GX023230", :start, "00:00:16.984"},
          {"2022-02-27-pinneberg/GX013231", "00:00:01.435", "00:00:13.647"},
          {"2022-02-27-pinneberg/GX013231", "00:00:35.235", "00:01:14.141"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {
        "ADFC zur Ausschilderung der Route",
        "https://adfc-pinneberg.de/verkehrspolitik/386-veloroute-3"
      }
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Pinneberg: Veloroute 3 <.icon>pinneberg-3</.icon></h3>
    <p><.m bounds="9.796296,53.653159,9.800581,53.66117" lon="9.797044" lat="53.659997" dir="forward">Am Drosteipark</.m> geht's los Richtung Süden. Nachdem man die <.m bounds="9.798059,53.652827,9.800852,53.65446" lon="9.799735" lat="53.653941" dir="forward">Bahn unterquert</.m> hat, folgt man dem Straßenzug <.m bounds="9.796403,53.644536,9.800322,53.653518" lon="9.798866" lat="53.652301" dir="forward">Osterholder Allee</.m>, <.m bounds="9.796403,53.644536,9.800322,53.653518" lon="9.797345" lat="53.647087" dir="forward">Manfred-von-Richthofen-Straße</.m> und <.m bounds="9.794695,53.621739,9.806465,53.644344" lon="9.802923" lat="53.636934" dir="forward">Datumer Chaussee</.m>. Über die <.m bounds="9.78915,53.613343,9.797765,53.618083" lon="9.793584" lat="53.615373" dir="forward">Straßenbrücke</.m> erreicht man das Ende der Route, wo Anschluss Richtung <.m bounds="9.809381,53.594338,9.842688,53.608967">Schenefeld</.m> besteht.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist vollständig ausgeschildert. Auch ohne Ortskenntnis ist ihr leicht zu folgen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Oberflächen entlang der Route sind wetterfest. In Pinneberg gibt es <.m bounds="9.796452,53.657659,9.796872,53.658646" lon="9.796623" lat="53.658473" dir="forward">Abschnitte mit Schrittgeschwindigkeit</.m>. An der <.m bounds="9.798059,53.652827,9.800852,53.65446" lon="9.799735" lat="53.653941" dir="forward">Bahnunterführung</.m> muss geschoben werden; sie ist auch für Lastenräder ungeeignet.</p>

    <h4>Meinung</h4>
    <p>Die Route hat Potenial, muss aber ausgebaut werden. Die Hauptprobleme sind:</p>
    <ul>
      <li>In Pinneberg führt die Strecke über eine Spielstraße, Fußwege, Hofeinfahrten und den Bahnhofsparkplatz. Keine dieser Wege ist für den Radverkehr geeignet, da dieser jeweils nur Gast ist und entsprechend langsam fahren muss.</li>
      <li>Die Bahnunterführung ist jetzt schon überlastet. Mit Anhänger oder Lastenrädern ist ein durchkommen nicht sicher.</li>
      <li>Die gemeinsamen Fuß/Radwege entlang der Datumer Chaussee sind häufig <.m bounds="9.802147,53.635808,9.808353,53.639729" lon="9.805097" lat="53.63791" dir="forward" ref="pinneberg-3">zu schmal</.m>. Mit einem Lastenrad ist Durchkommen schwierig bis unmöglich.</li>
      <li>Fehlerhafte Beschilderung an bebauten Abschnitten der Datumer Chaussee. Häufig <em>muss</em> man auf der <.ref>Fahrbahn</.ref> fahren, wird kurz darauf aber wieder auf einen gemeinsamen Fuß/Radweg gezwungen. Ohne Vorkenntnis der Strecke ist es kaum möglich sich korrekt zu verhalten.</li>
    </ul>
    <p>Als Maßnahmen sollte die Stadt die Routenführung im Innenstadtbereich überdenken und die Unterführung verbreitern. Der KFZ-Verkehr kann aus der Datumer Chaussee auf die Landstraße verlagert werden, was mit Pollern kostengünstig umgesetzt werden kann. Fuß, Rad und HVV müssen natürlich weiterhin passieren können.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
