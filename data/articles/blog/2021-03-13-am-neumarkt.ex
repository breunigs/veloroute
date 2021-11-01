defmodule Data.Article.Blog.AmNeumarkt do
  use Article.Default

  def name(), do: "#{created_at()}-am-neumarkt"
  def created_at(), do: ~D[2021-03-13]

  def title(), do: "Am Neumarkt"

  def type(), do: :planned

  def tags(), do: ["radfahrstreifen"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Von der <.m bounds="10.083054,53.574002,10.090255,53.575839">Efftingestraße bis zur Kedenburgstraße</.m> gibt es 1,35m schmale <ref>Schutzstreifen</ref>, die häufig in im <ref>Dooring</ref> Bereich verlaufen. Vor der <.m bounds="10.085376,53.574146,10.08864,53.575105">Fabrik</.m> wurde dieser auf 2,0m verbreitert, befindet sich aber zwischen zwei KFZ-Spuren (Fotos wurden vorm Umbau gemacht).</p>
    <p>Im <.m bounds="10.088185,53.574436,10.096946,53.576464">weiteren Verlauf</.m> leiten diese auf alte <ref>Hochbordradwege</ref> maximal 1,2m breit sind und damit die Mindestmaße deutlich unterschreiten. Die Beläge sind in die Jahre gekommen und unkomfortabel.</p>
    <h4>Planung</h4> <p>Es ist vorgesehen die Straße neu zu ordnen. Gehwege erhalten zeitgemäße Breiten, die Radführung erfolgt künftig auf 2,0m breiten <ref>Radfahrstreifen</ref>. Vor der <.m bounds="10.085376,53.574146,10.08864,53.575105">Fabrik</.m> wird der <ref>Radfahrstreifen in Mittellage</ref> geführt, aber rot hervorgehoben.</p>
    <p>Zum Linksabbiegen in die <.m bounds="10.083037,53.574039,10.085303,53.574973">Efftingestraße</.m> wird eine Aufstellfläche vor den KFZ vorgesehen (ARAS). Zum Linksabbiegen in die Wohnstraßen auf der Nordseite werden häufig kleine Aufstellbuchten rechts des Radfahrstreifen vorgesehen. So kann auf eine Querungsmöglichkeit gewartet werden, ohne den Geradeaus-Radverkehr zu blockieren. Ausnahme bilden hier der <.m bounds="10.091602,53.575154,10.094201,53.57632">Walter-Fram-Stieg</.m> und die <.m bounds="10.087197,53.574937,10.089102,53.575806">Kedenburgstraße</.m>, wo direkt über die KFZ-Fahrbahn abgebogen werden muss.</p>
    <p>An den Bushaltestellen führt der Radweg durch die Wartefläche für Busse. Es ist aber möglich an haltenden Bussen auch bei Gegenverkehr vorbeizufahren. Die <.m bounds="10.095956,53.574516,10.099377,53.576145">Bahn-Unterquerung an der Luetkensallee</.m> bleibt aus allen Richtungen gut erreichbar.</p>
    <p>Es werden weitere Bäume gepflanzt und viele Radanlehnbügel geschaffen. Gebaut werden kann nur wenn der S-Bahn Ausbau genug fortschreitet, da die Strecke für den Busersatzverkehr vorgesehen ist. Das bedeutet vor 2022 ist nicht mit einer Umsetzung zu rechnen, bei Verzögerungen sind 2024/2025 wahrscheinlich.</p>
    <h4>Meinung</h4> <p>Die Planung ist für den Radverkehr gut. Der größte Kritikpunkt ist der <ref>Radfahrstreifen in Mittellage</ref>, der von Vielen als unangenehm empfunden wird. Die Planungen erörtern eine <ref>Kopenhagener Lösung</ref>, lehnen diese aufgrund der Sturzgefahr am Randstein aber ab. Explizit werden hier illegal auf dem Radweg abgestellte KFZ als Verursacher genannt den Randstein überfahren zu müssen. Entsprechend wäre <ref>Protected-Bike-Lane</ref> wünschenswert gewesen, die Falschparken verhindert. Leider verwechselt die Planung diese beiden Führungsformen, sodass eine PBL vermutlich nicht ordentlich erwägt wurde. Auf Grund der vielen Einmündungen bzw. Einfahrten, und wegen des Wunsches KFZ-Parkplätze zu erhalten wäre diese vermutlich Stückwerk geworden.</p>
    <p>Die Fußwege werden breiter als bisher, wobei einige Engstellen verbleiben. Diese bleiben teils zum besseren Baumerhalt, teils weil KFZ-Parkplätze als wichtiger erachtet werden.</p>
    <h4>Quelle</h4> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1013855">Planungsunterlagen</.a></p>
    """
  end
end
