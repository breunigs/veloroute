defmodule Data.Article.Blog.Elbgaustrasse do
  use Article.Default

  def created_at(), do: ~D[2021-02-14]

  def title(), do: "Elbgaustraße (Veloroute 14)"

  def start(), do: ~d[2023-10-01]
  def stop(), do: ~d[2024-12-31]

  def type(), do: :planned

  def tags(), do: ["hochbordradweg", "fahrrad-frei", "vz240", "14"]

  def links(_assigns) do
    [
      {"Baustellenkoordination", "September 2022",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013155"},
      {"Beteiligungsverfahren Elbgaustraße", "https://elbgaustrasse.beteiligung.hamburg/"},
      {"Erläuterungsbericht und Lagepläne",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1011035"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Veloroute wird meist auf <.ref>Hochbordradwegen</.ref> geführt. Sie sind unterschiedlich breit und zwischen <.v bounds="9.86729,53.590468,9.889278,53.595495" lon={9.881915} lat={53.5924746} dir="forward" ref={@ref}>1,50m</.v> und <.v bounds="9.879594,53.600217,9.901582,53.605243" lon={9.8920342} lat={53.6029526} dir="forward" ref={@ref}>70 cm</.v> ist alles dabei. Die Radwege werden durch <.v bounds="9.879594,53.600217,9.901582,53.605243" lon={9.8927414} lat={53.6034238} dir="backward" ref={@ref}>Bushaltestellen geführt</.v>, vor Kreuzungen zu <.v bounds="9.871183,53.589339,9.893171,53.594367" lon={9.8823888} lat={53.59287} dir="forward" ref={@ref}>gemeinsamen Fuß- und Radwegen</.v> oder an <.v bounds="9.88384,53.602302,9.905828,53.607329" lon={9.895432} lat={53.604179} dir="forward" ref={@ref}>Engstellen zu einem „Fahrrad frei“</.v>. Altersbedingt sind die Radwege eher uneben und daher schlecht zu befahren.</p>

    <h4>Planung</h4>
    <p>Der erste Entwurf sieht von der <.v bounds="9.871325,53.587523,9.885014,53.590653" lon={9.8775202} lat={53.5894187} dir="forward" ref={@ref}>Elly-See-Straße</.v> bis <.v bounds="9.885822,53.600751,9.89364,53.602538" lon={9.8900402} lat={53.601743} dir="forward" ref={@ref}>kurz vor den Eisenbahnbrücken</.v> durchgehende, 2,0m breite <.ref>Hochbordradwege</.ref> vor (LSBG Lagepläne 1 bis 5).</p>
    <p>Unter den Brücken wird der Radweg aufgelöst und stattdessen auf einem „gemeinsamen Fuß- und Radweg“ geführt. Im Anschluss gibt es einen Mix aus <.ref>Radfahrstreifen</.ref>, <.ref>Kopenhagener Lösung</.ref> und gemeinsamem Fuß- und Radweg (LSBG Lagepläne 5 und 6).</p>

    <p><strong><.v bounds="9.875161,53.591657,9.889322,53.594896" lon={9.8828454} lat={53.5937188} dir="backward" ref={@ref}>Kreuzung Farnhornweg</.v>:</strong> Die Radwege verlaufen nun hinter den Bushaltestellen, sodass man beim Ein-/Aussteigen nicht sofort auf dem Radweg steht. Der <.v bounds="9.875161,53.591657,9.889322,53.594896" lon={9.8828463} lat={53.5932706} dir="forward" ref={@ref}>freie Rechtsabbieger</.v> aus dem Farnhornweg bleibt teilweise erhalten, wird aber mit einer Ampel gesichert. Für Radfahrende, die die Veloroute hier nur queren bedeutet dieser eine deutliche Schikane. Linksabbiegen ist meist <.ref>indirekt</.ref> möglich; Ausnahme bildet der Lüttkamp der auch <.ref>direktes</.ref> Abbiegen erlaubt. (LSBG Lageplan 2).</p>

    <p><strong><.v bounds="9.873897,53.596214,9.896794,53.601449" lon={9.8870968} lat={53.5988063} dir="forward" ref={@ref}>Kreuzung Langbargheide</.v>:</strong> Auch hier wird der Radweg hinter den Bushaltestellen geführt, die Querung der Nebenstraßen erfolgt geradlinig. Von der Veloroute weg steht indirektes Linksabbiegen zur Verfügung, aus den Nebenstraßen nur Direktes. (LSBG Lageplan 4).</p>

    <p><strong><.v bounds="9.886982,53.600127,9.892587,53.602508" lon={9.8899406} lat={53.6016387} dir="forward" ref={@ref}>Querung Radschnellweg</.v>:</strong> Als Vorleistung für den <.a name="rsw-elmshorn">Radschnellweg Elmshorn</.a> verbreitern sich die Radwege teilweise auf 3,0m bis 4,0m und es werden zusätzliche Querungsmöglichkeiten der Elbgaustraße angeboten. Die genaue Führung ist noch nicht bekannt. (LSBG Lageplan 5).</p>

    <p><strong><.v bounds="9.889175,53.602158,9.899717,53.604568" lon={9.8926452} lat={53.6033872} dir="backward" ref={@ref}>Bushaltestellen S-Elbgaustraße</.v>:</strong> Anders als bisher wird der Radverkehr hier auf einem <.ref>Radfahrstreifen</.ref> links der Bushaltestelle geführt. (LSBG Lageplan 5).</p>

    <h4>Meinung</h4>
    <p>Bis zu den Eisenbahnbrücken wirkt die Planung gut: Es gibt durchgängige, zwei Meter breite Hochbordradwege. Gefahrenstellen an Bushaltestellen und Kreuzungen wurden größtenteils behoben und Linksabbiegen ist überhaupt erstmals bedacht worden. Hier und da gibt es noch Details die man verbessern kann, insgesamt stellt der Entwurf die Veloroute aber solide auf.</p>
    <p>Ab den Brücken gibt es für den Radverkehr nur noch Reste. An besonders engen Stellen schickt man Rad und Fuß direkt in den Konflikt. Es ist auch heute schon unangenehm Leute zu Fuß unter den Brücken zu überholen, weil kein Sicherheitsabstand eingehalten werden kann. Das dies auch künftig so bleiben soll enttäuscht und ist sehr weit von einer brauchbaren Veloroute entfernt. Eine sinnvolle Lösung erfordert eine einspurige KFZ-Führung (HVV frei), z.B. durch Einbahnstraßen oder mittels Ampel. Will man langfristig den KFZ-Verkehr fördern, könnten die Bahnbrücken verbreitert werden. Da die nächste Unterführung selbst im absurdesten Fall nur 10 Minuten Umweg bedeutet, erscheint der Nutzen fraglich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
