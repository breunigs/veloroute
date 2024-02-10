defmodule Data.Article.Static.Startpage do
  use Article.Static

  def name(), do: ""
  def title(), do: ""

  def summary(),
    do: "Alltags-, Freizeit- und Radschnellwege in der Metropolregion Hamburg"

  def tags(), do: []

  def text(assigns) do
    ~H"""
    <h3>Radwege erkunden</h3>
    <p>Lust mit dem Rad zu fahren, aber nicht sicher wohin? veloroute.hamburg gibt Aufschluss über die offiziellen Radrouten der Stadt. Schau Dich etwas um und dann… fahr Rad!</p>

    <h4>Alltagsrouten</h4>
    <p>Hamburg baut „Velorouten“ (auch: Radrouten) um im Alltag gut von A nach B zu kommen – zu jeder Tages- und Jahreszeit. Gebaut wird noch, aber oft sind diese Strecken heute schon besser als der offensichtliche Weg.</p>
    <ol class="route-list">
      <li><.icon autoplay={true} name="1"><span>Rissen / Osdorfer Born</span></.icon></li>
      <li><.icon autoplay={true} name="2"><span>Eidelstedt</span></.icon></li>
      <li><.icon autoplay={true} name="3"><span>Niendorf</span></.icon></li>
      <li><.icon autoplay={true} name="4"><span>Langenhorn</span></.icon></li>
      <li><.icon autoplay={true} name="5"><span>Duvenstedt</span></.icon></li>
      <li><.icon autoplay={true} name="6"><span>Volksdorf</span></.icon></li>
      <li><.icon autoplay={true} name="7"><span>Rahlstedt / Jenfeld</span></.icon></li>
      <li style="break-before: column;"><.icon autoplay={true} name="8"><span>Bergedorf / Mümmelmannsberg</span></.icon></li>
      <li><.icon autoplay={true} name="9"><span>Bergedorf</span></.icon></li>
      <li><.icon autoplay={true} name="10"><span>Neugraben</span></.icon></li>
      <li><.icon autoplay={true} name="11"><span>Eißendorf</span></.icon></li>
      <li><.icon autoplay={true} name="12"><span>Altona</span></.icon></li>
      <li><.icon autoplay={true} name="13"><span>innerer Ring</span></.icon></li>
      <li><.icon autoplay={true} name="14"><span>äußerer Ring</span></.icon></li>
    </ol>
    <h4>Freizeitrouten</h4>
    <p>Die Freizeitrouten führen durch Parks, Naturschutzgebiete und Wälder, zu Sehenswürdigkeiten und Ausflugszielen. Die Strecken sind klar auf Erholung ausgelegt – der Weg ist das Ziel.</p>
    <ol class="route-list">
      <li><.icon autoplay={true} name="1GR"><span>1. Grüner Ring</span></.icon></li>
      <li><.icon autoplay={true} name="FR1"><span>Alster</span></.icon></li>
      <li><.icon autoplay={true} name="FR2"><span>Osterbek</span></.icon></li>
      <li><.icon autoplay={true} name="FR3"><span>Wandse</span></.icon></li>
      <li><.icon autoplay={true} name="FR4"><span>Bille</span></.icon></li>
      <li><.icon autoplay={true} name="FR5"><span>Vier- und Marschlande</span></.icon></li>
      <li><.icon autoplay={true} name="FR6"><span>Elbbrücken</span></.icon></li>
      <li><.icon autoplay={true} name="FR7"><span>Harburger Berge</span></.icon></li>
      <li style="break-before: column;"><.icon autoplay={true} name="FR8"><span>Elbufer (Nordseite)</span></.icon></li>
      <li><.icon autoplay={true} name="FR9"><span>Klövensteen</span></.icon></li>
      <li><.icon autoplay={true} name="FR10"><span>Kollau</span></.icon></li>
      <li><.icon autoplay={true} name="FR11"><span>2. Grüner Ring</span></.icon></li>
      <li><.icon autoplay={true} name="FR12"><span>Tarpenbek</span></.icon></li>
      <li><.icon autoplay={true} name="FR13"><span>Dritte Meile</span></.icon></li>
      <li><.icon autoplay={true} name="FR14"><span>Alter Elbtunnel</span></.icon></li>
      <li><.icon autoplay={true} name="e"><span>Elbradweg (Südseite)</span></.icon></li>
    </ol>

    <h4>Bezirke</h4>
    <p>Bezirksrouten sollen das Hauptnetz der Velorouten ergänzen. Sie sind noch im frühen Planungsstadium und nicht für alle Bezirke ausgearbeitet.</p>
    <table class="route-list" role="list">
      <tr role="group">
        <th>Eimsbüttel</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} name="br-eimsbuettel-nord-sued">E1</.icon>
            <.icon role="listitem" autoplay={true} name="br-eimsbuettel-niendorf">E2</.icon>
            <.icon role="listitem" autoplay={true} name="br-eimsbuettel-eidelstedt">E3</.icon>
            <.icon role="listitem" autoplay={true} name="br-eimsbuettel-isebek">E4</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} name="br-eimsbuettel-rotherbaum">E5</.icon>
            <.icon role="listitem" autoplay={true} name="br-eimsbuettel-sued">E6</.icon>
            <.icon role="listitem" autoplay={true} name="br-eimsbuettel-rotherbaumring">E7</.icon>
          </span>
        </td>
      </tr><tr role="group">
        <th>Hamburg-Nord</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} name="br-nord-n1">N1</.icon>
            <.icon role="listitem" autoplay={true} name="br-nord-n2">N2</.icon>
            <.icon role="listitem" autoplay={true} name="br-nord-n3">N3</.icon>
            <.icon role="listitem" autoplay={true} name="br-nord-n4">N4</.icon>
            <.icon role="listitem" autoplay={true} name="br-nord-n5">N5</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} name="br-nord-n6">N6</.icon>
            <.icon role="listitem" autoplay={true} name="br-nord-n7">N7</.icon>
            <.icon role="listitem" autoplay={true} name="br-nord-n8">N8</.icon>
            <.icon role="listitem" autoplay={true} name="br-nord-n9">N9</.icon>
          </span>
        </td>
      </tr><tr role="group">
        <th>Wandsbek</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} name="br-wandsbek-w1">W1</.icon>
            <.icon role="listitem" autoplay={true} name="br-wandsbek-w2">W2</.icon>
            <.icon role="listitem" autoplay={true} name="br-wandsbek-w3">W3</.icon>
            <.icon role="listitem" autoplay={true} name="br-wandsbek-w4">W4</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} name="br-wandsbek-w5">W5</.icon>
            <.icon role="listitem" autoplay={true} name="br-wandsbek-w6">W6</.icon>
            <.icon role="listitem" autoplay={true} name="br-wandsbek-w7">W7</.icon>
            <.icon role="listitem" autoplay={true} name="br-wandsbek-w8">W8</.icon>
          </span>
        </td>
      </tr>
    </table>

    <h4>Umland</h4>
    <p>Auch umliegende Gemeinden schaffen Vorzugsrouten für's Rad. „<.ref>Radschnellwege</.ref>“ (auch: Radrouten Plus) sollen die Metropolregion besser verbinden, sind bisher aber noch in der Planung und nicht befahrbar.</p>

    <table class="route-list" role="list">
      <tr role="group">
        <th>Pinneberg</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} name="rsw-elmshorn" bounds="9.76125,53.617704,9.873313,53.686535" lon={9.855594} lat={53.621113} dir="forward">RSW</.icon>
            <.icon role="listitem" autoplay={true} name="pinneberg-1">1</.icon>
            <.icon role="listitem" autoplay={true} name="pinneberg-2">2</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} name="pinneberg-3">3</.icon>
            <.icon role="listitem" autoplay={true} name="pinneberg-4">4</.icon>
            <.icon role="listitem" autoplay={true} name="pinneberg-5">5</.icon>
          </span>
        </td>
      </tr><tr role="group">
        <th>Norderstedt</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} name="rsw-bad-bramstedt" bounds="9.967335,53.669097,10.062369,53.759085" lon={10.00096} lat={53.681306} dir="forward">RSW</.icon>
            <.icon role="listitem" autoplay={true} name="norderstedt-1">1</.icon>
            <.icon role="listitem" autoplay={true} name="norderstedt-2">2</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} name="norderstedt-3">3</.icon>
            <.icon role="listitem" autoplay={true} name="norderstedt-4">4</.icon>
          </span>
        </td>
      </tr><tr role="group">
        <th>Ahrensburg</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} name="rsw-ahrensburg" bounds="10.143083,53.641867,10.288229,53.699555" lon={10.199777} lat={53.661468} dir="forward">RSW</.icon>
            <.icon role="listitem" autoplay={true} name="ahrensburg-a2">2</.icon>
            <.icon role="listitem" autoplay={true} name="ahrensburg-a3">3</.icon>
            <.icon role="listitem" autoplay={true} name="ahrensburg-a4">4</.icon>
            <.icon role="listitem" autoplay={true} name="ahrensburg-a5">5</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} name="ahrensburg-a6">6</.icon>
            <.icon role="listitem" autoplay={true} name="ahrensburg-a7">7</.icon>
            <.icon role="listitem" autoplay={true} name="ahrensburg-a8">8</.icon>
            <.icon role="listitem" autoplay={true} name="ahrensburg-a9">9</.icon>
            <.icon role="listitem" autoplay={true} name="ahrensburg-a10">10</.icon>
          </span>
        </td>
      </tr>
    </table>

    <form method="GET" action="/suche" onsubmit="return false" phx-submit="search" role="search">
    <h3><label for="query">Suche 🔎</label></h3>
      <input type="search" id="query" placeholder="z.B. Feldstraße, StadtRAD, Baustelle…" phx-keyup="search" phx-debounce="250" name="search_query" />
      <input type="submit" style="display: none" />
    </form>

    <h3>Aktuelle Artikel</h3>
    <ol class="hide-bullets">
      <.list_articles :let={ref} refs={Article.List.recent()}>
        <.updated_at_time ref={ref} />
        <.article_link ref={ref}/>
      </.list_articles>
    </ol>

    <p>
      <.a href="/changes#lastChanges">Alle Artikel anzeigen</.a>
      oder
      <.a href="/changes#getNotified">Artikel abonnieren</.a>
    </p>

    <h3>Weitere Funktionen</h3>
    <ul role="list" style="list-style-type: none; padding: 0">
      <li>
        <.a href="/quality#anchorplans"><strong>Pläne, Baustellen und Probleme</strong></.a><br>
        …werden beim Hereinzoomen in der Karte grau hinterlegt angezeigt und sind anklickbar.
      </li>
      <li>
        <.a href="/lexikon/fahrbahn-und-nebenflaechen"><strong>Fachbegriffe / Lexikon</strong></.a><br>
        Die Verkehrsplanung kennt viele Konzepte und Begriffe, die sich nicht immer mit der Alltagsprache decken.
      </li>
      <li>
        <.a name="projekt"><strong>Projektdetails</strong></.a><br>
        Details zur Technik oder wie Du mithelfen kannst, findest Du dort.
      </li>
      <li>
        <.a name="datenexport"><strong>Video / Datenexport</strong></.a><br>
        Spezialfall? Kein Problem, die Seite macht die Weiterverwendung des Materials einfach.
      </li>
    </ul>

    <h3>Kontakt</h3>
    <p>Fehler? Wünsche? Alte Bilder? Schreib mir:<br><.mailto/></p>

    <h3>Linkempfehlungen</h3>
    <p>Es gibt weitere Webseiten, die sich dem Thema Rad und Mobilität in Hamburg annehmen, die ich sehenswert finde:</p>
    <ul>
      <li><.a href="https://fahrrad.hamburg">fahrrad.hamburg</.a> – Die offizielle Seite der Stadt, mit vielen Funktionen</li>
      <li><.a href="https://www.arnewitte.de/">arnewitte.de</.a> – Blog zu Verkehrsplanung, Mobilität und Stadtentwicklung</li>
      <li><.a href="http://hamburgize.com/">hamburgize.com</.a> – Blog zu Fahrradthemen</li>
      <li><.a href="https://www.youtube.com/@FahrradstadtHH">Fahrradstadt Hamburg</.a> – Videokanal zum Fahrradalltag</li>
      <li><.a href="https://www.nahverkehrhamburg.de/">nahverkehrhamburg.de</.a> – Nachrichten zu Nahverkehrsthemen der Region</li>
    </ul>
    """
  end
end
