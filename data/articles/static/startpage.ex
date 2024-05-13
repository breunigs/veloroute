defmodule Data.Article.Static.Startpage do
  use Article.Static

  def name(), do: ""
  def title(), do: ""

  def summary("de"),
    do: "Alltags-, Freizeit- und Radschnellwege in der Metropolregion Hamburg"

  def summary("en"),
    do: "Commuter, leisure and long distance priority cycle routes in Hamburg's metropolitan area"

  def tags(), do: []

  def languages(), do: ~w[de en]

  def text(assigns) do
    assigns = assign(assigns, :de, assigns.lang == "de")

    ~H"""
    <%= if @de do %>
      <h3>Radwege erkunden</h3>
      <p>Lust mit dem Rad zu fahren, aber nicht sicher wohin? veloroute.hamburg gibt Aufschluss über die offiziellen Radrouten der Stadt. Schau Dich etwas um und dann… fahr Rad!</p>

      <h4>Alltagsrouten</h4>
      <p>Hamburg baut „Velorouten“ (auch: Radrouten) um im Alltag gut von A nach B zu kommen – zu jeder Tages- und Jahreszeit. Gebaut wird noch, aber oft sind diese Strecken heute schon besser als der offensichtliche Weg.</p>

      <p><.show_route_group group={:alltag}>Kartenansicht</.show_route_group> oder Route auswählen:</p>
    <% else %>
      <h3 lang="en">Explore cycle ways</h3>
      <p lang="en">Want to cycle, but not sure where to? veloroute.hamburg informs on the city's official cycle routes. Take a look, and then cycle!</p>

      <h4 lang="en">Commuter routes</h4>
      <p lang="en">Hamburg builds “<span lang="de">Velorouten</span>” (also: <span lang="de">Radrouten</span>) to get easily from A to B in daily life – any time of the day and year. Construction is ongoing, but the routes are already often better than the most direct way.</p>

      <p lang="en"><.show_route_group group={:alltag}>Map view</.show_route_group> or pick a route:</p>
    <% end %>

    <ol class="route-list">
      <li><.icon autoplay={true} name="1"><span translate="no">Rissen / Osdorfer Born</span></.icon></li>
      <li><.icon autoplay={true} name="2"><span translate="no">Eidelstedt</span></.icon></li>
      <li><.icon autoplay={true} name="3"><span translate="no">Niendorf</span></.icon></li>
      <li><.icon autoplay={true} name="4"><span translate="no">Langenhorn</span></.icon></li>
      <li><.icon autoplay={true} name="5"><span translate="no">Duvenstedt</span></.icon></li>
      <li><.icon autoplay={true} name="6"><span translate="no">Volksdorf</span></.icon></li>
      <li><.icon autoplay={true} name="7"><span translate="no">Rahlstedt / Jenfeld</span></.icon></li>
      <li style="break-before: column;"><.icon autoplay={true} name="8"><span translate="no">Bergedorf / Mümmelmannsberg</span></.icon></li>
      <li><.icon autoplay={true} name="9"><span translate="no">Bergedorf</span></.icon></li>
      <li><.icon autoplay={true} name="10"><span translate="no">Neugraben</span></.icon></li>
      <li><.icon autoplay={true} name="11"><span translate="no">Eißendorf</span></.icon></li>
      <li><.icon autoplay={true} name="12"><span translate="no">Altona</span></.icon></li>
      <li><.icon autoplay={true} name="13"><span translate="no">innerer Ring</span></.icon></li>
      <li><.icon autoplay={true} name="14"><span translate="no">äußerer Ring</span></.icon></li>
    </ol>

    <%= if @de do %>
      <h4>Freizeitrouten</h4>
      <p>Die Freizeitrouten führen durch Parks, Naturschutzgebiete und Wälder, zu Sehenswürdigkeiten und Ausflugszielen. Die Strecken sind klar auf Erholung ausgelegt – der Weg ist das Ziel.</p>

      <p><.show_route_group group={:freizeit}>Kartenansicht</.show_route_group> oder Route auswählen:</p>
    <% else %>
      <h4 lang="en">Leisure routes</h4>
      <p lang="en">Leisure routes go through parks, natural reserves and woods, to sights and leisure areas. The routes are meant for recreation – the journey is the reward.</p>

      <p lang="en"><.show_route_group group={:freizeit}>Map view</.show_route_group> or pick a route:</p>
    <% end %>

    <ol class="route-list">
      <li><.icon autoplay={true} name="1GR"><span translate="no">1. Grüner Ring</span></.icon></li>
      <li><.icon autoplay={true} name="FR1"><span translate="no">Alster</span></.icon></li>
      <li><.icon autoplay={true} name="FR2"><span translate="no">Osterbek</span></.icon></li>
      <li><.icon autoplay={true} name="FR3"><span translate="no">Wandse</span></.icon></li>
      <li><.icon autoplay={true} name="FR4"><span translate="no">Bille</span></.icon></li>
      <li><.icon autoplay={true} name="FR5"><span translate="no">Vier- und Marschlande</span></.icon></li>
      <li><.icon autoplay={true} name="FR6"><span translate="no">Elbbrücken</span></.icon></li>
      <li><.icon autoplay={true} name="FR7"><span translate="no">Harburger Berge</span></.icon></li>
      <li style="break-before: column;"><.icon autoplay={true} name="FR8"><span translate="no">Elbufer (Nordseite)</span></.icon></li>
      <li><.icon autoplay={true} name="FR9"><span translate="no">Klövensteen</span></.icon></li>
      <li><.icon autoplay={true} name="FR10"><span translate="no">Kollau</span></.icon></li>
      <li><.icon autoplay={true} name="FR11"><span translate="no">2. Grüner Ring</span></.icon></li>
      <li><.icon autoplay={true} name="FR12"><span translate="no">Tarpenbek</span></.icon></li>
      <li><.icon autoplay={true} name="FR13"><span translate="no">Dritte Meile</span></.icon></li>
      <li><.icon autoplay={true} name="FR14"><span translate="no">Alter Elbtunnel</span></.icon></li>
      <li><.icon autoplay={true} name="e"><span translate="no">Elbradweg (Südseite)</span></.icon></li>
    </ol>

    <%= if @de do %>
      <h4>Bezirke</h4>
      <p>Bezirksrouten sollen das Hauptnetz der Velorouten ergänzen. Sie sind noch im frühen Planungsstadium und nicht für alle Bezirke ausgearbeitet.</p>

      <p><.show_route_group group={:bezirk}>Kartenansicht</.show_route_group> oder Route auswählen:</p>
    <% else %>
      <h4 lang="en">Districts</h4>
      <p lang="en">District routes are meant to complement the main network for <span translate="no">Velorouten</span>. They are in an early planning stage and not yet available for all districts.</p>

      <p lang="en"><.show_route_group group={:bezirk}>Map view</.show_route_group> or pick a route:</p>
    <% end %>

    <table class="route-list" role="list">
      <tr role="group">
        <th translate="no">Eimsbüttel</th>
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
        <th translate="no">Hamburg-Nord</th>
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
        <th translate="no">Wandsbek</th>
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

    <%= if @de do %>
      <h4>Umland</h4>
      <p>Auch umliegende Gemeinden schaffen Vorzugsrouten für's Rad. „<.ref>Radschnellwege</.ref>“ (auch: Radrouten Plus) sollen die Metropolregion besser verbinden, sind bisher aber noch in der Planung und nicht befahrbar.</p>

      <p><.show_route_group group={:alltag}>Kartenansicht Alltagsrouten</.show_route_group> oder <.show_route_group group={:rsw}>Kartenansicht Radschnellwege</.show_route_group> oder Route auswählen:</p>
    <% else %>
      <h4 lang="en">Surroundings</h4>
      <p lang="en">Municipalities around Hamburg also develop priority cycle routes. “<.ref name="Radschnellweg">Cycle highways</.ref>” (also: <span translate="no">Radrouten Plus</span>) are meant to interconnect the metropolitan area, but are currently in planning and aren't usable yet.</p>

      <p lang="en"><.show_route_group group={:alltag}>Map view commuter routes</.show_route_group> or <.show_route_group group={:rsw}>map view cycle highways</.show_route_group> or pick a route:</p>
    <% end %>

    <table class="route-list" role="list">
      <tr role="group">
        <th translate="no">Pinneberg</th>
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
        <th translate="no">Norderstedt</th>
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
        <th translate="no">Ahrensburg</th>
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
    <h3><label for="query" lang={if @de, do: "de", else: "en"}><%= if @de, do: "Suche", else: "Search" %> 🔎</label></h3>
      <input type="search" id="query" placeholder={if @de, do: "z.B. Feldstraße, StadtRAD, Baustelle…", else: "e.g. Feldstraße, StadtRAD, Volksdorf…"} phx-keyup="search" phx-debounce="250" name="search_query" />
      <input type="submit" style="display: none" />
    </form>

    <%= if @de do %>
      <h3>Aktuelle Artikel</h3>
    <% else %>
      <h3 lang="en">Recent articles</h3>
    <% end %>
    <ol class="hide-bullets">
      <.list_articles :let={ref} refs={Article.List.recent()}>
        <.updated_at_time ref={ref} />
        <.article_link ref={ref}/>
      </.list_articles>
    </ol>

    <%= if @de do %>
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
          Die Verkehrsplanung kennt viele Konzepte und Begriffe, die sich nicht immer mit der Alltagssprache decken.
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
    <% else %>
      <p lang="en">
        <.a href="/changes#lastChanges">Show all articles</.a>
        or
        <.a href="/changes#getNotified">Subscribe to articles</.a>
      </p>

      <h3 lang="en">Additional features</h3>
      <ul role="list" style="list-style-type: none; padding: 0" lang="en">
        <li>
          <.a href="/quality#anchorplans"><strong>plans, construction sites and issues</strong></.a><br>
          …will be shown on higher zooms as gray backgrounds, which can be clicked.
        </li>
        <li>
          <.a href="/lexikon/fahrbahn-und-nebenflaechen"><strong>technical terms / lexicon</strong></.a><br>
          Traffic planning has many concepts and terms, which may differ from everyday language.
        </li>
        <li>
          <.a name="projekt"><strong>the project in detail</strong></.a><br>
          If you want to learn more about the technology used or how to help.
        </li>
        <li>
          <.a name="datenexport"><strong>video / data export </strong></.a><br>
          Special case? No problem, the site makes further use of the source material easy.
        </li>
      </ul>

      <h3 lang="en">Contact</h3>
      <p lang="en">Mistakes? Wishes? Old pictures? Write to me:<br><.mailto/></p>

      <h3 lang="en">Link recommendations</h3>
      <p lang="en">These are websites on the general topic of cycling and mobility in Hamburg, which are worth seeing:</p>
      <ul lang="en">
        <li><.a href="https://fahrrad.hamburg" translate="no">fahrrad.hamburg</.a> – the city's official site, with many features</li>
        <li><.a href="https://www.arnewitte.de/" translate="no">arnewitte.de</.a> – Blog on traffic planning, mobility and urban development</li>
        <li><.a href="http://hamburgize.com/" translate="no">hamburgize.com</.a> – Blog on cycling</li>
        <li><.a href="https://www.youtube.com/@FahrradstadtHH" translate="no">Fahrradstadt Hamburg</.a> – Video channel on daily biking</li>
        <li><.a href="https://www.nahverkehrhamburg.de/" translate="no">nahverkehrhamburg.de</.a> – News on short-distance traffic of the metropolitan area</li>
      </ul>
    <% end %>
    """
  end
end
