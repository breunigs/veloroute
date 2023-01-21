defmodule Data.Article.Blog.Reventlowstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-1-reventlowstrasse"
  def created_at(), do: ~D[2019-09-13]
  def updated_at(), do: ~D[2022-09-10]
  def title(), do: "Reventlowstraße (Veloroute 1)"

  def summary(),
    do:
      "Umplanung mischt gute (Kreisel, PBL) und schlechte (RiM, Schutzstreifen) Ideen. Vielfältige Führungsformen. Umbau nicht vor 2024."

  def type(), do: :planned
  def start(), do: ~d[2024-01-01]
  def stop(), do: ~d[2024-12-31]

  def tags(), do: ["1", "a12"]

  def links(_assigns) do
    [
      {"Baustellenkoordination", "September 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013155"},
      {"Lagepläne und Protokoll zur angepassten Planung", "Juni 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/to020.asp?TOLFDNR=1038941"},
      {"Neuerungen zur Planung", "August 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013065"},
      {"Erläuterungsbericht und Lagepläne des 1. Entwurfs", "November 2019",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1009394"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Historie – Stand September 2022</h4>
    <p>Die erste Infoveranstaltung fand im August 2018 statt, damals noch mit Baubeginn Mitte 2020. Durch die zwischenzeitliche Einigung des <.a href="https://radentscheid-hamburg.de/">Radentscheids Hamburg</.a> mit dem Senat wurde der Entwurf nochmals überarbeitet. Auch an diesem Entwurf gab es nach Hinweisen aus der Politik nochmals Detailänderungen. Der Artikel beschreibt den Zustand mit diesen Änderungen, die im veröffentlichten Lageplan noch nicht eingearbeitet sind.</p>

    <h4>Alter Zustand</h4>
    <p>Die Reventlowstraße enthält entlang der Veloroute kaum nutzbare <.ref>Hochbordradweg</.ref>-Stummel, die plötzlich <.v bounds="9.888232,53.554487,9.8942,53.558329" lon={9.889886} lat={53.556644} dir="backward" ref="1">aufhören (Richtung Süden)</.v> bzw. <.v bounds="9.888232,53.554487,9.8942,53.558329" lon={9.890289} lat={53.556447} dir="forward" ref="1">anfangen (Richtung Norden)</.v>. Im Wesentlichen muss der Radverkehr im <.ref>Mischverkehr</.ref> mit den KFZ fahren.</p>

    <p><.m bounds="9.889588,53.552041,9.891621,53.555267">Südlich</.m> der Veloroute gibt es keine eigenen Radwege. <.m bounds="9.887018,53.556982,9.890822,53.558946">Nördlich</.m> von ihr gibt es <.ref>Radfahrstreifen</.ref> ohne Sicherheitsabstand zu den KFZ-Parkplätzen.</p>

    <h4>Planung</h4>
    <p>Die Beschreibung folgt der Reventlowstraße von Norden nach Süden, wovon nur ein Teil zur Veloroute gehört.</p>

    <p>Vom <.m bounds="9.886485,53.557997,9.889442,53.559271">Statthalterplatz</.m> bis zur Einmündung <.v bounds="9.887982,53.556708,9.890939,53.557982" lon={9.889117} lat={53.557431} dir="backward" ref="1">Jungmannstraße</.v> sind knapp 2,5m breite Radwege im <.ref>Kopenhagener Stil</.ref> vorgesehen. Richtung Süden wird vor der Ampel auf KFZ-Fahrbahnhöhe abgeleitet und über eine gewöhnliche Furt quert man die Einmündung. In Fahrtrichtung Norden verschwenkt der Radweg um Platz für eine eigene Fahrrad-Linksabbiege-Spur zu machen. Diese befindet sich rechts der KFZ-Spuren und ist mittels Bordstein vor KFZ gesichert („<.ref>Protected-Bike-Lane</.ref>“). In der Jungmannstraße sind keine eigenen Flächen für's Rad vorgesehen, d.h. man fährt im Mischverkehr. Man darf auch weiterhin nur rechts abbiegen.</p>

    <p>Ab <.v bounds="9.887982,53.556708,9.890939,53.557982" lon={9.889541} lat={53.557273} dir="backward" ref="1">Jungmannstraße</.v> bis zur südlichen <.v bounds="9.88866,53.555953,9.891617,53.557227" lon={9.890025} lat={53.556633} dir="backward" ref="1">Walderseestraße</.v> sind mindestens 2,0m breite <.ref>Protected-Bike-Lanes</.ref> vorgesehen, wobei die vielen Querungsfurten natürlich ungesichert sind.  Von Norden kommend ist Linksabbiegen <em>in</em> die Walderseestraße nur <.ref>indirekt</.ref> möglich. <em>Aus</em> der Walderseestraße heraus gibt es in Richtung Süden eine eigene Radampel und Furt.</p>

    <p>Zwischen der <.v bounds="9.88866,53.555953,9.891617,53.557227" lon={9.890025} lat={53.556633} dir="backward" ref="1">Walderseestraße</.v> und der <.v bounds="9.888889,53.555143,9.891637,53.556976" lon={9.890694} lat={53.555403} dir="backward" ref="1">Olshausenstraße</.v> unterscheiden sich die Fahrtrichtungen deutlich. Nach Süden ist ein knapp 2,5m breiter Kopenhagener Radweg geplant, der hinter der Bushaltestelle entlang geführt wird. Die Fahrgäste warten sogesehen auf einer Insel, die via Zebrastreifen über den Radweg zu erreichen ist. In Richtung Norden fährt man vom Mischverkehr in einen <.ref>Radfahrstreifen in Mittellage</.ref>. Dieser wurde behalten, weil in anderen Varianten entweder ein KFZ-Rückstau von 1km erwartet wurde, oder nur sehr kurze Grünzeiten für Rad und Fuß möglich gewesen wären. Am Ende des Radfahrstreifen in Mittellage schließt ein <.ref>ARAS</.ref> von dem aus links in die Walderseestraße abgebogen werden kann.</p>

    <p>Die Einmündung der <.v bounds="9.889944,53.554384,9.89223,53.555793" lon={9.890809} lat={53.555308} dir="backward" ref="1">Emkendorfstraße</.v> wird zu einem kleinen Kreisel umgebaut. Dieser liegt so, dass niemand „geradeaus durchfahren“ kann. Die <.v bounds="9.889272,53.554601,9.891558,53.55601" lon={9.890809} lat={53.555308} dir="backward" ref="1">Olshausenstraße</.v> ist nicht an den Kreisel angeschlossen, sondern mündet als wartepflichtige Gehwegüberfahrt in die Reventlowstraße.</p>

    <p>Ab der <.v bounds="9.889944,53.554384,9.89223,53.555793" lon={9.890809} lat={53.555308} dir="backward" ref="1">Emkendorfstraße</.v> bis zum <.m bounds="9.889787,53.552122,9.891702,53.555348">Agathe-Lasch-Weg</.m>  ist in Richtung Süden ein 2,0m breiter <.ref>Hochbordradweg</.ref> geplant. Wer mag, kann auf der Spur mit den KFZ weiterfahren. In Richtung Norden ist ein 1,5m bis 1,9m breiter <.ref>Schutzstreifen</.ref> geplant, der durch zwei Bushaltestellen unterbrochen wird. Diese sind einmal <.m bounds="9.890444,53.554554,9.891444,53.555402">vorm neuen Kreisel</.m> und einmal vor der Einmündung <.m bounds="9.890385,53.552686,9.891384,53.553533">Roosens Weg</.m> geplant.</p>

    <p>Im <.m bounds="9.889674,53.551792,9.891431,53.552459">Halbmondsweg</.m> schließt sich in Richtung Süden ein 1,5m breiter Schutzstreifen-Stummel an, der an der Bushaltestelle endet. In Gegenrichtung gibt es zur Ampel hin einen <.ref>Radfahrstreifen</.ref>. Linksabbiegen ist von den eigenen Radwegen <.ref>indirekt</.ref> möglich. Wer rechtzeitig auf die KFZ-Spur wechselt, kann auch <.ref>direkt</.ref> abbiegen.</p>

    <p>Im <.m bounds="9.890411,53.552075,9.892168,53.552742">Agathe-Lasch-Weg</.m> sind in Richtung Kreuzung rund 2,0m breite Radfahrstreifen vorgesehen. In Richtung Osten ist dieser etwas länger, rund 2,25m breit und verläuft links der Bus-Haltebucht. Im <.m bounds="9.889062,53.552129,9.890819,53.552796">Klein Flottbeker Weg</.m> sind rund 1,9m breite Schutzstreifen vorgesehen, die jedoch wenig nach der Kreuzung aufhören.</p>

    <h4>Meinung</h4>
    <p>Die Planung bringt gute Ideen ein. Der Kreisel senkt die KFZ Geschwindigkeit und macht das Abbiegen an der Einmündung der Emkendorfstraße erstmals angenehm. Auch die Lösung zum Linksabbiegen in die Jungmannstraße kann sich sehen lassen. So bitter es klingt – dass man sich zum Linksabbiegen mit dem Fahrrad auch links aufstellt hat in Hamburg Seltenheitswert.</p>

    <p>Leider gibt es auch Schattenseiten, wie den Radfahrstreifen in Mittellage. Die Begründung ist schlüssig und läuft daraus hinaus, dass der ineffiziente KFZ-Verkehr sonst alle anderen Verkehrsarten behindern oder gar blockieren würde. Das Planungsbüro und die <.abbr>BVM</.abbr> bleiben eine Erklärung schuldig, wie der Radfahrstreifen bei KFZ-Stau freigehalten werden soll, wenn es an ähnlichen Stellen in Hamburg immer wieder zu Problemen kommt.</p>

    <p>Auch der Schutzstreifen ist lächerlich und kontraproduktiv, weil er dazu verleitet den 1,5m Überholabstand zu missachten.</p>

    <p>Für beide Probleme ist eine lokale Lösung unwahrscheinlich, wenn man die Straßenbäume erhalten möchte. Um den Busbetrieb nicht zu behindern müsste der KFZ-Rückstau also mittels Ampel o.ä. in unkritische Bereiche verlegt werden. Auch weiträumige, alternative Führungen wären denkbar. Schlussendlich stellt die Stadt die Bequemlichkeit des KFZ-Verkehrs hier über die Sicherheit des Radverkehrs – inakzeptabel.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
