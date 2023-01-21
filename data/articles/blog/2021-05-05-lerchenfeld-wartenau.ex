defmodule Data.Article.Blog.LerchenfeldWartenau do
  use Article.Default

  def created_at(), do: ~D[2021-05-05]

  def title(), do: "Lerchenfeld und Wartenau (kreuzt Veloroute 6)"

  def start(), do: ~d[2025]

  def type(), do: :planned

  def tags(), do: ["6"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/contentblob/15046842/f7709bfca5eb56c795837c1d1db8485c/data/lerchenfeld-wartenau-abstimmungsunterlage-bericht.pdf"},
      {"Lageplan",
       "https://lsbg.hamburg.de/contentblob/15046848/515f7f6d8dee32bd0009ce2f9e5f9b2c/data/lerchenfeld-wartenau-abstimmungsunterlage-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Die gesamte Strecke zeichnet sich durch schmale, in die Jahre gekommene <.ref>Hochbordradwege</.ref> aus. Da die Parkplätze zu schmal sind für die heutigen Autobreiten, besteht kein Sicherheitsabstand gegen <.ref>Dooring</.ref>.</p>
    <h4>Planung</h4> <p>Die Planung sieht vor die bestehende Platzaufteilung bis auf wenige Ausnahmen beizubehalten. Dies bedeutet das die Radwege mit meist 1,5m unter den heutigen Mindestmaßen bleiben. An der engsten Stelle sind  1,25m vorgesehen. Die KFZ-Parkplätze werden vollständig durch Fahrrad-Anlehnbügel ersetzt um die Sicherheit zu verbessern.</p>
    <p>Zwischen <.m bounds="10.024282,53.567988,10.033422,53.570082">Obenaltenallee und dem Gymnasium Lerchenfeld</.m> wird der Radweg dagegen zu einem Zweirichtungsradweg verbreitert. Dieser wird bis auf eine Engstelle rund 2,80m breit. Man belässt hier eine Haltebucht für Krankentransporte zum <.m bounds="10.027979,53.569182,10.02916,53.569614">naheliegenden Ärztehaus</.m>, die wegen mangelndem Platz ohne Sicherheitsabstand an den Radweg grenzt.</p>
    <p>Die Einbahnstraßen <.m bounds="10.031086,53.565115,10.033893,53.566144">Uhlandstraße und Blaumenau</.m> werden für den Radverkehr in beide Richtungen freigegeben.</p>
    <h4>Meinung</h4> <p>Es gibt einige gute Ideen, wie den Zweirichtungsradweg um den Zugang zur Schule zu verbessern. Auch werden Fuß- und Radwege an Einmündungen ohne Ampeln ebenerdig durchgeführt. Die vielen neuen Anschließmöglichkeiten sind ebenfalls gut.</p>
    <p>Neben der mangelhaften Breite gibt es weitere Planungsfehler: Linksabbiegen ist nicht an allen Kreuzungen klar ersichtlich. An Einmündungen ist dies nur für den KFZ-Verkehr vorgesehen. Wie man der Veloroute 6 stadteinwärts an Markttagen folgen soll, bleibt ebenso offen.</p>
    <p>Man kann dem LSBG nicht vorwerfen, sie hätten es nicht versucht: es wurden auch Varianten erarbeitet, die dem Rad- und Fußverkehr akzeptable, dem Gesetz entsprechende Wege angeboten hätten. Dazu müsste man aber entweder viele Bäume fällen, oder den KFZ je eine Spur wegnehmen. Letzteres lehnten die „Behörde für Wirtschaft und Innovation“ und die „Behörde Inneres und Sport“ 2019 ab – der Durchsatz für KFZ und Busse war wichtiger. Was will man da noch sagen?</p>
    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
