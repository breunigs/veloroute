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
      <p>Hamburg baut „Radrouten“ um im Alltag gut von A nach B zu kommen – zu jeder Tages- und Jahreszeit. Gebaut wird noch, aber oft sind diese Strecken heute schon besser als der offensichtliche Weg.</p>

      <p><.show_route_group group={:alltag}>Kartenansicht</.show_route_group> oder Route auswählen:</p>
    <% else %>
      <h3 lang="en">Explore cycle ways</h3>
      <p lang="en">Want to cycle, but not sure where to? veloroute.hamburg informs on the city's official cycle routes. Take a look, and then cycle!</p>

      <h4 lang="en">Commuter routes</h4>
      <p lang="en">Hamburg builds “<span lang="de">Velorouten</span>” (also: <span lang="de">Radrouten</span>) to get easily from A to B in daily life – any time of the day and year. Construction is ongoing, but the routes are already often better than the most direct way.</p>

      <p lang="en"><.show_route_group group={:radroute}>Map view</.show_route_group> or pick a route:</p>
    <% end %>

    <ol class="route-list">
      <li><.icon autoplay={true} ref={Radroute1}><span translate="no" style="hyphens: none">Rissen – Billstedt</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute2}><span translate="no" style="hyphens: none">Eidelstedt – Bergedorf</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute3}><span translate="no" style="hyphens: none">Niendorf – Veddel</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute4}><span translate="no" style="hyphens: none">Ochsenzoll – Sinstorf</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute5}><span translate="no" style="hyphens: none">Duvenstedt – Mundsburg</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute6}><span translate="no" style="hyphens: none">Jungfernstieg – Volksdorf</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute7}><span translate="no" style="hyphens: none">Schenefeld – Rahlstedt</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute8}><span translate="no" style="hyphens: none">Barmbek-Nord – Bergedorf</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute9}><span translate="no" style="hyphens: none">Krugkoppelbrücke – Berliner Tor</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute10}><span translate="no">Neu Wulmstorf – Alte Harburger Elbbrücke</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute11}><span translate="no" style="hyphens: none">Hafen – Stader Straße</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute12}><span translate="no" style="hyphens: none">Alsterdorf – Wilhelmsburg</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute13}><span translate="no" style="hyphens: none">Eißendorf – Seevetal</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute14}><span translate="no" style="hyphens: none">Altona – Alstervorland</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute15}><span translate="no" style="hyphens: none">Christuskirche – Alter Elbtunnel</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute16}><span translate="no" style="hyphens: none">Altona – Winterhude</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute17}><span translate="no" style="hyphens: none">UKE – Hamm</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute18}><span translate="no" style="hyphens: none">Eidelstedt – Neugraben</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute19}><span translate="no">Eidelstedt – Langenhorner Markt</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute20}><span translate="no" style="hyphens: none">Sasel – Tatenberg</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute21}><span translate="no" style="hyphens: none">Hafen – Moorfleet</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute22}><span translate="no">Hamm – Zollenspieker (Fähre)</span></.icon></li>
      <li><.icon autoplay={true} ref={Radroute23}><span translate="no">Veddel – Alte Harburger Elbbrücke</span></.icon></li>
      <li><.icon autoplay={true} ref={RadrouteConceptA}><span translate="no" style="hyphens: none">Blankenese – Hauptbahnhof</span></.icon></li>
      <li><.icon autoplay={true} ref={RadrouteConceptC}><span translate="no">Elbgaustraße – Sternschanze</span></.icon></li>
      <li><.icon autoplay={true} ref={RadrouteConceptD}><span translate="no" style="hyphens: none">Burgwedel – Niendorfer Marktplatz</span></.icon></li>
      <li><.icon autoplay={true} ref={RadrouteConceptE}><span translate="no">Osdorfer Born – Deckel Altona</span></.icon></li>
      <li><.icon autoplay={false} ref={RadrouteConceptB}><span translate="no" style="hyphens: none">(angedacht) Stellingen – Othmarschen</span></.icon></li>
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
      <li><.icon autoplay={true} ref={Freizeitroute0}><span translate="no">1. Grüner Ring</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute1}><span translate="no">Alster</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute2}><span translate="no">Osterbek</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute3}><span translate="no">Wandse</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute4}><span translate="no">Bille</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute5}><span translate="no">Vier- und Marschlande</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute6}><span translate="no">Elbbrücken</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute7}><span translate="no">Harburger Berge</span></.icon></li>
      <li style="break-before: column;"><.icon autoplay={true} ref={Freizeitroute8}><span translate="no">Elbufer (Nordseite)</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute9}><span translate="no">Klövensteen</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute10}><span translate="no">Kollau</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute11}><span translate="no">2. Grüner Ring</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute12}><span translate="no">Tarpenbek</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute13}><span translate="no">Dritte Meile</span></.icon></li>
      <li><.icon autoplay={true} ref={Freizeitroute14}><span translate="no">Alter Elbtunnel</span></.icon></li>
      <li><.icon autoplay={true} ref={FreizeitrouteElbradwegSued}><span translate="no">Elbradweg (Südseite)</span></.icon></li>
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
            <.icon role="listitem" autoplay={true} ref={BrEimsbuettelNordSued}>E1</.icon>
            <.icon role="listitem" autoplay={true} ref={BrEimsbuettelNiendorf}>E2</.icon>
            <.icon role="listitem" autoplay={true} ref={BrEimsbuettelEidelstedt}>E3</.icon>
            <.icon role="listitem" autoplay={true} ref={BrEimsbuettelIsebek}>E4</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} ref={BrEimsbuettelRotherbaum}>E5</.icon>
            <.icon role="listitem" autoplay={true} ref={BrEimsbuettelSued}>E6</.icon>
            <.icon role="listitem" autoplay={true} ref={BrEimsbuettelRotherbaumring}>E7</.icon>
          </span>
        </td>
      </tr><tr role="group">
        <th translate="no">Hamburg-Mitte</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} ref={BrMitte01}>M1</.icon>
            <.icon role="listitem" autoplay={true} ref={BrMitte02}>M2</.icon>
            <.icon role="listitem" autoplay={true} ref={BrMitte03}>M3</.icon>
            <.icon role="listitem" autoplay={true} ref={BrMitte04}>M4</.icon>
            <.icon role="listitem" autoplay={true} ref={BrMitte05}>M5</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} ref={BrMitte06}>M6</.icon>
            <.icon role="listitem" autoplay={true} ref={BrMitte07}>M7</.icon>
            <.icon role="listitem" autoplay={true} ref={BrMitte08}>M8</.icon>
            <.icon role="listitem" autoplay={true} ref={BrMitte09}>M9</.icon>
            <.icon role="listitem" autoplay={true} ref={BrMitte10}>M10</.icon>
          </span>
        </td>
      </tr><tr role="group">
        <th translate="no">Hamburg-Nord</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} ref={BrNordN1}>N1</.icon>
            <.icon role="listitem" autoplay={true} ref={BrNordN2}>N2</.icon>
            <.icon role="listitem" autoplay={true} ref={BrNordN3}>N3</.icon>
            <.icon role="listitem" autoplay={true} ref={BrNordN4}>N4</.icon>
            <.icon role="listitem" autoplay={true} ref={BrNordN5}>N5</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} ref={BrNordN6}>N6</.icon>
            <.icon role="listitem" autoplay={true} ref={BrNordN7}>N7</.icon>
            <.icon role="listitem" autoplay={true} ref={BrNordN8}>N8</.icon>
            <.icon role="listitem" autoplay={true} ref={BrNordN9}>N9</.icon>
          </span>
        </td>
      </tr><tr role="group">
        <th translate="no">Wandsbek</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} ref={BrWandsbekW1}>W1</.icon>
            <.icon role="listitem" autoplay={true} ref={BrWandsbekW2}>W2</.icon>
            <.icon role="listitem" autoplay={true} ref={BrWandsbekW3}>W3</.icon>
            <.icon role="listitem" autoplay={true} ref={BrWandsbekW4}>W4</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} ref={BrWandsbekW5}>W5</.icon>
            <.icon role="listitem" autoplay={true} ref={BrWandsbekW6}>W6</.icon>
            <.icon role="listitem" autoplay={true} ref={BrWandsbekW7}>W7</.icon>
            <.icon role="listitem" autoplay={true} ref={BrWandsbekW8}>W8</.icon>
          </span>
        </td>
      </tr><tr role="group">
        <th translate="no">Bergedorf</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} ref={BrBergedorfA}>BA</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} ref={BrBergedorfB}>BB</.icon>
          </span>
        </td>
      </tr>
    </table>

    <%= if @de do %>
      <h4>Umland</h4>
      <p>Auch umliegende Gemeinden schaffen Vorzugsrouten für's Rad. „<.ref>Radschnellwege</.ref>“ (auch: Radrouten Plus) sollen die Metropolregion besser verbinden, sind bisher aber noch in der Planung und nicht befahrbar.</p>

      <p><.show_route_group group={:radroute}>Kartenansicht Alltagsrouten</.show_route_group> oder Route auswählen:</p>
    <% else %>
      <h4 lang="en">Surroundings</h4>
      <p lang="en">Municipalities around Hamburg also develop priority cycle routes. “<.ref ref={LexikonRadschnellweg}>Cycle highways</.ref>” (also: <span translate="no">Radrouten Plus</span>) are meant to interconnect the metropolitan area, but are currently in planning and aren't usable yet.</p>

      <p lang="en"><.show_route_group group={:radroute}>Map view commuter routes</.show_route_group> or pick a route:</p>
    <% end %>

    <table class="route-list" role="list">
      <tr role="group">
        <th translate="no">Pinneberg</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} ref={RSWElmshorn} bounds="9.76125,53.617704,9.873313,53.686535" lon={9.855594} lat={53.621113} dir="forward">RSW</.icon>
            <.icon role="listitem" autoplay={true} ref={PinnebergVeloroute1}>1</.icon>
            <.icon role="listitem" autoplay={true} ref={PinnebergVeloroute2}>2</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} ref={PinnebergVeloroute3}>3</.icon>
            <.icon role="listitem" autoplay={true} ref={PinnebergVeloroute4}>4</.icon>
            <.icon role="listitem" autoplay={true} ref={PinnebergVeloroute5}>5</.icon>
          </span>
        </td>
      </tr><tr role="group">
        <th translate="no">Norderstedt</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} ref={RSWBadBramstedt} bounds="9.967335,53.669097,10.062369,53.759085" lon={10.00096} lat={53.681306} dir="forward">RSW</.icon>
            <.icon role="listitem" autoplay={true} ref={NorderstedtVeloroute1}>1</.icon>
            <.icon role="listitem" autoplay={true} ref={NorderstedtVeloroute2}>2</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} ref={NorderstedtVeloroute3}>3</.icon>
            <.icon role="listitem" autoplay={true} ref={NorderstedtVeloroute4}>4</.icon>
          </span>
        </td>
      </tr><tr role="group">
        <th translate="no">Ahrensburg</th>
        <td>
          <span>
            <.icon role="listitem" autoplay={true} ref={RSWAhrensburg} bounds="10.143083,53.641867,10.288229,53.699555" lon={10.199777} lat={53.661468} dir="forward">RSW</.icon>
            <.icon role="listitem" autoplay={true} ref={AhrensburgA2}>2</.icon>
            <.icon role="listitem" autoplay={true} ref={AhrensburgA3}>3</.icon>
            <.icon role="listitem" autoplay={true} ref={AhrensburgA4}>4</.icon>
            <.icon role="listitem" autoplay={true} ref={AhrensburgA5}>5</.icon>
          </span>
          <span>
            <.icon role="listitem" autoplay={true} ref={AhrensburgA6}>6</.icon>
            <.icon role="listitem" autoplay={true} ref={AhrensburgA7}>7</.icon>
            <.icon role="listitem" autoplay={true} ref={AhrensburgA8}>8</.icon>
            <.icon role="listitem" autoplay={true} ref={AhrensburgA9}>9</.icon>
            <.icon role="listitem" autoplay={true} ref={AhrensburgA10}>10</.icon>
          </span>
        </td>
      </tr>
    </table>

    <search role="search">
      <form id="search" method="GET" action="/suche" onsubmit="return false" phx-submit="search">
        <%= if @de do %>
          <h3><label for="query" lang="de">Suche 🔎</label></h3>
          <input type="search" id="query" placeholder="z.B. Feldstraße, StadtRAD, Baustelle…"  phx-change="search" phx-keyup="search" phx-debounce="250" name="search_query" />
        <% else %>
          <h3><label for="query" lang="en">Search 🔎</label></h3>
            <input type="search" id="query" placeholder="e.g. Feldstraße, StadtRAD, Volksdorf…" phx-change="search" phx-keyup="search" phx-debounce="250" name="search_query" />
        <% end %>
        <input type="submit" style="display: none" />
      </form>
    </search>

    <%= if @de do %>
      <h3>Aktuelle Artikel</h3>
    <% else %>
      <h3 lang="en">Recent articles</h3>
    <% end %>
    <ol class="hide-bullets">
      <.list_articles :let={ref} refs={Article.List.recent()}>
        <.updated_at_time ref={ref} lang={@lang}/>
        <.article_link ref={ref} lang={@lang}/>
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
          <.a ref={Projekt}><strong>Projektdetails</strong></.a><br>
          Details zur Technik oder wie Du mithelfen kannst, findest Du dort.
        </li>
        <li>
          <.a ref={Datenexport}><strong>Video / Datenexport</strong></.a><br>
          Spezialfall? Kein Problem, die Seite macht die Weiterverwendung des Materials einfach.
        </li>
      </ul>

      <h3>Kontakt</h3>
      <p>Fehler? Wünsche? Alte Bilder? Schreib mir:<br><.mailto/></p>

      <h3>Termine</h3>
      <ol role="list" style="list-style-type: none; padding: 0">
        <%= for appointment <- @appointments do %>
          <%= Appointments.Appointment.html(appointment, @lang) %>
        <% end %>
      </ol>
      <.a ref={Termine}><strong>mehr Termindetails anzeigen</strong></.a>

      <h3>Linkempfehlungen</h3>
      <p>Es gibt weitere Webseiten, die sich dem Thema Rad und Mobilität in Hamburg annehmen, die ich sehenswert finde:</p>
      <ul>
        <li><.a href="https://fahrrad.hamburg">fahrrad.hamburg</.a> – Die offizielle Seite der Stadt, mit vielen Funktionen</li>
        <%= if @device_os == "iOS" do %>
          <li><.a href="https://apps.apple.com/app/organic-maps/id1567437057" translate="no">Organic Maps</.a> – Smartphone App mit gutem Fahrrad-Routing</li>
        <% end %>
        <%= if @device_os == "Android" do %>
          <li><.a href="https://play.google.com/store/apps/details?id=app.organicmaps&amp;hl=de" translate="no">Organic Maps</.a> – Smartphone App mit gutem Fahrrad-Routing</li>
        <% end %>
        <li><.a href="https://brouter.de/brouter-web/#map=11/53.5816/10.0313/standard" translate="no">brouter.de</.a> – Routenplaner mit Profilen für jeden Fahrradtyp</li>
        <li><.a href="http://hamburgize.com/">hamburgize.com</.a> – Blog zu Fahrradthemen</li>
        <%!-- <li><.a href="https://www.youtube.com/@FahrradstadtHH">Fahrradstadt Hamburg</.a> – Videokanal zum Fahrradalltag</li> --%>
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
          <.a ref={Projekt}><strong>the project in detail</strong></.a><br>
          If you want to learn more about the technology used or how to help.
        </li>
        <li>
          <.a ref={Datenexport}><strong>video / data export </strong></.a><br>
          Special case? No problem, the site makes further use of the source material easy.
        </li>
      </ul>

      <h3 lang="en">Contact</h3>
      <p lang="en">Mistakes? Wishes? Old pictures? Write to me:<br><.mailto/></p>

      <h3 lang="en">Events</h3>
      <ol role="list" style="list-style-type: none; padding: 0">
        <%= for appointment <- @appointments do %>
          <%= Appointments.Appointment.html(appointment, @lang) %>
        <% end %>
      </ol>
      <.a ref={Termine}><strong>Show more event details</strong></.a>

      <h3 lang="en">Link recommendations</h3>
      <p lang="en">These are websites on the general topic of cycling and mobility in Hamburg, which are worth seeing:</p>
      <ul lang="en">
        <li><.a href="https://fahrrad.hamburg" translate="no">fahrrad.hamburg</.a> – the city's official site, with many features</li>
        <%= if @device_os == "iOS" do %>
          <li><.a href="https://apps.apple.com/app/organic-maps/id1567437057" translate="no">Organic Maps</.a> – smartphone app with proper bicycle routing</li>
        <% end %>
        <%= if @device_os == "Android" do %>
          <li><.a href="https://play.google.com/store/apps/details?id=app.organicmaps&hl=en"  translate="no">Organic Maps</.a> – smartphone app with proper bicycle routing</li>
        <% end %>
        <li><.a href="https://brouter.de/brouter-web/#map=11/53.5816/10.0313/standard" translate="no">brouter.de</.a> – Route planner with high customizability</li>
        <li><.a href="http://hamburgize.com/" translate="no">hamburgize.com</.a> – Blog on cycling</li>
        <%!-- <li><.a href="https://www.youtube.com/@FahrradstadtHH" translate="no">Fahrradstadt Hamburg</.a> – Video channel on daily biking</li> --%>
        <li><.a href="https://www.nahverkehrhamburg.de/" translate="no">nahverkehrhamburg.de</.a> – News on short-distance traffic of the metropolitan area</li>
      </ul>
    <% end %>
    """
  end
end
