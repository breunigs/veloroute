defmodule Data.Article.Blog.SFriedrichsberg do
  use Article.Default

  def name(), do: "#{created_at()}-6-s-friedrichsberg"
  def created_at(), do: ~D[2019-10-18]

  def title(), do: "Kreuzung am S-Bahnhof Friedrichsberg (Veloroute 6)"

  def type(), do: :planned

  def tags(), do: ["6"]

  def links(_assigns) do
    [
      {"Projektseite der Stadt zur Planung",
       "https://lsbg.hamburg.de/projekte/5100484/krausestrasse-bis-hammer-strasse/"},
      {"Erläuterungsbericht", "1. Entwurf, 2016",
       "https://lsbg.hamburg.de/contentblob/7702886/cc4095bee357d71d7f02dc0d2887d1cd/data/krausestrasse-muehlenstrasse-brauhausstrasse-hammer-strasse-abstimmungsunterlage-bericht.pdf"},
      {"Lagepläne", "1. Entwurf, 2016",
       "https://lsbg.hamburg.de/contentblob/7702888/f1d1a15664ba6590439a2b73a2f2da02/data/krausestrasse-muehlenstrasse-brauhausstrasse-hammer-strasse-abstimmungsunterlage-plaene.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Kreuzung ist für den Radverkehr verwirrend und umständlich zu benutzen – der Veloroute geradeaus folgen bedeutet regelmäßig drei rote Ampeln. Zudem reichen die Aufstellflächen bereits beim heutigen Radaufkommen nicht aus. Viele Jahre nach Änderung der StVO hat die Stadt es immerhin geschafft die Streuscheiben in den Ampeln anzupassen, damit der Radverkehr nicht mehr die für ihn unbrauchbaren Ampeln auf den KFZ-Fahrspuren beachten muss.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen den Radverkehr nach dem Friedrichsberger Park in die Fahrtrichtungen aufzuteilen. Auf der Nordseite als 1,85m breiter <.ref>Radfahrstreifen</.ref>, auf der Südseite als <.ref>Hochbordradweg</.ref>. Damit sicher dorthin gequert werden kann, wird eine eigene Fahrradampel vorgesehen. Ab der Krausestraße führt dann ein 1,60m breiter Radfahrstreifen in die Stormarner Straße. In der Gegenrichtung ist dieser mit 1,85m etwas breiter, dafür aber <.ref>in Mittellage</.ref>.</p>

    <p>Entlang der Krausestraße werden die Radfahrstreifen ebenfalls rund 1,85m breit und ebenfalls in Mittellage geführt. Die Busse müssen zum Halten jeweils die Radspur kreuzen.</p>

    <p>Protektionselemente sind nirgens vorgesehen. Linksabbiegen geht <.ref>indirekt</.ref>, nur wer mutig genug ist und den Radfahrstreifen rechtzeitig verlässt kann auch <.ref>direkt</.ref> Linksabbiegen. Wer indirekt abbiegt und in der Aufstelltasche wartet muss entweder den Verkehr genau beobachten, oder sich an den Fußampeln orientieren.</p>

    <p>Der beschriebene erste Entwurf ist aus dem Jahr 2016 und sollte bereits 2018 umgesetzt werden. Daraus wurde aber nichts.</p>

    <h4>Meinung</h4>
    <p>Es wäre eine Schande für die Stadt wenn der Entwurf tatsächlich so umgesetzt würde. Man muss ihm zugute halten, dass die Radführung danach immerhin verständlich wäre. Ansonsten gibt es viel zu kritisieren:</p>
    <ul>
      <li>mit 1,85m für die Veloroute bereits bei heutigem Aufkommen zu schmal</li>
      <li>für das Verkehrsaufkommen unzureichende Aufstellflächen</li>
      <li>Radfahrstreifen in Mittellage machen vielen Leuten Angst und wurden daher zurecht für Neuplanungen ausgeschlossen</li>
      <li>keine eigene Signalisierung für indirektes Linksabbiegen</li>
      <li>keine Trennung vom KFZ-Verkehr (z.B. <.ref>Kopenhagener Radweg</.ref>, <.ref>Protected-Bike-Lane</.ref> o.ä.)</li>
      <li>Konflikte mit dem Busverkehr</li>
    </ul>

    <p>In diesem Sinne ist es vorteilhaft für den Radverkehr, dass sich die Umsetztung solange hinausgezögert hat. So besteht immerhin die Chance, dass die Stadt Verbesserungen einbringt statt den unbrauchbaren Zustand auf Jahre zu zementieren. Eine zeitgemäße Planung würde den Friedrichsberger Park und Mühlenteichpark zusammenwachsen lassen, statt weiterhin riesige Flächen für den KFZ-Verkehr zu versiegeln. Wenigstens aber müssen die Radspuren ordentliche Breite erhalten und geschützt werden.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
