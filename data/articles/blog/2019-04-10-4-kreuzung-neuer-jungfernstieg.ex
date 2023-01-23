defmodule Data.Article.Blog.KreuzungNeuerJungfernstieg do
  use Article.Default

  def name(), do: "#{created_at()}-4-kreuzung-neuer-jungfernstieg"
  def created_at(), do: ~D[2019-04-10]
  def updated_at(), do: ~D[2022-03-10]

  def title(), do: "Doppelknoten Neuer Jungfernstieg / Alsterufer (Veloroute 4)"

  def summary(),
    do:
      "2022: Zwischenlösung für Fahrtbeziehung Nord/Süd (Veloroute 4) und Kennedybrücke → Alsterglacis"

  def start(), do: ~d[2022-05-02]
  def stop(), do: ~d[2022-06-19]
  def construction_site_id_hh(), do: [45148]

  def type(), do: :finished

  def tags(), do: ["4"]

  def links(_assigns) do
    [
      {"Pressemitteilung zum fertigen Umbau", "Juni 2022",
       "https://www.hamburg.de/bvm/medien/16264052/2022-06-15-bvm-westlicher-doppelknoten/"},
      {"Lageplan Sofortmaßnahmen 2022",
       "https://web.archive.org/web/https://lsbg.hamburg.de/contentblob/15967470/d37b8a2fb6bf06a0ffbaeeca3e958535/data/esplanade-neuer-jungfernstieg-kennedybruecke-alsterglacis-abgestimmte-planung-plan.pdf"},
      {"Erläuterungsbereicht Sofortmaßnahmen 2022",
       "https://web.archive.org/web/https://lsbg.hamburg.de/contentblob/15967472/ca493f883b83cebfc36945e1aac3343a/data/esplanade-neuer-jungfernstieg-kennedybruecke-alsterglacis-abgestimmte-planung-bericht.pdf"},
      {"Planungsziele", "Anjes Tjarks, Twitter, 2022",
       "https://twitter.com/anjes_tjarks/status/1495396904938754048"},
      {
        "Erläuterungsbericht 2019",
        "veraltet, wird so nicht umgesetzt",
        "https://web.archive.org/web/https://lsbg.hamburg.de/contentblob/12432130/ddb27d99abdccdacd7bad70c44ad3096/data/doppelknoten-esplanade-neuer-jungfernstieg-abstimmungsunterlage-bericht.pdf"
      },
      {"Lageplan 2019", "veraltet, wird so nicht umgesetzt",
       "https://web.archive.org/web/https://lsbg.hamburg.de/contentblob/12432128/3e85e8095778bdb4b346996650c605ea/data/doppelknoten-esplanade-neuer-jungfernstieg-abstimmungsunterlage-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der „Doppelknoten“ besteht <.v bounds="9.992341,53.556692,9.994695,53.558311" lon={9.992984} lat={53.557079} dir="forward" ref="4">im Süden</.v> aus der Kreuzung Neuer Jungerfernstieg, Esplanade, Lombardsbrücke und <.v bounds="9.992815,53.557739,9.995264,53.559274" lon={9.993889} lat={53.558475} dir="forward" ref="4">im Norden</.v> aus der Kreuzung Alsterglacis, Warburgstraße, Alsterufer, Kennedybrücke.</p>

    <p>Der Radverkehr findet meist auf <.ref>Hochbordradwegen</.ref> statt. Ausnahmen sind in Fahrtrichtung Jungfernstieg <.v bounds="9.992815,53.557739,9.995264,53.559274" lon={9.994798} lat={53.559064} dir="backward" ref="4">Alsterufer</.v> und <.v bounds="9.992341,53.556692,9.994695,53.558311" lon={9.99298} lat={53.55735} dir="backward" ref="4">Neuer Jungfernstieg</.v>, wo im <.ref>Mischverkehr</.ref> gefahren werden muss.</p>

    <h4>Veraltete Pläne von 2019</h4>
    <p>Bereits 2019 wurden Pläne für einen Gesamtumbau der Kreuzung vorgestellt. Diese sollten ursprünglich 2020-2022 umgesetzt werden, aber das Zeitfenster verstrich. Momentan wird die Bahnbrücke am <.v bounds="9.997788,53.554357,10.005164,53.557432" lon={10.000818} lat={53.555599} dir="forward" ref="6">Ferdinandstor</.v> erneuert. Um KFZ- und Busverkehr nicht zu stark zu beeinträchtigen, ist daher ist ein Vollumbau des Doppelknotes frühestens ab 2025 möglich.</p>

    <p>Mit der <.a href="https://de.wikipedia.org/wiki/B%C3%BCrgerschaftswahl_in_Hamburg_2020">Bürgerschaftswahl 2020</.a> haben sich die politischen Mehrheiten zugunsten des Radverkehrs verschoben. Die Stadt einigte sich kurz danach mit dem <.a href="https://radentscheid-hamburg.de/2020/04/21/radentscheid-hamburg-einigt-sich-mit-rot-gruen-auf-verbesserungen-fuer-radverkehr-initiative-wird-sich-fuer-weitere-massnahmen-einsetzen/">Radentscheid Hamburg</.a>. Seitdem werden breitere Radwege mit guter Abtrennung vom KFZ-Verkehr bevorzugt (z.B. <.ref>Protected-Bike-Lanes</.ref>, keine <.ref>Radfahrstreifen in Mittellage</.ref>).</p>

    <p>Die Fahrtrichtung <.m bounds="9.990841,53.557233,9.99332,53.55827">Esplanade</.m> → <.m bounds="9.993413,53.556688,9.996116,53.557957">Lombardsbrücke</.m> soll beim Umbau „Neuer Jungfernstieg“ ebenfalls mitgeplant werden.</p>

    <p>Zusammengenommen erscheint es daher unwahrscheinlich, das die Planung von 2019 so umgesetzt wird.</p>

    <h4>Sofortmaßnahmen 2022</h4>
    <p>Es sind Teilverbesserungen für den Radverkehr vorgesehen. Diese lassen sich ohne großen Umbau erreichen:</p>
    <ul>
      <li><.m bounds="9.993725,53.55761,9.997101,53.558943">Kennedybrücke</.m> → <.m bounds="9.991635,53.558391,9.994205,53.559518">Alsterglacis</.m>: Die Führung wird begradigt. Der Schlenker über die <.m bounds="9.993361,53.558672,9.994709,53.559909">Warburgstraße</.m> entfällt.</li>
      <li><.v bounds="9.992815,53.557739,9.995264,53.559274" lon={9.994755} lat={53.559033} dir="backward" ref="4">Alsterufer</.v> → <.v bounds="9.992341,53.556692,9.994695,53.558311" lon={9.992956} lat={53.557327} dir="backward" ref="4">Neuer Jungfernstieg</.v>: sinngemäß wird eine der zwei KFZ-Spuren in eine Radspur umgewandelt. Teilweise sind Trennelemente zum KFZ-Verkehr vorgesehen. Unter der Brücke bleibt es jedoch beim alten Hochbordradweg, der künftig aber nur in Richtung Süden befahren werden darf. Entlang dieser Strecke gibt es nur noch zwei Ampeln: je eine vor der nördlichen und der südlichen Kreuzung.</li>
      <li><.v bounds="9.992341,53.556692,9.994695,53.558311" lon={9.992984} lat={53.557079} dir="forward" ref="4">Neuer Jungfernstieg</.v> → <.v bounds="9.992815,53.557739,9.995264,53.559274" lon={9.994767} lat={53.558858} dir="forward" ref="4">Alsterufer</.v>: diagonal über die Kreuzung erreicht man die freistehende Verkehrsinsel an der westlichen Röhre. Von hier quert man die KFZ-Linksabbieger Richtung HBF, fährt dann direkt links neben dem Brückenpfeiler weiter. Dazu wird auf der bisher ungenutzen Fläche ein <.ref>Hochbordradweg</.ref> angelegt. Die nördliche Kreuzung quert man wieder diagonal. Entlang dieser Strecke sind drei Ampeln zu beachten: vor der südlichen Kreuzung, dann auf der freistehenden Verkehrsinsel und nochmal eine vor der nördlichen Kreuzung.</li>
    </ul>
    <p>Die Ampeln werden für die neue Führung angepasst. Wo nötig werden die Aufstellflächen zum Linksabbiegen verschoben.</p>

    <h4>Meinung</h4>
    <p>Es ist klar, das diese Zwischenlösung nicht optimal ist. Das selbstgesteckte Ziel war es, die Fahrtbeziehungen entlang der Veloroute 4 zu verbessern. Das dürfte erreicht werden, da in beide Richtungen weniger Ampeln zu beachten sind als bisher. Dies sollte hoffentlich dazu führen, das nicht mehr illegal über den 1,5m schmalen Gehweg in der östlichen Röhre abgekürzt wird.</p>

    <p>Wer auf eine Verbesserung weiterer Fahrtbeziehungen hoffte, wird enttäuscht. Umbauten sind hier frühestens ab 2023, eher nach 2025 zu erwarten.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
