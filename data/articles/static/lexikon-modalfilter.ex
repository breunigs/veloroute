defmodule Data.Article.Static.LexikonModalfilter do
  use Article.Static

  def name(), do: "lexikon/modalfilter"
  def title(), do: "Lexikon · Modalfilter"

  def summary(),
    do:
      "Modalfilter verhindern die Benutzung eines Weges von bestimmten Verkehrsarten, z.B. mit dem Auto."

  def tags(), do: ["lexikon", "modalfilter", "diagonaltrenner"]

  def tracks(), do: Data.Article.Static.Alltagsroute1.tracks()
  def point_of_interest(), do: %{lon: 9.947352, lat: 53.555635, zoom: 16}

  def links(_assigns),
    do: [
      {"Wikipedia: Modale Filter", "https://de.wikipedia.org/wiki/Modale_Filter"},
      {"Wikipedia: Umlaufgitter", "https://de.wikipedia.org/wiki/Umlaufgitter"}
    ]

  def text(assigns) do
    ~H"""
    <.roaddiagram src="modalfilter" width={450} alt="Vogelperspektive auf eine Straße mit Diagonaltrenner mit Pollern" class="right"/>

    <p>Als Modalfilter bezeichnet man eine Sperre, die nur bestimmte Verkehrsarten zulässt und andere verhindert. Am häufigsten sind dabei Poller: zu Fuß oder mit dem Fahrrad kommt man vorbei, mit breiteren Fahrzeugen wie KFZ oder LKW aber nicht.</p>

    <p>Es gibt viele Varianten einen Modalfilter umzusetzen, eine perfekte Trennung wird aber selten erreicht. Sollen breitere Lastenräder weiterhin durchkommen, klappt das auch für schmale Autos. Das gilt auch bei Gehwegen – so machen Drängelgitter/Umlaufsperren oder Bordsteine das Radfahren dort unpraktisch. Allerdings blockieren sie ggf. auch Kinderwägen oder Rollstühle. Sofern die meisten unerwünschten Verkehrsarten herausgehalten werden, erfüllen sie aber trotzdem ihren Zweck.</p>

    <p>Zusätzlich zu den tatsächlichen Barrieren werden Modalfilter durch Designelemente und Schilder ergänzt. Diese verdeutlichen die Situation, sodass man sie sofort begreift und richtig handelt.</p>

    <h4>Videobeispiele</h4>
    <ul>
      <li><.v bounds="9.951557,53.554391,9.958316,53.558577" lon={9.955632} lat={53.557137} dir="forward" ref="1">Durchfahrtssperre mit Mittelpollern</.v></li>
      <li><.v bounds="9.944846,53.554877,9.948685,53.556694"  lon={9.947466} lat={53.555622} dir="forward" ref="1">Diagonaltrenner</.v></li>
      <li><.v bounds="9.793949,53.570801,9.806231,53.57836" lon={9.801412} lat={53.572963} dir="forward" ref="1">Drängelgitter/Umlaufsperre</.v></li>
    </ul>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref}/>
    """
  end
end
