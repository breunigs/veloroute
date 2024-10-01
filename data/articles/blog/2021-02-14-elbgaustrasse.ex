defmodule Data.Article.Blog.Elbgaustrasse do
  use Article.Default

  def created_at(), do: ~D[2021-02-14]
  def updated_at(), do: ~D[2023-06-23]

  def title(), do: "Elbgaustraße (Veloroute 14)"

  def summary(),
    do:
      "2,0m breite Hochbordradwege. An Engstellen soll auf Fahrbahn gewechselt werden; Gehwege bleiben mit Schritttempo erlaubt."

  def start(), do: ~d[2025-03]
  def stop(), do: ~d[2026-07]

  def type(), do: :planned

  def tags(), do: ["hochbordradweg", "fahrrad-frei", "14"]

  def links(_assigns) do
    [
      {"Detailänderungen zum Baumerhalt – Lageplan", "Juni 2024",
       "https://lsbg.hamburg.de/resource/blob/906186/4468a3a4efb7d00eea19b180dd5b57a5/veloroute-14-elbgaustrasse-abgestimmte-planung-nachtrag-plaene-data.pdf"},
      {"Detailänderungen zum Baumerhalt – Bericht", "Juni 2024",
       "https://lsbg.hamburg.de/resource/blob/906172/cbb53d355a8491f033f70b70d16bb9b9/veloroute-14-elbgaustrasse-abgestimmte-planung-nachtrag-bericht-data.pdf"},
      {"Detailänderungen zum Baumerhalt – Präsentation", "November 2023",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008876"},
      {"fertiger Entwurf – Bericht", "Juni 2023",
       "https://lsbg.hamburg.de/resource/blob/783058/ca6d36dd7901cbd4a3f191c60e20e73c/veloroute-14-elbgaustrasse-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf – Pläne", "Juni 2023",
       "https://lsbg.hamburg.de/resource/blob/783060/ab2628bd747dbdc044b10fbda17415ed/veloroute-14-elbgaustrasse-abgestimmte-planung-plaene-data.pdf"},
      {"Infoseite des LSBG", "https://lsbg.hamburg.de/elbgaustrasse"},
      {"Beteiligungsverfahren Elbgaustraße", "Februar 2021",
       "https://elbgaustrasse.beteiligung.hamburg/"},
      {"1. Entwurf", "Februar 2021, veraltet",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1011035"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Juni 2023</h4>
    <p>Der fertige Entwurf wurde veröffentlicht. Der Artikel wurde entsprechend angepasst. Die Führung an den Bushalten S-Elbgaustraße wurde überarbeitet und erfolgt jetzt auch auf Hochbordradwegen. An Engstellen soll der Radverkehr bevorzugt auf die Fahrbahn wechseln; die Gehwege dürfen nur noch im Schritttempo befahren werden („<.ref>Fahrrad frei</.ref>“). Die Stadt versäumt damit eine durchgängige Veloroute zu schaffen – schade.</p>

    <h4>Alter Zustand</h4>
    <p>Die Veloroute wird meist auf <.ref>Hochbordradwegen</.ref> geführt. Sie sind unterschiedlich breit und zwischen <.v bounds="9.86729,53.590468,9.889278,53.595495" lon={9.881915} lat={53.5924746} dir="forward" ref={@ref}>1,50m</.v> und <.v bounds="9.879594,53.600217,9.901582,53.605243" lon={9.8920342} lat={53.6029526} dir="forward" ref={@ref}>70 cm</.v> ist alles dabei. Die Radwege werden durch <.v bounds="9.879594,53.600217,9.901582,53.605243" lon={9.8927414} lat={53.6034238} dir="backward" ref={@ref}>Bushaltestellen geführt</.v>, vor Kreuzungen zu <.v bounds="9.871183,53.589339,9.893171,53.594367" lon={9.8823888} lat={53.59287} dir="forward" ref={@ref}>gemeinsamen Fuß- und Radwegen</.v> oder an <.v bounds="9.88384,53.602302,9.905828,53.607329" lon={9.895432} lat={53.604179} dir="forward" ref={@ref}>Engstellen zu einem „Fahrrad frei“</.v>. Altersbedingt sind die Radwege eher uneben und daher schlecht zu befahren.</p>

    <h4>Planung</h4>
    <p>Der erste Entwurf sieht von der <.v bounds="9.871325,53.587523,9.885014,53.590653" lon={9.8775202} lat={53.5894187} dir="forward" ref={@ref}>Elly-See-Straße</.v> bis <.v bounds="9.885822,53.600751,9.89364,53.602538" lon={9.8900402} lat={53.601743} dir="forward" ref={@ref}>kurz vor den Eisenbahnbrücken</.v> durchgehende, 2,0m breite <.ref>Hochbordradwege</.ref> vor (LSBG Lagepläne 1 bis 5).</p>
    <p>Vor den Brücken endet der Radweg. Der Radverkehr darf wahlweise auf der Fahrbahn im <.ref>Mischverkehr</.ref> oder im Schritttempo auf dem Gehweg weiterfahren. Im Bereich der <.v bounds="9.889175,53.602158,9.899717,53.604568" lon={9.8926452} lat={53.6033872} dir="backward" ref={@ref}>Bushaltestellen S-Elbgaustraße</.v> sind wieder 2,0m breite Hochbordradwege geplant. Sie enden kurz nach dem Redingskamp; wieder mit Wahl ob Fahrbahn oder Gehweg. (LSBG Lagepläne 5 und 6).</p>

    <p><strong><.v bounds="9.875161,53.591657,9.889322,53.594896" lon={9.8828454} lat={53.5937188} dir="backward" ref={@ref}>Kreuzung Farnhornweg</.v>:</strong> Die Radwege verlaufen nun hinter den Bushaltestellen, sodass man beim Ein-/Aussteigen nicht sofort auf dem Radweg steht. Der <.v bounds="9.875161,53.591657,9.889322,53.594896" lon={9.8828463} lat={53.5932706} dir="forward" ref={@ref}>freie Rechtsabbieger</.v> aus dem Farnhornweg bleibt teilweise erhalten, wird aber mit einer Ampel gesichert. Für Radfahrende, die die Veloroute hier nur queren bedeutet dieser eine deutliche Schikane. Linksabbiegen ist meist <.ref>indirekt</.ref> möglich; Ausnahme bildet der Lüttkamp der auch <.ref>direktes</.ref> Abbiegen erlaubt. (LSBG Lageplan 2).</p>

    <p><strong><.v bounds="9.873897,53.596214,9.896794,53.601449" lon={9.8870968} lat={53.5988063} dir="forward" ref={@ref}>Kreuzung Langbargheide</.v>:</strong> Auch hier wird der Radweg hinter den Bushaltestellen geführt, die Querung der Nebenstraßen erfolgt geradlinig. Von der Veloroute weg steht indirektes Linksabbiegen zur Verfügung, aus den Nebenstraßen nur Direktes. (LSBG Lageplan 4).</p>

    <p><strong><.v bounds="9.886982,53.600127,9.892587,53.602508" lon={9.8899406} lat={53.6016387} dir="forward" ref={@ref}>Querung Radschnellweg</.v>:</strong> Für den <.a name="rsw-elmshorn">Radschnellweg Elmshorn</.a> verbreitern sich die Radwege auf 4,0m. Die Querung der Elbgaustraße ist kurz vor den Eisenbahnbrücken vorgesehen. (LSBG Lageplan 5).</p>

    <p><strong><.v bounds="9.889175,53.602158,9.899717,53.604568" lon={9.8926452} lat={53.6033872} dir="backward" ref={@ref}>Bushaltestellen S-Elbgaustraße</.v>:</strong> Die Fahrgäste bekommen 3,0m breite Warteflächen. Der Radweg verläuft dahinter. Ausnahme: an der Haltestelle kurz vor den Bahnbrücken in Fahrtrichtung Lurup führt ein <.ref>Radfahrstreifen</.ref> links am Bus vorbei. (LSBG Lageplan 5).</p>

    <h4>Meinung</h4>
    <p>Bis zu den Eisenbahnbrücken wirkt die Planung gut: Es gibt durchgängige, zwei Meter breite Hochbordradwege. Gefahrenstellen an Bushaltestellen und Kreuzungen wurden größtenteils behoben und Linksabbiegen ist überhaupt erstmals bedacht worden. Hier und da gibt es Details die man verbessern könnte, insgesamt stellt der Entwurf die Veloroute aber solide auf.</p>

    <p>Ab den Brücken ändert sich das und der Radverkehr soll zusehen wo er bleibt. Die Ableitungen auf die Fahrbahn verleiten den Autoverkehr dazu, Sicherheitsabstände zu ignorieren. Dass das Überholverbot unter den Brücken beachtet wird, ist unwahrscheinlich. Als Alternative bleibt auf dem Fußweg zu schleichen. Der Stadt fehlte der Mut eine sinnvolle Lösung durchzusetzen, etwa eine einspurige KFZ-Führung (HVV frei) mittels Einbahnstraßen oder Ampeln. Als „sicher und zügig“ bewirbt die Stadt die Velorouten – hier gibt es nur sicher <em>oder</em> zügig.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
