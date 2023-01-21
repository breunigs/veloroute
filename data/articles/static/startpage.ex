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
    <p>Hamburg baut „Velorouten“ um im Alltag gut von A nach B zu kommen – zu jeder Tages- und Jahreszeit. Gebaut wird noch, aber oft sind diese Strecken heute schon besser als der offensichtliche Weg.</p>
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

    <h4>Umland</h4>
    <p>Auch umliegende Gemeinden schaffen Vorzugsrouten für's Rad. „<.ref>Radschnellwege</.ref>“ sollen die Metropolregion besser verbinden, sind bisher aber noch in der Planung und nicht befahrbar.</p>

    <table class="route-list">
      <tr>
        <th>Pinneberg</th>
        <td>
          <span>
            <.icon autoplay={true} name="rsw-elmshorn" bounds="9.76125,53.617704,9.873313,53.686535" lon={9.855594} lat={53.621113} dir="forward">RSW</.icon>
            <.icon autoplay={true} name="pinneberg-1">1</.icon>
            <.icon autoplay={true} name="pinneberg-2">2</.icon>
          </span>
          <span>
            <.icon autoplay={true} name="pinneberg-3">3</.icon>
            <.icon autoplay={true} name="pinneberg-4">4</.icon>
            <.icon autoplay={true} name="pinneberg-5">5</.icon>
          </span>
        </td>
      </tr><tr>
        <th>Norderstedt</th>
        <td>
          <span>
            <.icon autoplay={true} name="rsw-bad-bramstedt" bounds="9.967335,53.669097,10.062369,53.759085" lon={10.00096} lat={53.681306} dir="forward">RSW</.icon>
            <.icon autoplay={true} name="norderstedt-1">1</.icon>
            <.icon autoplay={true} name="norderstedt-2">2</.icon>
          </span>
          <span>
            <.icon autoplay={true} name="norderstedt-3">3</.icon>
            <.icon autoplay={true} name="norderstedt-4">4</.icon>
          </span>
        </td>
      </tr><tr>
        <th>Ahrensburg</th>
        <td>
          <span>
            <.icon autoplay={true} name="rsw-ahrensburg" bounds="10.143083,53.641867,10.288229,53.699555" lon={10.199777} lat={53.661468} dir="forward">RSW</.icon>
            <.icon autoplay={true} name="ahrensburg-a2">2</.icon>
            <.icon autoplay={true} name="ahrensburg-a3">3</.icon>
            <.icon autoplay={true} name="ahrensburg-a4">4</.icon>
            <.icon autoplay={true} name="ahrensburg-a5">5</.icon>
          </span>
          <span>
            <.icon autoplay={true} name="ahrensburg-a6">6</.icon>
            <.icon autoplay={true} name="ahrensburg-a7">7</.icon>
            <.icon autoplay={true} name="ahrensburg-a8">8</.icon>
            <.icon autoplay={true} name="ahrensburg-a9">9</.icon>
            <.icon autoplay={true} name="ahrensburg-a10">10</.icon>
          </span>
        </td>
      </tr>
    </table>

    <h3><label for="query">Suche 🔎</label></h3>
    <form phx-submit="search">
      <input type="search" id="query" placeholder="z.B. Feldstraße, StadtRAD, Baustelle…" phx-keyup="search" phx-debounce="500"/>
      <input type="submit" style="display: none" />
    </form>

    <h3>Aktuelle Artikel</h3>
    <ol class="hide-bullets">
      <.list_articles let={ref} refs={Article.List.recent()}>
        <.updated_at_time ref={ref} />
        <.article_link ref={ref}/>
      </.list_articles>
    </ol>

    <p>
      <.a href="/changes#lastChanges">Alle Artikel anzeigen</.a>
      oder
      <.a href="/changes#getNotified">Artikel abonnieren</.a>
    </p>

    <h3>Pläne, Baustellen und Probleme</h3>
    <p>…werden beim Hereinzoomen in der Karte grau hinterlegt angezeigt und sind anklickbar. <.a href="/quality#anchorplans">Genauere Erklärung</.a></p>

    <h3>Fachbegriffe</h3>
    <p>Die Verkehrsplanung kennt viele Konzepte und Begriffe, die sich nicht immer mit der Alltagsprache decken. <.a href="/lexikon/fahrbahn-und-nebenflaechen">Zum Lexikon</.a></p>

    <h3>Kontakt</h3>
    <p>Fehler? Wünsche? Alte Bilder? Schreib mir:<br><.mailto/></p>

    <h3>Details zum Projekt</h3>
    <p><.a name="projekt">Willst Du mehr über das veloroute.hamburg Projekt erfahren?</.a></p>
    """
  end
end
