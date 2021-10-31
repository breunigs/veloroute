defmodule Data.Article.Blog.BernerAllee do
  use Article.Default

  def name(), do: "#{created_at()}-6-14-berner-allee"
  def created_at(), do: ~D[2018-10-18]

  def title(), do: "Berner Allee (Veloroute 6 und 14, Abschnitt „W20“)"

  def start(), do: ~d[2019-11-07]
  def stop(), do: ~d[2020Q3]

  def type(), do: :finished

  def tags(), do: [6, 14, "w20"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Nach den Plänen sollen die bisherigen Radwege beibehalten werden und von ca. 1,50m auf 2,0m verbreitert werden. Im Haltestellenbereich soll der Radweg künftig hinter den Wartehäuschen verlaufen. Folgt man der Veloroute 6 stadtauswärts, wird das Rechtsabbiegen aus der <.m bounds="10.12132,53.622307,10.122576,53.626857">Kathenkoppel</.m> durch eine langgezogene Aufleitung verbessert. Stadteinwärts bleibt die Engstelle an einem Baum ungelöst, es wird lapidar ein „Fußweg – Fahrrad frei“ Schild aufgestellt.</p> <p>Die Neuplanung stellt nur minimale Verbesserungen bereit – Radweg ein bisschen breiter, etwas verschwenken wo Platz ist – mehr nicht. Nach wie vor unklar bleibt, wie man der Veloroute 6 folgend links abbiegen soll. Da keine Aufstelltaschen markiert werden, steht man etwas hilflos im Einmündungsbereich der <.m bounds="10.122544,53.626857,10.125518,53.629781">Lienaustraße</.m> bzw. <.m bounds="10.12783,53.625703,10.128562,53.627736">Große Wiese</.m>. Auch wird im östlichen Teil der Fußweg nicht befestigt, sodass bei schlechtem Wetter die Zufußgehende sehr wahrscheinlich auf den Radweg ausweichen werden.</p> <p>Der Umbau ist 2019 vorgesehen.</p> <p><.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1008834">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
