defmodule Data.Article.Blog.Hufnerstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-12-11]
  def updated_at(), do: ~D[2021-09-10]
  def title(), do: "Hufnerstraße (Veloroute 5)"

  def start(), do: ~d[2022Q2]

  def type(), do: :planned

  def tags(), do: ["5"]

  def links(_assigns) do
    [
      {"endgültige Planung: Flachsland bis Hufnertwiete",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1011169"},
      {"2. Entwurf: Hufnertwiete bis Krüsistraße",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1011060"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand November 2021</h4> <p>Der Umbau der <.m bounds="10.042408,53.585327,10.045014,53.586763" lon="10.042758" lat="53.585529" dir="forward" ref="5">Poppenhusenstraße</.m> ist nicht mehr Teil des Umbaus. Grund: Die Behörde für Verkehr und Mobilitätswende (BVM) kann keine Zusage zur Finanzierung machen.</p>
    <h4>Stand September 2021</h4> <p>Der zweite Entwurf beseitigt alle Kritikpunkte die es an der Planung noch gab. Der Artikel wurde entsprechend angepasst.</p>
    <h4>Alter Zustand</h4> <p>Die Hufnerstraße ist für KFZ teils eine Einbahnstraße, jedoch ist die Fahrt für den Radverkehr in beide Richtungen möglich, da der rund 2,0m breite <.ref>Hochbordradweg</.ref> ein Zweirichtungsradweg ist. Dies ist aus dem Norden kommend nicht ersichtlich, sodass man durchaus vom Gegenverkehr überrascht wird.</p> <p>Die <.m bounds="10.037831,53.586299,10.044682,53.587885" lon="10.0412848" lat="53.5870787" dir="backward">Querung am Wiesendamm</.m> hat eine sehr schlecht abgestimmte Ampel: man muss hier praktisch immer zweimal warten.</p>
    <h4>Planung</h4> <p>In zwei aneinanderschließenden Planungen ist vorgesehen den Zweirichtungsradweg aufzulösen. Stattdessen soll jeweils ein <.ref>Radfahrstreifen</.ref> pro Fahrtrichtung eingerichtet werden, der im Bereich der Einbahnstraße durch eine schmale Mittelinsel vom KFZ-Verkehr abgetrennt wird. Auf dieser Seite entfallen auch alle KFZ-Parkplätze, die nur noch in Fahrtrichtung Innenstadt rechts des Radfahrstreifens eingerichtet werden. In jedem Fall stehen dem Radverkehr auf den neuen Wegen mindestens 2,0m Breite zur Verfügung, meist noch ein bisschen mehr.</p> <h5>Details Fahrtrichtung Innenstadt</h5> <p>Vor der <.m bounds="10.038656,53.587428,10.044705,53.588828" lon="10.041858" lat="53.58848" dir="backward" ref="5">Eisenbahnbrücke</.m> wird der existierende Hochbordradweg auf einen 2,25m breiten Radfahrstreifen abgeleitet. Unter der Brücke wird dieser mittels der <.ref>Kopenhagener Lösung</.ref> umgesetzt. An der <.m bounds="10.038239,53.586717,10.044288,53.588117" lon="10.041485" lat="53.5875256" dir="backward">Kreuzung mit dem Wiesendamm</.m> ist <.ref name="abbiegen">direktes Linksabbiegen</.ref> für den Radverkehr nicht vorgesehen, dafür bleibt man immer rechts der KFZ-Spuren. Im Kreuzungsbereich fährt weiter man auf Asphalt und quert den Wiesendamm in einem Zug. Mittelinseln stellen hier die Trennung vom KFZ-Verkehr sicher. Von einer Aufstelltasche aus kann man links in den Wiesendamm abbiegen.</p> <p>Nach dem Wiesendamm bleibt es bis zur <.m bounds="10.038373,53.585004,10.044422,53.586404" lon="10.042175" lat="53.585316" dir="backward">Brücke</.m> beim 2,25m breiten Radfahrstreifen. Auf der Brücke gibt es einen 2,0m breiten Hochbordradweg, der kurz vor der <.m bounds="10.038373,53.585004,10.044422,53.586404" lon="10.0421226" lat="53.5854815" dir="backward">Osterbekstraße</.m> wieder auf Asphaltniveau abgeleitet wird. Dort schließt sich die <.a href="/article/2020-11-14-hufnerstrasse-reesestrasse">Planung zur Hufner- und Reesestraße</.a> an.</p> <p>Die KFZ-Parkplätze rechts des Radwegs werden mit rund 90cm Sicherheitsabstand gegen <.ref>Dooring</.ref> geplant.</p> <h5>Details Fahrtrichtung stadtauswärts</h5> <p><.m bounds="10.040023,53.583853,10.043741,53.58848" lon="10.042025" lat="53.584727" dir="forward" ref="5">Kurz vor der Brücke</.m> endet der Radfahrstreifen und KFZ- und Radverkehr teilen sich eine Spur. Über einen kleinen Kreisel kann der Radverkehr alle Richtungen erreichen. Die Poppenhusenstraße bleibt wie heute; man sortiert die KFZ-Parkplätze jedoch um.</p> <p>Im Wiesendamm schließt sich ein 2,50m Radfahrstreifen an, der durch eine rund 90cm breite Mittelinsel vom Autoverkehr getrennt wird. Ansonsten ist der Umbau bis auf Details identisch mit der Gegenrichtung.</p>
    <h4>Meinung</h4> <p>Der zweite Entwurf ist sehr gut: den Wiesendamm in einem Zug queren zu können ist längst überfällig. Der geschützte Radweg entgegen der Einbahnstraße ist ebenfalls eine hervorragende Lösung im Vergleich zum unbeschilderten Zweirichtungsradweg und mehrmaligem queren der Straße.</p> <p>Das man dem Radverkehr an der <.m bounds="10.038373,53.585004,10.044422,53.586404" lon="10.0421226" lat="53.5854815" dir="backward">Poppenhusenstraße</.m> über einen Kreisel ermöglicht alle Richtungen zu erreichen ist sinnvoll. Ein Bypass in Fahrtrichtung Innenstadt ermöglicht dies sogar ohne sich in den KFZ-Verkehr einsortieren zu müssen.</p>
    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
