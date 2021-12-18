defmodule Data.Article.Blog.KaiserWilhelmStrasse do
  use Article.Default

  def created_at(), do: ~D[2020-10-28]
  def updated_at(), do: ~D[2020-11-29]
  def title(), do: "Kaiser-Wilhelm-Straße (Veloroute 1 und 2)"

  def start(), do: ~d[2021-02-11]
  def stop(), do: ~d[2021-12-31]

  def type(), do: :construction
  def construction_site_id_hh(), do: [14393]
  def tags(), do: ["1", "2"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Der Radverkehr wird an dieser Stelle im Mischverkehr mit den KFZ geführt. Richtung St. Pauli gibt es nach der Baustelle des Axel-Springer-Quartiers eine Möglichkeit auf den alten, schmalen Hochbordradweg aufzufahren.</p>
    <h4>Planung</h4> <p>Bereits ab dem 2. November 2020 sollen im Bereich vorm neuen Gebäude der Asphalt ausgetauscht werden und im Anschluss auch mit <.ref>Radfahrstreifen</.ref> versehen werden, was nur ca. drei Wochen dauern soll. Der Rest der Bauzeit wird auf die Fußwege und andere Nebenflächen entfallen.</p> <p>Im Wesentlichen werden für den Radverkehr rund 2,0m breite Radfahrstreifen in beide Fahrtrichtungen vorgesehen. Ausnahmen gibt es an den <.m bounds="9.980485,53.554007,9.982789,53.555048" lon="9.9816301" lat="53.5545835" dir="forward">Bushaltestellen beim Bäckerbreitergang</.m>, da der Radverkehr hier die Wartefläche der Busse mitnutzt. Selbst bei Gegenverkehr ist eine Vorbeifahrt an einem wartendem Bus aber möglich. Die zweite Ausnahme ist eine neue <.m bounds="9.982376,53.553178,9.983392,53.553637" lon="9.9831044" lat="53.5536849" dir="forward">Mittelinsel auf Höhe der Neustädter Straße</.m>, die als Querungshilfe für den Fußverkehr dient. Da die Fahrbahn hier gleich breit bleibt, wird ein rund 1,3m breiter <.ref>Schutzstreifen</.ref> eingerichtet.</p> <p>Rechts der Radfahrstreifen werden Lieferzonen bzw. KFZ-Stellplätze eingerichtet, wobei 50cm Sicherheitsabstand gegen <.ref>Dooring</.ref> vorgesehen sind. Richtung Innenstadt werden diese Parkplätze regelmäßig durch neue Bäume unterbrochen. In Richtung St. Pauli befinden sich die Bäume stattdessen „hinter“ den Stellplätzen und werden deutlich dichter gepflanzt. Fahrradanlehnbügel werden ebenfalls in diesen Mehrzweckarealen angebracht.</p>
    <h4>Meinung</h4> <p>Zuerst die guten Sachen: Mit zwei Metern wird die Veloroute hier brauchbar breit und die neuen Anschließmöglichkeiten sind sowohl zahlreich als auch sinnvoll verteilt. Das die Straße in Zukunft auch deutlich grüner wird und den Hamburg-typischen Alleecharakter erhält ist zu begrüßen.</p> <p>Die Vorbeifahrt an wartenden Bussen ist zwar nicht so schön, aber da dies auch bei Gegenverkehr möglich ist, sicher zu verschmerzen.</p> <p>Inakzeptabel ist die Planung der Querungshilfe, die den Radverkehr an den Rand drängt und Autofahrende zum Unterschreiten der Überholabstände einlädt. Es erscheint möglich die Mittelinsel auf Kosten von ein paar Fahrrad- und KFZ-Stellplätzen so zu bauen, das der Radfahrstreifen seine 2,0m Breite erhält.</p> <p>Der fehlende Zebrastreifen an der Querungshilfe zeigt, das man den Fußverkehr nicht wirklich fördern möchte. Abgesehen von diesem Fauxpas ist der neue Zustand jedoch eine deutliche Verbesserung für den Radverkehr.</p>
    <h4>Quelle</h4> <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/14475112/9ba6c13892493ad208cb5947f837475b/data/kaiser-wilhelm-strasse-strassenbauarbeiten-und-erneuerung-nebenflaechen-11-20-bis-01-21.pdf">Anliegerinformation des LSBG</.a> (vom 19.10.2020)
    </li>
    <li>
    <.a href="https://fragdenstaat.de/anfrage/veloroute-12-umbau-der-kaiser-wilhelm-strae/#nachricht-538037">Lageplan</.a> (via FragDenStaat.de)
    </li>
    </ul>
    """
  end
end
