defmodule Data.Article.Blog.GustavSeitzWeg do
  use Article.Default

  def created_at(), do: ~D[2021-05-21]
  def updated_at(), do: ~D[2022-02-13]

  def title(), do: "Gustav-Seitz-Weg (Veloroute 5)"

  def summary(),
    do:
      "2,0m breite Radfahrstreifen ohne Trennung zu KFZ. Während des U5 Baus halten Busse auf dem Radfahrstreifen."

  def start(), do: ~d[2022-03-07]
  def stop(), do: ~d[2022-08-21]

  def type(), do: :planned

  def tags(), do: ["5", "W31"]

  def links(_assigns) do
    [
      {"Bauvergabe mit aktuellem Lageplan",
       "https://suche.transparenz.hamburg.de/dataset/009283c0-8f9b-429c-8872-439f67dd6c20"},
      {"Veralteter Entwurf und Lageplan",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1014315"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Februar 2022</h4>
    <p>Die Unterlagen zur Vergabe des Umbaus wurden veröffentlicht und enthalten den überarbeiteten Lageplan. Der Erläuterungsbericht ist dort leider nur teilweise enthalten. Der Artikel wurde dem neuesten Stand angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>Der Radverkehr darf hier auf rund 1,25m breiten, unebenen <.ref>Hochbordradwegen</.ref> fahren, oder auf der Fahrbahn im Autoverkehr mitschwimmen. Durch die Führung der Strecke ist <.m bounds="10.060237,53.608314,10.063914,53.609466" lon="10.0623337" lat="53.6087119" dir="forward">bergauf</.m> nur der Hochbordradweg gut zu erreichen. Bergab verpasst man die <.m bounds="10.058107,53.609847,10.066346,53.61173" lon="10.0618397" lat="53.6105941" dir="backward">Aufleitung kurz nach dem Kreisel</.m> leicht.</p>

    <p>Zum Queren der Steilshooper Straße muss eine Bettelampel benutzt werden.</p>

    <h4>Planung</h4>
    <p>Der Entwurf schlägt die alten Radwege dem Fußweg zu. Der Radverkehr wird über 2,0m breite <.ref>Radfahrstreifen</.ref> geführt. Wegen des Baus der U5 werden hier Ersatzbushaltestellen angelegt, die den Radfahrstreifen nahe des Kreisels unterbrechen.</p>

    <p>Richtung Steilshoop erhält der Radverkehr eine eigene Radampel, die leicht von der Fußfurt abgesetzt verläuft.</p>

    <p>Richtung Innenstadt wird frühzeitig wieder auf einen Hochbordradweg aufgeleitet. Linksabbiegen ist wie bisher nur entlang der Fußfurt vorgesehen. Wer rechts abbiegt um der Veloroute zu folgen kann dies weiterhin ohne Ampel tun.</p>

    <h4>Meinung</h4>
    <p>Auch die überarbeitete Planung überzeugt nicht.</p>

    <p>Während der Bauzeit der U5 – rund 5 Jahre – muss der Radverkehr regelmäßig haltenden Bussen ausweichen. Die Taktung liegt bei weniger als 5 Minuten, also sehr häufig. Auf der Ostseite kommen die ein- und ausparkenden KFZ hinzu, da man hier Parkplätze rechts des Radfahrstreifens anlegt. Dies obwohl zahlreiche Tiefgaragen in unmittelbarer Nähe zur Verfügung stehen.</p>

    <p>Schutzelemente gegen Falschparker oder Schneiden in der Kurve fehlen. Da die Kreuzung mit der Steilshooper Straße nur geringfügig angepasst wird, bleiben die unkomfortablen 90°-Winkel. Nicht überall hat der Radverkehr eigene Ampeln, sondern muss sich an den kurzen Freigabezeiten für den Fußverkehr orientieren.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
