defmodule Data.Article.Blog.BernerHeerweg do
  use Article.Default

  def name(), do: "#{created_at()}-6-berner-heerweg"
  def created_at(), do: ~D[2019-03-19]
  def updated_at(), do: ~D[2024-01-13]
  def title(), do: "Berner Heerweg (Radrouten 6 und 14, Bezirksroute W1, Freizeitroute 2)"

  def summary(),
    do:
      "2,5m breite gepflasterte Hochbordradwege. Fahrt entlang der Freizeitroute 2 diesmal mitbedacht. 30 Bäume und 22 Fahrradbügel kommen neu hinzu."

  # def start(), do: ~d[2025]
  # def stop(), do: ~d[2026]

  def type(), do: :planned

  def tags(), do: ["6", "w18", "br-wandsbek-w1", "FR2"]

  def links(_assigns) do
    [
      {"Lagepläne und Erläuterungen, 1. Entwurf der Neuplanung", "Januar 2024",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1020095"},
      {"Auswertung Infoveranstaltung", "Dezember 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017818"},
      {"Infoseite der Stadt zum Berner Heerweg", "Oktober 2022",
       "https://www.hamburg.de/wandsbek/bezirkliche-radverkehrsmassnahmen/15275274/umbaumassnahme-berner-heerweg/"},
      {"Möglicher Bautermin", "Stand 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1016643"},
      {"Entscheidung zur kompletten Neuplanung", "2020",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1013329"},
      {"Lagepläne und Erläuterungen", "veraltet, 2019",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1009931"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Januar 2024</h4>
    <p>Der erste Entwurf der Neuplanung wurde veröffentlicht. Die ursprüngliche Umplanung wurde 2020 kurzfristig verworfen. Der Artikel beschreibt nun die Neuplanung.</p>

    <h4>Alter Zustand</h4>
    <p>Es sind beidseitig <.ref>Hochbordradwege</.ref> vorhanden, meist 1,50m bis 1,60m breit. Die Wege sind bis auf wenige Ausnahmen mit alten Pflastersteinen befestigt. Deren abgerundeten Kanten bilden Unebenheiten, durch die mehr Kraftaufwand nötig ist. Die Radwege dürfen nur in ihre jeweilige Fahrtrichtung benutzt werden.</p>

    <h4>Planung</h4>
    <p>Es sind beidseitig je 2,5m breite <.ref>Hochbordradwege</.ref> geplant. Sie sollen wieder gepflastert werden. Die neuen Pflastersteine haben keine abgerundeten Kanten, sodass der Kraftaufwand gegenüber dem alten Pflaster sinkt.</p>

    <p>Um der <.a name="freizeitroute-2">Freizeitroute 2</.a> das Queren zu ermöglichen sind <.v bounds="10.121081,53.61186,10.126572,53.615675" lon={10.123554} lat={53.613673} dir="forward" ref="FR2">unter der U-Bahn-Brücke</.v> die Radwege in beide Richtungen befahrbar. Dazu werden sie mit 3,0m etwas breiter, und mit ↑↓ Pfeilen markiert. Der Seitenwechsel erfolgt über die Ampel an der <.v bounds="10.121081,53.61186,10.126572,53.615675" lon={10.123852} lat={53.613185} dir="forward" ref="FR2">Stargarder Straße</.v>.</p>

    <p><.v bounds="10.121504,53.611522,10.126226,53.614332" lon={10.124326} lat={53.613179} dir="backward" ref="14" highlight="Stargarder Straße">Aus der Stargarder Straße heraus</.v> ist <.ref>direktes Linksabbiegen</.ref> vorgesehen. Dazu gibt es auf der gegenüberliegenden Seite eine extra Rampe zum Radweg. Wer nur rechts abbiegen möchte, muss trotzdem an der Ampel warten.</p>

    <p><.v bounds="10.121504,53.611522,10.126226,53.614332" lon={10.1239} lat={53.613207} dir="forward" ref="14" highlight="Stargarder Straße">In die Stargarder Straße</.v> ist Linksabbiegen vom Hochbordradweg aus nur <.ref>indirekt</.ref> vorgesehen. Folgt man der Furt, landet man auf dem Radweg entlang des Berner Heerwegs ohne Möglichkeit geradlinig weiterzufahren. Anders als heute sind auf beiden Seiten Furten/Ampeln geplant.</p>

    <p>An den zahlreichen <.v bounds="10.119411,53.606528,10.123663,53.610402" lon={10.120854} lat={53.607548} dir="forward" ref="6">Einmündungen auf der Ostseite des Berner Heerwegs</.v> sind die Bordsteine nahe des Radwegs vorgesehen, damit dieser nur in angemessener Geschwindigkeit überfahren wird. Es handelt sich um klassische, abgerundete Bordsteine, wie man sie von vielen Einfahrten kennt. Der Höhenunterschied soll rund 5cm betragen.</p>

    <p>Neu hinzu kommen zahlreiche Grünflächen, die teilweise zwischen Gehweg und Radweg angelegt werden. 30 Bäume sollen neu gepflanzt werden und 22 Fahrradanlehnbügel aufgestellt werden. KFZ-Parkplätze bleiben links des Radwegs. Höhe <.v bounds="10.120826,53.608651,10.123133,53.609722" lon={10.122039} lat={53.609103} dir="forward" ref="6">Berner Heerweg 208</.v> wird eine <.ref name="Mittelinsel">Querungshilfe in Form einer Mittelinsel</.ref> gebaut. Gehwege werden meist 2,65m breit.</p>

    <h4>Meinung</h4>
    <p>Die Planung schafft es aus der hässlichen, innerstädtischen Autobahn eine Hauptstraße zu machen, aus der man nicht sofort fliehen will. Ohne Einschränkungen für den Autoverkehr übrigens. Dennoch gibt es Kritik:</p>

    <ul>
      <li>Das geplante Pflaster auf den Radwegen ist nach wenigen Jahren uneben und erfordert höheren Kraftaufwand. Sie sollten asphaltiert werden.</li>
      <li>Unachtsames Ein- und Ausfahren über den Radweg ist eine häufige Unfallursache. Zum einen werden nicht überall Bordsteine zum Radweg gesetzt. Zum anderen sind die 5cm Rundbordsteine nicht genug, um Schritttempo sicherzustellen.</li>
      <li>Der Einmündung an der Stargarder Straße fehlt noch Feinschliff. Es ist unklar, wo der Zweirichtungsverkehr endet und ob die Furten in beide Richtungen freigegeben sind. Wer links in die Nebenstraße abbiegt und der Radfurt folgt, wird effektiv auf den Fußweg geleitet. Die Furt muss so angepasst werden, dass sie die Weiterfahrt auf der Fahrbahn klar macht.</li>
    </ul>

    <p>Sollten diese Details behoben werden, ist die Neuplanung in allen Belangen besser als die „Asphaltwüste“ aus der Planung von 2019.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
