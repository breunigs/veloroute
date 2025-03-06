defmodule Data.Article.Blog.MaxBrauerAlleeNord do
  use Article.Default

  def title(),
    do:
      "Max-Brauer-Allee (Sternbrücke bis Schulterblatt, Radroute 14 und Bezirksroute Eimsbüttel Süd)"

  def summary(),
    do:
      "Radweg soll beidseitig breiter werden. Südseite meist als Kopenhagener Radweg, Nordseite klassisch Hochbord. An Kreuzungen indirektes Linksabbiegen."

  def start(), do: ~d[2027]

  def type(), do: :planned
  def tags(), do: ["radroute-14", "radroute-concept-c", "br-eimsbuettel-sued"]

  def links(_assigns) do
    [
      {"Öffentlichkeitsbeteiligung zur Umgestaltung", ~d[2025-03],
       "https://max-brauer-allee.beteiligung.hamburg/#/"}
    ]
  end

  def map_image do
    {name(), [{"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def text(assigns) do
    ~H"""
    <h4>Mitmach-Möglichkeit</h4>
    <p>Der LSBG lädt bis zum 2. April 2025 zum Mitmachen ein: <.a href="https://max-brauer-allee.beteiligung.hamburg/">max-brauer-allee.beteiligung.hamburg</.a>. Dort finden sich auch Details zur Planung in Text, Bild und Videos.</p>

    <h4>Alter Zustand</h4>
    <p>Beidseitig sind <.ref>Hochbordradwege</.ref> vorhanden, die mit altem Betonsteinpflaster befestigt sind. Um das Schulterblatt herum sind die Gehwege häufig überlastet, sodass auch auf dem Radweg gelaufen bzw. gewartet wird.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der <.v bounds="9.95435,53.560863,9.968778,53.566964" lon={9.960515} lat={53.564046} dir="backward" ref="radroute-14">nördliche Hochbordradweg</.v> bleibt erhalten und wird auf meist 2,5m verbreitert. Nur an den Anschlüssen (von Altonaer Straße bzw. Richtung Sternbrücke) bleibt es bei den alten Maßen mit rund 1,6m. Auch der <.v bounds="9.95435,53.560863,9.968778,53.566964" lon={9.959661} lat={53.56371} dir="backward" ref="radroute-14">Gehweg vor der Gastro</.v> wird breiter.</p>

    <p>Auf der <.v bounds="9.95435,53.560863,9.968778,53.566964" lon={9.956142} lat={53.56183} dir="forward" ref="radroute-14">Südseite</.v> wird ein rund 2,4m breiter <.ref>Kopenhagener Radweg</.ref> vorgeschlagen. An Einfahrten wird dieser etwas schmaler, um einen abgesenkten Bordstein unterbringen zu können. <.v bounds="9.956509,53.562078,9.964197,53.564985" lon={9.959469} lat={53.563467} dir="forward" ref="radroute-14">Kurz vorm Schulterblatt</.v> wechselt die Führung zu einem Hochbordradweg, der hinter der Bushaltestelle vorbeiführt. Dadurch kann der Radweg auch <.v bounds="9.956509,53.562078,9.964197,53.564985" lon={9.960829} lat={53.563873} dir="forward" ref="radroute-14">vorm Supermarkt</.v> 2,5m breit bleiben.</p>

    <p>An den Kreuzungen sind jeweils Rampen geplant, um auf die Höhe der Fahrbahn zu kommen. Von den Radwegen kommend ist immer nur <.ref>indirektes Linksabbiegen</.ref> vorgesehen. An <.v bounds="9.953774,53.561031,9.960769,53.565069" lon={9.957516} lat={53.562498} dir="forward" ref="radroute-14" highlight="Langenfelder Straße,Lippmannstraße">Langenfelder- und Lippmannstraße</.v> werden Trittbretter installiert, sodass man bei roter Ampel nicht unbedingt absteigen muss.</p>

    <p>Die im Schulterblatt teilweise vorhandenen <.ref>Schutzstreifen</.ref> und Aufstellbereiche vor den KFZ vorgesehen (<.ref>ARAS</.ref>) bleiben erhalten. Sie sollen aber rot eingefärbt werden.</p>

    <h4>Meinung</h4>
    <p>Gut, aber nicht richtungsweisend. Dazu müsste man die Radwege konsequent asphaltieren statt wieder Betonpflaster zu verbauen, was schnell hubbelig wird. Außerdem bremst man den Radverkehr weiter mit Ampeln aus, die nur wegen der Autos notwendig sind. Am Schulterblatt soll sogar die geteilte Rad/Fuß-Ampel bleiben und damit unnötig lange Rotzeiten für den Radverkehr verursachen.</p>

    <p>Zumindest an <.v bounds="9.953774,53.561031,9.960769,53.565069" lon={9.957516} lat={53.562498} dir="forward" ref="radroute-14" highlight="Langenfelder Straße,Lippmannstraße">Langenfelder- und Lippmannstraße</.v> wäre durch KFZ-Einbahnstraßen eine ampelfreie Lösung denkbar. Mit einer Mittelinsel in der Max-Brauer-Allee bleibt auch das Queren zu Fuß und auf dem Rad einfach.</p>

    <p>Am Schulterblatt scheitert ein Kreisverkehr offenbar an zu vielen KFZ. Es drängt sich die Frage auf, ob mit mehr Stadtentwicklung – außerhalb des Planungsgebiets – der KFZ-Verkehr genug reduziert werden könnte. Immerhin ist die Sternschanze von Hauptstraßen umgeben, was eine Durchfahrt für private Fahrten entbehrlich macht. Das müsste von den Bezirken vorangetrieben werden, da es deutlich über die reine Verkehrsplanung hinausgeht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
