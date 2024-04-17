defmodule Data.Article.Blog.JuethornstrasseUndRodigallee do
  use Article.Default

  def created_at(), do: ~D[2022-02-16]

  def title(), do: "Jüthornstraße und Rodigallee (West)"

  def summary(),
    do:
      "2,0m breite Radfahrstreifen, an Bushaltestellen andere Führungen. Mehr Bäume, mehr Radabstellplätze und eine Busspur stadteinwärts."

  def type(), do: :planned
  def tags(), do: ["rodigallee"]

  def start(), do: ~d[2023Q3]
  def stop(), do: ~d[2025Q3]

  def tracks(), do: Data.Article.Blog.RodigalleeUndBarsbuettlerStrasse.tracks()

  def links(_assigns) do
    [
      {"Detailanpassungen der Planung", "Dezember 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017917"},
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/resource/blob/784232/8b7c814f37565b25bee45400d429e88c/juethornstrasse-rodigallee-bovestrasse-bis-jenfelder-allee-abstimmungsunterlage-bericht-data.pdf"},
      {"Lageplan",
       "https://lsbg.hamburg.de/resource/blob/784234/8fea4149cf536d213d0a61aac9a7f9a3/juethornstrasse-rodigallee-bovestrasse-bis-jenfelder-allee-abstimmungsunterlage-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Stadtauswärts ist ein schmaler <.ref>Hochbordradweg</.ref> mit unterschiedlichen Belägen vorhanden. An Bäumen ist der Radweg teilweise unterbrochen. Stadteinwärts sollen sich Rad- und Fußverkehr den Weg teilen. Dem Autoverkehr stehen durchgängig vier Spuren in voller Breite zur Verfügung.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen beidseitig <.ref>Radfahrstreifen</.ref> von rund 2,0m Breite zu schaffen. Richtung Innenstadt wird eine Busspur eingerichtet. Die Fußwege erhalten unterschiedliche Breiten. KFZ steht mit zwei durchgängigen Spuren auch künftig weiterhin der meiste Platz zu.</p>

    <p>Es gibt einige Ausnahmen zu den Radfahrstreifen:</p>
    <ul>
      <li><.m bounds="10.086139,53.568539,10.089462,53.569009">Jüthornstraße Höhe Wandsbeker Gehölz</.m>: stadtauswärts wird der unbeleuchtete Radweg durch den Park aufgegeben. Nahe der Einmündung der Bovestraße ist hier ein kurzer Abschnitt Hochbordradweg vorgesehen, der mit rund 1,60m schmaler ausfällt.</li>
      <li>Im <.m bounds="10.083266,53.568074,10.086315,53.56884">südwestlichen Teil</.m> der Jüthornstraße ist der Radfahrstreifen stadtauswärts ebenfalls nur 1,60m breit. In Richtung Innenstadt ist <.ref>Mischverkehr</.ref> geplant. Um die Grünflächen besser zu verbinden, wird hier eine Querungshilfe gebaut.</li>
      <li>An den Bushaltestellen <.m bounds="10.089882,53.568479,10.092068,53.56891">AK Wandsbek</.m>, <.m bounds="10.098907,53.569248,10.100828,53.569935">Osterkamp</.m> und <.m bounds="10.114528,53.570824,10.116789,53.571218">Am Hohen Feld</.m> enden die Radfahrstreifen und man muss hinter den Bussen warten, oder auf den KFZ-Spuren überholen.</li>
      <li>An der Bushaltestelle <.m bounds="10.10347,53.570057,10.107078,53.570846">Universität der Bundeswehr</.m> wird stadteinwärts der Radweg als Hochbordradweg rechts der Busse und der Wartefläche der Fahrgäste vorbeigeführt. In Richtung stadtauswärts ist der Radfahrstreifen durchgängig und führt links der Busse vorbei.</li>
    </ul>

    <p>An Kreuzungen die heute schon eine Ampel haben, wird Abbiegen sowohl <.ref>direkt</.ref> als auch <.ref>indirekt</.ref> ermöglicht. Ausnahme: Wer von der Innenstadt kommend über die <.m bounds="10.085247,53.568467,10.086758,53.569183">Jüthornstraße in die Bovestraße</.m> links abbiegen möchte, muss dies über die KFZ-Spuren tun.</p>

    <p>Es werden weitere Bäume gepflanzt, allerdings auch einige Alte gefällt. Es sollen 61 Radanlehnbügel aufgestellt werden – bisher gab es keine.</p>

    <p>Die Planung schließt nahtlos an den Abschnitt <.a name="2022-03-17-rodigallee-und-barsbuettler-strasse">zwischen Jenfelder Allee und Öjendorfer Damm</.a> an. Die Bauplanung und -koordinierung für beide Teile soll dann gemeinsam stattfinden.</p>

    <h4>Meinung</h4>
    <p>Da ich die Straße nicht kenne, enthalte ich mich einer inhaltlichen Bewertung.</p>

    <p>Bemerkenswert ist die Argumentation für die Busspur: in ähnlichen Planungen schaute man auf die bisherigen Verkehrsstärken und entschied sich eher gegen Fuß/Rad/Bus und für KFZ. Hier wurde jedoch auch der langjährige Trend weg vom Auto berücksichtigt, wonach eine übermäßige Staubildung sich bald von alleine löst. Mit anderen Worten: man plant für die Zukunft, und nicht mehr für gestern.</p>

    <p>Kurios ist auch die Begründung, warum man auf Trennelemente zum KFZ-Verkehr verzichtet („<.ref>Protected-Bike-Lane</.ref>“): man möchte auch bei zugestauter KFZ- und Busspur noch einen Weg für Einsatzfahrzeuge von Polizei und Notärzten haben.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
