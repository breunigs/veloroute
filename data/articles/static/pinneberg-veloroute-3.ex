defmodule Data.Article.Static.PinnebergVeloroute3 do
  use Article.Static

  def id(), do: "pinneberg-3"
  def display_id(), do: "3"
  def route_group(), do: :alltag
  def title(), do: "Pinneberg: Veloroute 3"

  def color(), do: "#f19709"

  def summary(),
    do: "Veloroute 3 führt von Pinnebergs Zentrum nach Schenefeld"

  def tags(), do: [id(), "pinneberg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Pinneberg 3",
        direction: :forward,
        from: "Pinneberg Zentrum",
        to: "Schenefeld",
        parent_ref: __MODULE__,
        text: "vom Pinnebergs Zentrum nach Schenefeld",
        videos: [
          {"2022-02-27-pinneberg/GX013248", "00:00:21.622", "00:01:45.238"},
          {"2022-02-27-pinneberg/GX013249", :start, :end},
          {"2022-02-27-pinneberg/GX013250", :start, "00:02:30.183"},
          {"2022-02-27-pinneberg/GX013251", "00:00:00.100", "00:01:16.743"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Pinneberg 3",
        direction: :backward,
        from: "Schenefeld",
        to: "Pinneberg Zentrum",
        parent_ref: __MODULE__,
        text: "von Schenefeld zum Pinneberger Zentrum",
        videos: [
          {"2022-02-27-pinneberg/GX013230", "00:02:10.530", :end},
          {"2022-02-27-pinneberg/GX023230", :start, "00:00:16.984"},
          {"2022-02-27-pinneberg/GX013231", "00:00:01.435", "00:00:13.647"},
          {"2022-02-27-pinneberg/GX013231", "00:00:35.235", "00:01:14.141"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Broschüre zu Pinnebergs Velorouten", "2022, PDF",
       "https://web.archive.org/web/20220916120424if_/https://pinneberg.de/fileadmin/user_upload/faltblatt-veloroute-stand03-2022.pdf"},
      {"Stadt Pinneberg zur Ausschilderung",
       "https://www.pinneberg.de/leben-in-pinneberg?chash=6c835baef9601f60fe5950927b65f235&tx_news_pi1%5Baction%5D=detail&tx_news_pi1%5Bcontroller%5D=news&tx_news_pi1%5Bnews%5D=396&cHash=3a6be95e43c0e780cd932b199730ad9c"},
      {
        "ADFC zur Ausschilderung der Route",
        "https://adfc-pinneberg.de/verkehrspolitik/veloroute-3"
      }
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Pinneberg: Veloroute 3 <.icon>pinneberg-3</.icon></h3>
    <p><.v bounds="9.796296,53.653159,9.800581,53.66117" lon={9.797044} lat={53.659997} dir="forward" ref={@ref}>Am Drosteipark</.v> geht's los Richtung Süden. Nachdem man die <.v bounds="9.798059,53.652827,9.800852,53.65446" lon={9.799735} lat={53.653941} dir="forward" ref={@ref}>Bahn unterquert</.v> hat, folgt man dem Straßenzug <.v bounds="9.796403,53.644536,9.800322,53.653518" lon={9.798866} lat={53.652301} dir="forward" ref={@ref}>Osterholder Allee</.v>, <.v bounds="9.796403,53.644536,9.800322,53.653518" lon={9.797345} lat={53.647087} dir="forward" ref={@ref}>Manfred-von-Richthofen-Straße</.v> und <.v bounds="9.794695,53.621739,9.806465,53.644344" lon={9.802923} lat={53.636934} dir="forward" ref={@ref}>Datumer Chaussee</.v>. Über die <.v bounds="9.78915,53.613343,9.797765,53.618083" lon={9.793584} lat={53.615373} dir="forward" ref={@ref}>Straßenbrücke</.v> erreicht man das Ende der Route, wo Anschluss Richtung <.m bounds="9.809381,53.594338,9.842688,53.608967">Schenefeld</.m> besteht.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist vollständig ausgeschildert. Auch ohne Ortskenntnis ist ihr leicht zu folgen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Oberflächen entlang der Route sind wetterfest. In Pinneberg gibt es <.v bounds="9.796452,53.657659,9.796872,53.658646" lon={9.796623} lat={53.658473} dir="forward" ref={@ref}>Abschnitte mit Schrittgeschwindigkeit</.v>. An der <.v bounds="9.798059,53.652827,9.800852,53.65446" lon={9.799735} lat={53.653941} dir="forward" ref={@ref}>Bahnunterführung</.v> muss geschoben werden; sie ist auch für Lastenräder ungeeignet.</p>

    <h4>Meinung</h4>
    <p>Die Route hat Potenial, muss aber ausgebaut werden. Die Hauptprobleme sind:</p>
    <ul>
      <li>In Pinneberg führt die Strecke über eine Spielstraße, Fußwege, Hofeinfahrten und den Bahnhofsparkplatz. Keine dieser Wege ist für den Radverkehr geeignet, da dieser jeweils nur Gast ist und entsprechend langsam fahren muss.</li>
      <li>Die Bahnunterführung ist jetzt schon überlastet. Mit Anhänger oder Lastenrädern ist ein durchkommen nicht sicher.</li>
      <li>Die gemeinsamen Fuß/Radwege entlang der Datumer Chaussee sind häufig <.v bounds="9.802147,53.635808,9.808353,53.639729" lon={9.805097} lat={53.63791} dir="forward" ref="pinneberg-3">zu schmal</.v>. Mit einem Lastenrad ist Durchkommen schwierig bis unmöglich.</li>
      <li>Fehlerhafte Beschilderung an bebauten Abschnitten der Datumer Chaussee. Häufig <em>muss</em> man auf der <.ref>Fahrbahn</.ref> fahren, wird kurz darauf aber wieder auf einen gemeinsamen Fuß/Radweg gezwungen. Ohne Vorkenntnis der Strecke ist es kaum möglich sich korrekt zu verhalten.</li>
    </ul>
    <p>Als Maßnahmen sollte die Stadt die Routenführung im Innenstadtbereich überdenken und die Unterführung verbreitern. Der KFZ-Verkehr kann aus der Datumer Chaussee auf die Landstraße verlagert werden, was mit Pollern kostengünstig umgesetzt werden kann. Fuß, Rad und HVV müssen natürlich weiterhin passieren können.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
