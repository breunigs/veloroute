defmodule Data.Article.Blog.EisenbahnbrueckeBovestrasse do
  use Article.Default

  def created_at(), do: ~D[2020-12-08]
  def updated_at(), do: ~D[2022-01-10]

  def title(), do: "Eisenbahnbrücke Bovestraße (Veloroute 7)"
  def summary(), do: "1,85m breite Radfahrstreifen zwischen Bus- und KFZ-Spuren."

  def start(), do: ~d[2020-12]

  def type(), do: :construction

  def tags(), do: ["7", "s4"]

  def links(_assigns) do
    [
      {"alte Seite zum Planfeststellungsverfahren S-Bahn Linie 4, Abschnitt 1",
       "https://web.archive.org/web/20180416164831/http://www.hamburg.de/bwvi/np-aktuelle-planfeststellungsverfahren/9023850/s4/"},
      {"Erläuterungsbericht (ab Seite 47 bzw. 80)",
       "https://www.hamburg.de/contentblob/8856684/62b79ef7235d53051e410c7bf1ba500e/data/unterlage-01-erlaeuterungsbericht.zip"},
      {"Lagepläne (im ZIP: 3_6_LP.pdf)",
       "https://www.hamburg.de/contentblob/8856692/a67ec269d1372d60b3349bedc9e5a4e0/data/unterlage-03-lageplaene-und-karten.zip"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Januar 2022</h4>
    <p>Erläuterungsbericht und Lagepläne ergänzt. Der Artikel wurde entsprechend konkretisiert.</p>

    <h4>Alter Zustand</h4>
    <p>Der Radverkehr hat hier die Möglichkeit in Schrittgeschwindigkeit auf den 1,5m bis 2,0m breiten Fußwegen mitzufahren oder sich unter den Autoverkehr zu mischen. Keine der Möglichkeiten ist attraktiv.</p>

    <h4>Planung</h4>
    <p>Im Zuge der S4 wird die Eisenbahnbrücke über die Bovestraße verbreitert und eine S-Bahn-Haltestelle gebaut. Direkt unter der Brücke soll ein Umstieg zum Busnetz möglich werden, entsprechend werden hier beidseitig Bushaltestellen eingerichtet.</p>

    <p>Laut Plan ist vorgesehen pro Richtung ist jeweils eine Spur für jede Verkehrsart vorgesehen: KFZ, Rad, Bus und Fuß werden so getrennt. In die Busspur und Fußwege sind jeweils auch die Halte bzw. Warteflächen integriert. Die Radspuren verlaufen zwischen Bus- und KFZ-Spuren. Sie sollen rund 1,85m breit werden.</p>

    <p>Aus der Stadt kommend ist <.ref>indirektes Linksabbiegen</.ref> in die Gustav-Adolf-Straße vorgesehen. Ein Aufstellbereich ist nicht vorgesehen. Es ist aber auch möglich sich auf der KFZ-Spur einzuordnen und so direkt Linksabzubiegen. In Richtung Innenstadt soll nur direkt abgebogen werden, was wegen der hier abknickenden Vorfahrt möglich ist.</p>

    <p>In den Bahngärten sollen je Richtung 1,5m breite Radfahrstreifen inkl. Kanalrinne markiert werden. Einen Fußweg soll es nur auf der Nordseite geben.</p>

    <h4>Meinung</h4>
    <p>Die Planung ist fragwürdig und stellt keine attraktive Radführung her. Dazu sind die ungeschützen Spuren zwischen Bussen und KFZ zu schmal. In den Bahngärten sind sie sogar so schmal, das heute so nicht mehr geplant werden dürften.</p>
    <p>Abbiegen bleibt ebenfalls problematisch:</p>
    <ul>
      <li>Bahngärten → Unterführung: Radfahrstreifen fehlt im Kurvenbereich. Es muss davon ausgegangen werden das Radfahrende hier regelmäßig geschnitten werden.</li>
      <li>Unterführung → Gustav-Adolf-Straße: direktes Linksabbiegen ist nur für Hartgesottene möglich. Indirekt steht man im Weg oder soll illegal den Fußweg mitnutzen. Die Führung orientiert sich an der Fußfurt und hat entsprechend enge Kurvenradien.</li>
      <li>Unterführung → Bahngärten: wenn der Radverkehr eine eigene Ampelphase erhält, ist die Führung so okay. Sollte diese fehlen, wird die Situation heikel. Die Veloroute folgt der abknickenden Vorfahrt, hat also Vorrang vor KFZ-Geradeaus. Aber wer mag sich darauf schon verlassen?</li>
    </ul>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
