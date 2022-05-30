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
      <li><.icon autoplay="true" name="1"><span>Rissen / Osdorfer Born</span></.icon></li>
      <li><.icon autoplay="true" name="2"><span>Eidelstedt</span></.icon></li>
      <li><.icon autoplay="true" name="3"><span>Niendorf</span></.icon></li>
      <li><.icon autoplay="true" name="4"><span>Langenhorn</span></.icon></li>
      <li><.icon autoplay="true" name="5"><span>Duvenstedt</span></.icon></li>
      <li><.icon autoplay="true" name="6"><span>Volksdorf</span></.icon></li>
      <li><.icon autoplay="true" name="7"><span>Rahlstedt / Jenfeld</span></.icon></li>
      <li style="break-before: column;"><.icon autoplay="true" name="8"><span>Bergedorf / Mümmelmannsberg</span></.icon></li>
      <li><.icon autoplay="true" name="9"><span>Bergedorf</span></.icon></li>
      <li><.icon autoplay="true" name="10"><span>Neugraben</span></.icon></li>
      <li><.icon autoplay="true" name="11"><span>Eißendorf</span></.icon></li>
      <li><.icon autoplay="true" name="12"><span>Altona</span></.icon></li>
      <li><.icon autoplay="true" name="13"><span>innerer Ring</span></.icon></li>
      <li><.icon autoplay="true" name="14"><span>äußerer Ring</span></.icon></li>
    </ol>
    <h4>Freizeitrouten</h4>
    <p>Die Freizeitrouten führen durch Parks, Naturschutzgebiete und Wälder, zu Sehenswürdigkeiten und Ausflugszielen. Die Strecken sind klar auf Erholung ausgelegt – der Weg ist das Ziel.</p>
    <ol class="route-list">
      <li><.icon autoplay="true" name="1GR"><span>1. Grüner Ring</span></.icon></li>
      <li><.icon autoplay="true" name="FR1"><span>Alster</span></.icon></li>
      <li><.icon autoplay="true" name="FR2"><span>Osterbek</span></.icon></li>
      <li><.icon autoplay="true" name="FR3"><span>Wandse</span></.icon></li>
      <li><.icon autoplay="true" name="FR4"><span>Bille</span></.icon></li>
      <li><.icon autoplay="true" name="FR5"><span>Vier- und Marschlande</span></.icon></li>
      <li><.icon autoplay="true" name="FR6"><span>Elbbrücken</span></.icon></li>
      <li><.icon autoplay="true" name="FR7"><span>Harburger Berge</span></.icon></li>
      <li style="break-before: column;"><.icon autoplay="true" name="FR8"><span>Elbufer (Nordseite)</span></.icon></li>
      <li><.icon autoplay="true" name="FR9"><span>Klövensteen</span></.icon></li>
      <li><.icon autoplay="true" name="FR10"><span>Kollau</span></.icon></li>
      <li><.icon autoplay="true" name="FR11"><span>2. Grüner Ring</span></.icon></li>
      <li><.icon autoplay="true" name="FR12"><span>Tarpenbek</span></.icon></li>
      <li><.icon autoplay="true" name="FR13"><span>Dritte Meile</span></.icon></li>
      <li><.icon autoplay="true" name="FR14"><span>Alter Elbtunnel</span></.icon></li>
      <li><.icon autoplay="true" name="e"><span>Elbradweg (Südseite)</span></.icon></li>
    </ol>

    <h3><label for="query">Suche 🔎</label></h3>
    <form phx-submit="search">
      <input type="search" id="query" placeholder="z.B. Feldstraße, StadtRAD, Baustelle…" phx-keyup="search" phx-debounce="500"/>
      <input type="submit" style="display: none" />
    </form>

    <h3>Aktuelle Artikel</h3>
    <ol class="hide-bullets">
      <.list_articles let={art} articles={Article.List.recent()}>
        <.updated_at_time article={art} />
        <.article_link article={art}/>
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
    <p><.a href="/projekt">Willst Du mehr über das veloroute.hamburg Projekt erfahren?</.a></p>
    """
  end
end
