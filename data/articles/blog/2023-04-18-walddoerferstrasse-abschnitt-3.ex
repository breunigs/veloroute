defmodule Data.Article.Blog.WalddoerferstrasseAbschnitt3 do
  use Article.Default

  def title(),
    do:
      "Walddörferstraße (Abschnitt 3 – Am Stadtrand bis Berner Heerweg – Bezirksroute W1 und 2. Grüner Ring)"

  def summary(),
    do: "Tempo-30 im Mischverkehr, leicht schmalere Fahrbahn mit vielen Einengungen (Gehwegnasen)"

  def type(), do: :planned

  def tags(), do: ["br-wandsbek-w1", "FR11"]

  def links(_assigns) do
    [
      {"Infoseite der Stadt zur Walddörferstraße",
       "https://www.hamburg.de/wandsbek/bezirkliche-radverkehrsmassnahmen/16368648/walddoerferstrasse/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr kann im Abschnitt nur im <.ref>Mischverkehr</.ref> fahren. Stellenweise sind noch Reste alter <.ref>Hochbordradwege</.ref> erkennbar, die aber weder durchgängig noch sicher befahrbar sind (etwa wegen <.ref>Dooring</.ref>).</p>

    <h4>Planung (1. Entwurf)</h4>
    <p>Es bleibt beim Mischverkehr. Das erlaubte Höchsttempo reduziert sich auf 30 km/h. Die asphaltierte Fahrbahn wird 6,0m breit und damit etwas schmaler als bisher. Zahlreiche Einengungen mit abgesenkten Bordsteinen („Gehwegnasen“) erlauben das leichtere Queren zu Fuß. Auch <.v bounds="10.10594,53.58871,10.111015,53.591377" lon={10.108483} lat={53.589791} dir="backward" ref="FR11">entlang des 2. Grünen Rings</.v> wird so eine Einengung eingerichtet.</p>

    <p>Die Busse halten <.v bounds="10.107576,53.591233,10.111579,53.592755" lon={10.109541} lat={53.591714} dir="forward" ref="br-wandsbek-w1">Am Hohen Hause</.v> in einer Busbucht, ansonsten direkt auf der Fahrbahn. Neu hinzu kommen Fahrradanlehnbügel und Sitzbänke.</p>

    <h4>Meinung</h4>
    <p>Das Hauptproblem im Abschnitt sind die knappen Überholvorgänge. Nur wenn sich diese durch die behutsamen Änderungen verringern, erzielt die Planung eine Verbesserung für den Radverkehr. Dass das durchweg klappt, darf bezweifelt werden. Leider wurden effektivere Maßnahmen abgelehnt.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
