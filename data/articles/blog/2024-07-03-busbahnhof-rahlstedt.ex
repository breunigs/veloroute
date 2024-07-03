defmodule Data.Article.Blog.BusbahnhofRahlstedt do
  use Article.Default

  def title(), do: "Busbahnhof Rahlstedt (Radroute 7)"

  def start(), do: ~d[2024-05]
  def stop(), do: ~d[2026-09]

  def summary(),
    do:
      "Neuer Busbahnhof bringt kleinere Änderungen für den Radverkehr, verbessert die Gesamtsituation aber nur wenig."

  def type(), do: :construction

  def tags(), do: ["7"]

  @attrib {"MASUCH + OLBRISCH Ingenieurgesellschaft für das Bauwesen mbH",
           "https://moingenieure.de/kontakt/"}
  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, 1, {
        %{lat: 53.603618599, lon: 10.152542341},
        %{lat: 53.604524232, lon: 10.154033682},
        %{lat: 53.603384826, lon: 10.155998754},
        %{lat: 53.602479193, lon: 10.154507413}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.605382362, lon: 10.154702599},
        %{lat: 53.606524601, lon: 10.156606763},
        %{lat: 53.606019742, lon: 10.157467159},
        %{lat: 53.604877503, lon: 10.155562994}
      })
    ]
  end

  def links(_assigns) do
    [
      {"Infoseite der Hochbahn", ~d[2024-07],
       "https://www.hochbahn.de/de/projekte/busanlage-rahlstedt"},
      {"Infoseite der Stadt", ~d[2024-07],
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/wandsbek/themen/verkehr/bezirkliche-projekte-in-wandsbek/strassenumbauten/busbahnhof-rahlstedt-438252"},
      {"Zeitungsartikel zum Umbau", ~d[2024-07],
       "https://www.ndr.de/nachrichten/hamburg/Hamburger-Hochbahn-baut-neuen-Busbahnhof-in-Rahlstedt,hochbahn756.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang der <.a name="alltagsroute-7">Radroute 7</.a> ist <.v bounds="10.151275,53.602296,10.15665,53.605364" lon={10.154615} lat={53.60286} dir="forward" ref="7">von Süden kommend</.v> eine <.ref name="ARAS">Aufstellfläche vorm KFZ-Verkehr aufgemalt</.ref>, von der aus <.v bounds="10.151275,53.602296,10.15665,53.605364" lon={10.154797} lat={53.603446} dir="forward" ref="7">zur Fußgängerzone</.v> oder <.m bounds="10.150977,53.602945,10.154608,53.604786">Richtung Bahnunterführung</.m> gefahren werden kann. <.v bounds="10.152066,53.602435,10.156238,53.604747" lon={10.154644} lat={53.603334} dir="backward" ref="7">In der Gegenrichtung</.v> fährt man entweder vom Fahrbahnstummel direkt oder nutzt die geteilte Rad- und Fußfurt.</p>

    <p>Entlang der <.m bounds="10.151256,53.60203,10.159256,53.604112">Amtsstraße</.m> stehen beidseitig rund 1,0m breite <.ref>Hochbordradwege</.ref> zur Verfügung. Es gibt eine Engstelle ohne Radweg. Linksabbiegen ist jeweils indirekt über die geteilten Rad- und Fußfurten gedacht.</p>

    <p>Im <.m bounds="10.151358,53.60321,10.155043,53.604939">Bereich Busbahnhof</.m> sind keine eigenen Radwege vorhanden. Zum Erreichen der Fahrradständer können die Gehwege (<.ref>Fahrrad frei</.ref>) oder die <.ref>Fahrbahn</.ref> verwendet werden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Entlang der Radroute nach Norden bleibt alles wie bisher. In Richtung Süden entfällt die Fahrradfurt und man wird stattdessen direkt von der Fahrbahn in der Fußgängerzone auf den <.ref>Radfahrstreifen</.ref> in der <.v bounds="10.152981,53.601552,10.156583,53.604886" lon={10.154483} lat={53.602896} dir="backward" ref="7">Rahlstedter Bahnhofstraße</.v> geleitet.</p>

    <p>Entlang der <.m bounds="10.151256,53.60203,10.159256,53.604112">Amtsstraße</.m> wechseln sich verschiedene Varianten ab, die dann jeweils nur wenige Meter lang sind. Die <.m bounds="10.154314,53.602133,10.159345,53.60371">östliche Amtsstraße</.m> soll in einer anderen Maßnahme ebenfalls umgebaut werden, sodass sich die Kreuzung mit der Rahlstedter Bahnhofstraße noch ändern könnte. Im Detail:</p>
    <ul>
      <li><.m bounds="10.15161,53.6026,10.155032,53.6043">Richtung Bahnunterführung</.m>: <.ref>Hochbordradweg</.ref>, <.ref>Radfahrstreifen</.ref>, gemeinsame Spur Bus/Taxi/Anlieger/Rad, Stummel <.ref>Schutzstreifen</.ref>, <.ref>Mischverkehr</.ref> und schließlich die Wahl weiter im Mischverkehr zu bleiben oder über eine Rampe auf den Gehweg unter der Unterführung zu wechseln.</li>
      <li><.m bounds="10.153337,53.602199,10.158004,53.604325">Richtung Wandse</.m>: Mischverkehr (vom Tunnel) bzw. Hochbordradweg (von der Post), Radfahrstreifen mit eigener Linksabbieger-Spur zum Busbahnhof, <.ref>Kopenhagener Radweg</.ref>, Radfahrstreifen, Mischverkehr und schließlich eine optionale Rampe um auf den vorhandenen Hochbordradweg zu wechseln. Linksabbiegen in die Rahlstedter Bahnhofstraße soll über den Gehweg passieren, oder vorher über den Busbahnhof.</li>
    </ul>

    <p>Im Busbahnhof darf künftig nur noch auf der Fahrbahn geradelt werden. Sie wird für Bus und KFZ zur Einbahnstraße im Uhrzeigersinn, bleibt mit dem Fahrrad aber in beide Richtungen offen. Zusätzlich ist auf der <.m bounds="10.15344,53.602948,10.154911,53.604327">Häuserseite</.m> Richtung <.m bounds="10.153216,53.603724,10.155493,53.605037">Helmut-Steidl-Platz</.m> ein 1,6m breiter Radfahrstreifen geplant. Dieser nimmt die von der Unterführung kommenden Linksabbieger auf und bietet an Markttagen eine Alternative für den Radverkehr aus den anderen Richtungen.</p>

    <p>Die <.a href="https://www.hochbahn.de/de/projekte/busanlage-rahlstedt">Infoseite der Hochbahn</.a> und der <.a href="https://www.ndr.de/nachrichten/hamburg/Hamburger-Hochbahn-baut-neuen-Busbahnhof-in-Rahlstedt,hochbahn756.html">Artikel des NDR</.a> haben einige Bilder wie der fertige Busbahnhof einmal aussehen soll.</p>

    <h4>Meinung</h4>
    <p>Mit der Planung werden manche Stellen für den Radverkehr besser ohne das Gesamtbild wirklich zu beeinflussen. Es bleibt unkomfortabel.</p>

    <p>Weitere Mankos sind:</p>
    <ul>
      <li>schlechte Anbindung der Fußgängerzone an den Busbahnhof</li>
      <li>trotz Umbau zu wenig Busplätze für den Hamburg-Takt</li>
      <li>fast Vollversiegelung/kaum Grünflächen</li>
    </ul>

    <p>Insgesamt ist die Planung durchwachsen, oft weil der verfügbare Platz nur wenig Möglichkeiten lässt. Umso wichtiger wäre eine Aufwertung der Amtsstraße gewesen, etwa nach dem Vorbild Mönckebergstraße.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
