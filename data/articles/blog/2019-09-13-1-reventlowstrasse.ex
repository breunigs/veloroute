defmodule Data.Article.Blog.Reventlowstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-1-reventlowstrasse"
  def created_at(), do: ~D[2019-09-13]
  def updated_at(), do: ~D[2024-02-22]
  def title(), do: "Reventlowstraße (Radroute 1)"

  def summary(),
    do:
      "Umplanung mischt gute (Kreisel, PBL) und schlechte (RiM, Schutzstreifen) Ideen. Vielfältige Führungsformen."

  def type(), do: :construction
  def start(), do: ~d[2024-03-01]
  def stop(), do: ~d[2024-12-18]

  def tags(), do: ["1", "a12"]

  def tracks(), do: Data.Article.Blog.EbertalleeSued.tracks()

  def links(_assigns) do
    [
      {"ADFC-Demo-Aufruf zum planmäßigen Umbau", "Februar 2024",
       "https://hamburg.adfc.de/neuigkeit/demo-aufruf-zum-24-februar-2024-fuer-den-planmaessigen-ausbau-der-veloroute-1"},
      {"Pressemitteilung Umbaustart", "Januar 2024",
       "https://web.archive.org/web/20240325043747/https://www.hamburg.de/altona/pressemitteilung/18105036/umbau-reventlowstrasse-veloroute/"},
      {"Erläuterungen und Lagepläne fertiger Entwurf", "Mai 2023",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1014063"},
      {"Baustellenkoordination", "September 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013155"},
      {"Lagepläne und Protokoll zur angepassten Planung", "Juni 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/to020.asp?TOLFDNR=1038941"},
      {"Neuerungen zur Planung", "August 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013065"},
      {"Erläuterungsbericht und Lagepläne des 1. Entwurfs", "November 2019",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1009394"},
      {"Infoseite der Stadt",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/altona/themen/verkehr/baustellen/reventlowstrasse-767752"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Reventlowstraße enthält entlang der Veloroute kaum nutzbare <.ref>Hochbordradweg</.ref>-Stummel, die plötzlich <.v bounds="9.888232,53.554487,9.8942,53.558329" lon={9.889886} lat={53.556644} dir="backward" ref="1">aufhören (Richtung Süden)</.v> bzw. <.v bounds="9.888232,53.554487,9.8942,53.558329" lon={9.890289} lat={53.556447} dir="forward" ref="1">anfangen (Richtung Norden)</.v>. Im Wesentlichen muss der Radverkehr im <.ref>Mischverkehr</.ref> mit den KFZ fahren.</p>

    <p><.v bounds="9.889299,53.552623,9.893132,53.555143" lon={9.890929} lat={53.554515} dir="forward" ref={@ref}>Südlich</.v> der Veloroute gibt es keine eigenen Radwege. <.v bounds="9.886457,53.556544,9.891256,53.559455" lon={9.888516} lat={53.558179} dir="backward" ref={@ref}>Nördlich</.v> von ihr gibt es <.ref>Radfahrstreifen</.ref> ohne ausreichenden Sicherheitsabstand zu den KFZ-Parkplätzen.</p>

    <h4>Planung</h4>
    <p>Die Beschreibung folgt der Reventlowstraße von Norden nach Süden, wovon nur ein Teil zur Veloroute gehört.</p>

    <p>Vom <.v bounds="9.885298,53.557602,9.890615,53.559872" lon={9.887118} lat={53.558906} dir="forward" ref={@ref}>Statthalterplatz</.v> bis zur Einmündung <.v bounds="9.887982,53.556708,9.890939,53.557982" lon={9.889117} lat={53.557431} dir="backward" ref="1">Jungmannstraße</.v> sind knapp 2,5m breite Radwege im <.ref>Kopenhagener Stil</.ref> vorgesehen. Richtung Süden wird vor der Ampel auf KFZ-Fahrbahnhöhe abgeleitet und über eine gewöhnliche Furt quert man die Einmündung. In Fahrtrichtung Norden verschwenkt der Radweg um Platz für eine eigene Fahrrad-Linksabbiege-Spur zu machen. Diese befindet sich rechts der KFZ-Spuren und ist mittels Bordstein vor KFZ gesichert („<.ref>Protected-Bike-Lane</.ref>“). In der Jungmannstraße sind keine eigenen Flächen für's Rad vorgesehen, d.h. man fährt im Mischverkehr. Man darf auch weiterhin nur rechts abbiegen.</p>

    <p>Ab <.v bounds="9.887982,53.556708,9.890939,53.557982" lon={9.889541} lat={53.557273} dir="backward" ref="1">Jungmannstraße</.v> bis zur südlichen <.v bounds="9.88866,53.555953,9.891617,53.557227" lon={9.890025} lat={53.556633} dir="backward" ref="1">Walderseestraße</.v> sind mindestens 2,0m breite <.ref>Protected-Bike-Lanes</.ref> vorgesehen, wobei die vielen Querungsfurten natürlich ungesichert sind.  Von Norden kommend ist Linksabbiegen <em>in</em> die Walderseestraße nur <.ref>indirekt</.ref> möglich. <em>Aus</em> der Walderseestraße heraus gibt es in Richtung Süden eine eigene Radampel und Furt.</p>

    <p>Zwischen der <.v bounds="9.88866,53.555953,9.891617,53.557227" lon={9.890025} lat={53.556633} dir="backward" ref="1">Walderseestraße</.v> und der <.v bounds="9.888889,53.555143,9.891637,53.556976" lon={9.890694} lat={53.555403} dir="backward" ref="1">Olshausenstraße</.v> unterscheiden sich die Fahrtrichtungen deutlich. Nach Süden ist ein knapp 2,5m breiter Kopenhagener Radweg geplant, der hinter der Bushaltestelle entlang geführt wird. Die Fahrgäste warten auf einer Insel, die über den Radweg zu erreichen ist. Ein Zebrastreifen ist nicht geplant. In Richtung Norden fährt man vom Mischverkehr in einen <.ref>Radfahrstreifen in Mittellage</.ref>. Dieser wurde behalten, weil in anderen Varianten entweder ein KFZ-Rückstau von 1km erwartet wurde, oder nur sehr kurze Grünzeiten für Rad und Fuß möglich gewesen wären. Am Ende des Radfahrstreifen in Mittellage schließt ein <.ref>ARAS</.ref> von dem aus links in die Walderseestraße abgebogen werden kann.</p>

    <p>Die Einmündung der <.v bounds="9.889944,53.554384,9.89223,53.555793" lon={9.890809} lat={53.555308} dir="backward" ref="1">Emkendorfstraße</.v> wird zu einem kleinen Kreisel umgebaut. Dieser liegt so, dass niemand „geradeaus durchfahren“ kann. Die <.v bounds="9.889272,53.554601,9.891558,53.55601" lon={9.890809} lat={53.555308} dir="backward" ref="1">Olshausenstraße</.v> ist nicht an den Kreisel angeschlossen, sondern mündet als wartepflichtige Gehwegüberfahrt in die Reventlowstraße.</p>

    <p>Ab der <.v bounds="9.889944,53.554384,9.89223,53.555793" lon={9.890809} lat={53.555308} dir="backward" ref="1">Emkendorfstraße</.v> bis zum <.v bounds="9.887867,53.55121,9.896228,53.555653" lon={9.89049} lat={53.552761} dir="forward" ref={@ref}>Agathe-Lasch-Weg</.v>  ist in Richtung Süden ein 2,0m breiter <.ref>Hochbordradweg</.ref> geplant. Wer mag, kann auf der Spur mit den KFZ weiterfahren. In Richtung Norden ist ein 1,5m bis 1,9m breiter <.ref>Schutzstreifen</.ref> geplant, der durch zwei Bushaltestellen unterbrochen wird. Diese sind einmal <.v bounds="9.889773,53.554201,9.892492,53.555893" lon={9.890966} lat={53.554956} dir="backward" ref={@ref}>vorm neuen Kreisel</.v> und einmal vor der Einmündung <.v bounds="9.88942,53.552152,9.892672,53.554388" lon={9.890926} lat={53.553042} dir="backward" ref={@ref}>Roosens Weg</.v> geplant.</p>

    <p>Im <.v bounds="9.888738,53.549045,9.891596,53.553218" lon={9.890401} lat={53.552599} dir="forward" ref={@ref}>Halbmondsweg</.v> schließt sich in Richtung Süden ein 1,5m breiter Schutzstreifen-Stummel an, der an der Bushaltestelle endet. In Gegenrichtung gibt es zur Ampel hin einen <.ref>Radfahrstreifen</.ref>. In Nord-Süd-Richtung sind Aufstelltaschen in der Kreuzung zum <.ref>indirekten Abbiegen</.ref> vorgesehen. Linksabbiegen ist in Ost-West-Richtung über <.ref name="lexikon/aras">Aufstellflächen vor den KFZ</.ref> nur <.ref>direkt</.ref> möglich.</p>

    <p>Im <.m bounds="9.890411,53.552075,9.892168,53.552742">Agathe-Lasch-Weg</.m> sind in Richtung Kreuzung rund 2,0m breite Radfahrstreifen vorgesehen. In Richtung Osten ist dieser etwas länger, rund 2,25m breit und verläuft links der Bus-Haltebucht. Im <.m bounds="9.889062,53.552129,9.890819,53.552796">Klein Flottbeker Weg</.m> sind rund 1,9m breite Schutzstreifen vorgesehen, die jedoch wenig nach der Kreuzung aufhören.</p>

    <h4>Meinung</h4>
    <p>Die Planung bringt gute Ideen ein. Der Kreisel senkt die KFZ Geschwindigkeit und macht das Abbiegen an der Einmündung der Emkendorfstraße erstmals angenehm. Auch die Lösung zum Linksabbiegen in die Jungmannstraße kann sich sehen lassen. So bitter es klingt – dass man sich zum Linksabbiegen mit dem Fahrrad auch links aufstellt hat in Hamburg Seltenheitswert.</p>

    <p>Leider gibt es auch Schattenseiten, wie den Radfahrstreifen in Mittellage. Die Begründung ist schlüssig und läuft daraus hinaus, dass der ineffiziente KFZ-Verkehr sonst alle anderen Verkehrsarten behindern oder gar blockieren würde. Das Planungsbüro und die <.abbr>BVM</.abbr> bleiben eine Erklärung schuldig, wie der Radfahrstreifen bei KFZ-Stau freigehalten werden soll, wenn es an ähnlichen Stellen in Hamburg immer wieder zu Problemen kommt.</p>

    <p>Auch der Schutzstreifen ist lächerlich und kontraproduktiv, weil er dazu verleitet den 1,5m Überholabstand zu missachten.</p>

    <p>Für beide Probleme ist eine lokale Lösung unwahrscheinlich, wenn man die Straßenbäume erhalten möchte. Um den Busbetrieb nicht zu behindern müsste der KFZ-Rückstau also mittels Ampel o.ä. in unkritische Bereiche verlegt werden. Auch weiträumige, alternative Führungen wären denkbar. Schlussendlich stellt die Stadt die Bequemlichkeit des KFZ-Verkehrs hier über die Sicherheit des Radverkehrs – inakzeptabel.</p>

    <h4>Umbauzeitraum</h4>
    <p>Wegen dem Umbau der Elbchaussee und des A7-Deckels steht ein genauer Zeitraum noch aus. Der Teil südlich der Walderseestraße könnte 2024 umgesetzt werden, wenn auf der Elbchaussee gerade nicht gebaut wird. Für den nördlichen Teil wird noch abgestimmt. Sollte sich der Umbau verzögern, ist eine Zwischenlösung mit Radfahrstreifen angedacht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
