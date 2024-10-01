defmodule Data.Article.Blog.HoheStrasse do
  use Article.Default

  def title(), do: "Hohe Straße"
  def updated_at(), do: ~D[2024-10-01]

  def summary(),
    do:
      "Beidseitige, durchgängige Einrichtungs-Radwege entlang der Hauptstrecke. Querung der Straßenseite bleibt schwierig bis unmöglich."

  def type(), do: :planned
  def start(), do: ~d[2025-10]
  def stop(), do: ~d[2027Q2]

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :forward,
        from: "Marmstorfer Weg",
        to: "Maretstraße",
        parent_ref: __MODULE__,
        text: "Hohe Straße Richtung Bahnhof",
        historic: %{
          "937caa469b25e473e5bf4c505965574a" => ~d[2024-05]
        },
        end_action: :reverse,
        videos: [
          {"2024-05-01-gr2gg/GX017329", "00:01:02.529", "00:01:28.288"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :backward,
        from: "Maretstraße",
        to: "Marmstorfer Weg",
        parent_ref: __MODULE__,
        text: "Hohe Straße Richtung Eißendorf",
        end_action: :reverse,
        historic: %{
          "7f59724c8a2658aef34164b97f38615c" => ~d[2024-05]
        },
        videos: [
          {"2024-05-01-gr2gg/GX017329", "00:01:35.295", "00:02:01.755"}
        ]
      }
    ]

  @attrib {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
  def map_image do
    [
      # Schlussverschickung
      # Data.MapImage.new(__MODULE__, @attrib, {
      #   %{lat: 53.450848251, lon: 9.968988257},
      #   %{lat: 53.454205801, lon: 9.978375348},
      #   %{lat: 53.451360979, lon: 9.981244507},
      #   %{lat: 53.448002957, lon: 9.971858310}
      # })

      # Schlussverschickung – Änderungen
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.450848691, lon: 9.968834457},
        %{lat: 53.452734900, lon: 9.974099204},
        %{lat: 53.451463140, lon: 9.975384605},
        %{lat: 53.449576932, lon: 9.970119858}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 3, {
        %{lat: 53.451782352, lon: 9.974526652},
        %{lat: 53.452215197, lon: 9.980868823},
        %{lat: 53.451259261, lon: 9.981054326},
        %{lat: 53.450826417, lon: 9.974712155}
      })
    ]
  end

  def links(_assigns) do
    [
      {"Detailänderungen des fertigen Entwurfs", ~d[2024-10],
       "https://lsbg.hamburg.de/resource/blob/972270/6f29a61b304bf6e8b8fe0bc9f7fbc62d/bremer-strasse-aenderung-zur-schlussverschickung-bericht-data.pdf"},
      {"Lagepläne mit den Detailänderungen", ~d[2024-10],
       "https://lsbg.hamburg.de/resource/blob/972286/532882e94025e592e7318c74769c2abd/bremer-strasse-aenderung-zur-schlussverschickung-plan-data.pdf"},
      {"Infoseite der Stadt", "https://lsbg.hamburg.de/bremer-strasse"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Oktober 2024</h4>
    <p>Der LSBG hat den fertigen Entwurf nochmal geändert. Der vorhandene Radweg an den Häusern 78a bis 86 bleibt, sodass diese weiterhin ohne Umwege mit dem Fahrrad erreicht werden können. Außerdem wird der Radweg auf der Nordseite in einem Abschnitt schmaler. Der Artikel wurde entsprechend angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>Es gibt an der <.v bounds="9.969367,53.450139,9.982296,53.452735" lon={9.977338} lat={53.451834} dir="backward" ref={@ref} highlight="Hohe Straße">Hohen Straße</.v> keinen durchgängigen Radweg. Der <.m bounds="9.969426,53.45038,9.972044,53.451059">Stummelradweg entlang der B75</.m> endet nach der <.m bounds="9.970609,53.450112,9.972829,53.451249" highlight="Marmstorfer Weg">Brücke über den Marmstorfer Weg</.m> im Nichts. Der spätere Zweirichtungsradweg lässt sich über den <.v bounds="9.971087,53.450693,9.975503,53.45217" lon={9.972029} lat={53.451765} dir="forward" ref={@ref}>Marmstorfer Weg</.v> und die <.v bounds="9.971087,53.450693,9.975503,53.45217" lon={9.973066} lat={53.451585} highlight="Hohe Straße" dir="forward" ref={@ref}>Nebenfahrbahn der Hohen Straße</.v> erreichen. Durch <.v bounds="9.977526,53.451097,9.981609,53.452744" lon={9.979206} lat={53.452113} dir="forward" ref={@ref}>einen Park</.v> lässt sich dann weiter Richtung Bahnhof fahren.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es sind beidseitig <.ref>Hochbordradwege</.ref> entlang der B75 geplant. Am <.m bounds="9.977587,53.450067,9.984093,53.452295">Beginn der Kraftfahrstraße</.m> folgen sie der abknickenden <.v bounds="9.978601,53.450732,9.984841,53.452605" lon={9.981493} lat={53.452038} dir="forward" ref={@ref} highlight="Hohe Straße">Hohen Straße</.v> und führen aus bzw. in den <.ref>Mischverkehr</.ref>. Die neuen Radwege dürfen nur in normaler Fahrtrichtung befahren werden.</p>

    <p>Der südliche Radweg wird meist 1,62m breit. Auch <em>vorhandenen</em> Abschnitte des nördlichen Radwegs werden so breit. Neue Abschnitte auf der Nordseite sind mit 2,0m geplant. Am <.m bounds="9.971416,53.450502,9.974411,53.451723">Fußweg-Tunnel zum Schulgarten</.m> bleibt auf der Nordseite eine Engstelle mit einem geteilten Rad- und Gehweg. Der Radweg in der <.v bounds="9.97168,53.451041,9.975102,53.452145" lon={9.973534} lat={53.45162} dir="forward" ref={@ref}>Nebenstrecke der Hohen Straße</.v> soll auch nach dem Umbau erhalten bleiben.</p>

    <h4>Meinung</h4>
    <p>Durchgängige Radwege die man nicht suchen muss sind super. So wird die Fahrt zum <.m bounds="9.971138,53.449875,9.978209,53.452433">Schulgarten</.m> aus Richtung Westen einfacher und man strandet nicht im Nirgendwo, wenn man sich nicht perfekt auskennt.</p>

    <p>Leider ist der südliche Radweg nur von der <.v bounds="9.968664,53.449909,9.979593,53.452207" lon={9.969285} lat={53.450552} dir="backward" ref={Data.Article.Blog.BremerStrasse1} highlight="Bremer Straße">Kreuzung mit der Bremer Straße</.v> erreichbar.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
