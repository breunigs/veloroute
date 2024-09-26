defmodule Data.Article.Blog.KellinghusenstrasseNord do
  use Article.Default

  def title(),
    do: "Kellinghusenstraße – Schrammsweg bis Winterhuder Brücke (Bezirksroute Nord N6)"

  def summary(),
    do:
      "Radfahrstreifen in Kellinghusen- und Ludolfstraße. Kreuzung mit eigenen Linksabbiege-Spuren von den Radwegen aus. Nördlicher Radweg (an der Mauer) wird sogar Protected-Bike-Lane."

  def type(), do: :planned
  def start(), do: ~d[2027Q2]

  def tags(), do: ["br-nord-n6"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "article",
        direction: :forward,
        from: "Loogeplatz",
        to: "Sierichstraße",
        parent_ref: __MODULE__,
        text: "Kellinghusenstraße (Richtung Winterhude)",
        videos: [
          {"2022-01-29-rickling/GX013200", "00:01:01.716", :end}
        ]
      }
    ]

  def map_image do
    Data.MapImage.new(
      __MODULE__,
      [
        {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
        {"ARGUS Stadt und Verkehr • Partnerschaft mbB", "https://www.argus-hh.de/kontakt-argus/"}
      ],
      {
        %{lat: 53.590889296, lon: 9.990872031},
        %{lat: 53.593314458, lon: 9.991730533},
        %{lat: 53.593072171, lon: 9.993671150},
        %{lat: 53.590647010, lon: 9.992812648}
      }
    )
  end

  def links(_assigns) do
    [
      {"Erläuterungsbericht", ~d[2024-09],
       "https://lsbg.hamburg.de/resource/blob/969732/a61a8cc130c937f7e773cc6f9b683866/eppendorfer-marktplatz-abschnitt-2-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan", ~d[2024-09],
       "https://lsbg.hamburg.de/resource/blob/969734/493d0fd054bc3291401261d51f543147/eppendorfer-marktplatz-abschnitt-2-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der <.v bounds="9.991618,53.590501,9.993471,53.592876" lon={9.99283} lat={53.592214} dir="forward" ref={@ref}>Kellinghusenstraße</.v> sind auf beiden Seiten 1,50m breite <.ref>Hochbordradwege</.ref> vorhanden. Wer mag, darf stellenweise auf der <.ref>Fahrbahn</.ref> radeln. Ähnlich sieht es in der <.v bounds="9.990269,53.592184,9.993511,53.593845" lon={9.992435} lat={53.592767} dir="backward" ref="br-nord-n6">Ludolfstraße</.v> aus, allerdings sind die Radwege nochmals schmaler.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Entlang der <.v bounds="9.991618,53.590501,9.993471,53.592876" lon={9.992319} lat={53.590832} dir="forward" ref={@ref}>Kellinghusenstraße</.v> werden die im südlichen Abschnitt vorhandenen <.ref>Radfahrstreifen</.ref> fortgeführt. Sie werden 1,63m bis 1,75m breit. Die alten Hochbordradwege werden zum Gehweg.</p>

    <p>In der <.v bounds="9.990748,53.592267,9.99347,53.593414" lon={9.991575} lat={53.59275} dir="forward" ref="br-nord-n6" highlight="Ludolfstraße">westlichen Ludolfstraße</.v> werden die Radfahrstreifen aus der <.a name="2023-10-28-eppendorfer-marktplatz">Planung zum Eppendorfer Marktplatz</.a> fortgesetzt. Sie werden mindestens 2,0m breit. Auf der <.v bounds="9.990883,53.592591,9.993989,53.593374" lon={9.993254} lat={53.593024} dir="backward" ref="br-nord-n6">Nordseite</.v> wird der Radwege durch einen Bordstein vom KFZ-Verkehr getrennt („<.ref>Protected-Bike-Lane</.ref>“). Auch hier werden die ehemaligen Radwege zu Gehwegen.</p>

    <p>In östlichen Ludolfstraße in Fahrtrichtung Winderhude wird auf <.v bounds="9.992112,53.591538,9.993735,53.593268" lon={9.992903} lat={53.592333} dir="forward" ref={@ref}>Höhe der St.-Johannis-Kirche</.v> auf einen Hochbordradweg aufgeleitet. Dieser ist zunächst 2,5m breit, im Kreuzungsbereich noch 2,0m und wird danach auf 1,0m verschmälert. Dort schließt er an den <.v bounds="9.992161,53.592261,9.99392,53.59334" lon={9.993019} lat={53.592694} dir="forward" ref={@ref}>alten Hochbordradweg</.v> an. Man behält diese Engstelle bei, um die vorhandenen Bäume schützen zu können.</p>

    <p>Von <.v bounds="9.991695,53.592279,9.9937,53.593231" lon={9.993396} lat={53.593067} dir="backward" ref="br-nord-n6" highlight="Ludolfstraße">Winterhuder Brücke in Richtung Eppendorfer Marktplatz</.v> wird man auf eine <.ref>Protected-Bike-Lane</.ref> abgeleitet. Diese wird bis zu 2,70m breit, wobei die Richtungsfahrstreifen in der Kreuzung je rund 1,70m breit werden. Der höhergelegene Gehweg bleibt unverändert.</p>

    <p><.m bounds="9.991857,53.592367,9.993285,53.593177" highlight="Kellinghusenstraße,Ludolfstraße">Im Kreuzungsbereich</.m> sind jeweils eigene Linksabbiegerspuren vom Radweg vorgesehen. Neu ermöglicht wird damit die Fahrt von der <.v bounds="9.992107,53.592003,9.993459,53.593286" lon={9.992837} lat={53.592226} dir="forward" ref={@ref}>Kellinghusenstraße</.v> nach <.v bounds="9.992107,53.592003,9.993459,53.593286" lon={9.99244} lat={53.592748} dir="backward" ref="br-nord-n6" highlight="Ludolfstraße">Westen</.v> ohne zwei Mal „falsch“ um die Kreuzung herumzufahren. Anders als heute sind jeweils Warteflächen zum Abbiegen vorgesehen.</p>

    <h4>Meinung</h4>
    <p>Die Planung verbessert die Situation erheblich, gerade im Kreuzungsbereich. Verglichen mit den alten Entwürfen ist die Neuplanung nochmals besser, weil sich die politischen Vorgaben zu Radwegqualität erhöht haben.</p>

    <p>Dennoch wären mehr Protektion und kompaktere Einmündungen in der Kellinghusenstraße möglich gewesen. Da dieser Lückenschluss ohne großen Umbau erfolgt, ist er dennoch zu begrüßen.</p>

    <p>Auch die Engstelle in Richtung Winterhuder Brücke lässt zu wünschen übrig. Dass man den Bordstein zum Schutz der Bäume nicht versetzen will, ist verständlich. Man hätte sich zumindest um eine Sonderlösung bemühen können, um ein Stück der Fahrbahn auf Radweghöhe anzuheben.</p>


    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>

    <h4>Sonstiges</h4>
    <p>Die Behörden nennen diese Umbaumaßnahme „Eppendorfer Marktplatz – Abschnitt 2“.</p>

    <h4>Abhängigkeiten Umbau</h4>
    <p>Der Umbau soll im nach dem Umbau „<.a name="2023-10-28-eppendorfer-marktplatz">Eppendorfer Marktplatz – Abschnitt 1</.a>“ erfolgen. Vorher muss aber die Fernwärmeleitung in der Kellinghusenstraße verlegt werden. Verzögerungen bei der Fernwärme verschieben entsprechend den Straßenumbau.</p>
    """
  end
end
