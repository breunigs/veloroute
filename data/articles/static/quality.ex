defmodule Data.Article.Static.Quality do
  use Article.Static

  def title(), do: "Qualität"

  def summary(),
    do: "Was macht eine qualitativ hochwertige Veloroute aus."

  def tags(), do: []

  def text(assigns) do
    ~H"""
    <h3 id="anchorplans">Pläne, Baustellen und Probleme</h3>
    <p>
    Für manche Abschnitte gibt es weiterführende Informationen – etwa aktuelle Planungsstände der Bezirke und Ämter, Baustellen, aber auch noch ungelöste Probleme. Diese betroffenen Bereiche sind in der Karte grau hinterlegt und Du kannst sie anklicken, um weitere Informationen zu erhalten.<br>

    Wenn Du nicht suchen möchtest:
    </p>
    <ul>
    <li><.a href="/bau">(geplante) Baustellen sortiert nach Baubeginn</.a> anzeigen</li>
    <li>Die Detailseite einer Veloroute verlinkt auch alle Artikel</li>
    </ul>

    <h3 id="anchorlegend">Was ist eine gute Veloroute?</h3>
    <p>Es gibt unstreitbar gute Abschnitte (<.m dir="forward" ref="5" lat="53.6014" lon="10.0306" bounds="10.024441,53.598478,10.036379,53.608989">Pergolenviertel</.m>) und problematische Stellen (<.m bounds="9.978193,53.462695,9.983834,53.465077" lon="9.980495" lat="53.463877" dir="forward" ref="10">Führung an der Buxtehuder Straße</.m>). Bei allem dazwischen hängt die Bewertung von den eigenen Bedürfnissen ab – Renn- oder Lastenrad, Neuling oder Profi, in der Gruppe oder allein. Viel hängt auch von der Verkehrssituation ab: Wohngebiete sind ruhiger als Hauptstraßen. Eine gute Veloroute ermöglicht:</p>

    <ul>
      <li>sichere Fahrt für alle Altersgruppen und Jahreszeiten</li>
      <li>Nebeneinanderfahren zum Unterhalten</li>
      <li>Überholen für Schnellere</li>
      <li>komfortable Fahrt durch ebene Straßenbeläge</li>
      <li>klare, ersichtliche Führung</li>
      <li>unterbrechungsfreie Fahrt</li>
    </ul>
    """
  end
end
