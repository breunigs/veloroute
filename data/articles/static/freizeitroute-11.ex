defmodule Data.Article.Static.Freizeitroute11 do
  use Article.Static

  def id(), do: "FR11"
  def route_group(), do: :freizeit
  def name(), do: "zweiter-gruener-ring"
  def title(), do: "2. Grüner Ring (FR11)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do:
      "Der Radroute entlang des zweiten grünen Rings führt einmal ganz im Kreis um die inneren Stadtteile herum"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "2. Grüner Ring",
        direction: :forward,
        from: "Teufelsbrück",
        to: "Rüschpark",
        parent_ref: __MODULE__,
        text: "2. Grüner Ring im Uhrzeigersinn",
        end_action: :loop,
        historic: %{
          "edee921c450ddf7374d9ead95c3564c9" => ~d[2024-04],
          "da42285f6af6c0bf24d50ffa4406ae2e" => ~d[2022-08]
        },
        videos: [
          {"2024-04-23-gr2/GX017242", "00:00:02.502", :end},
          {"2024-04-23-gr2/GX017243", :start, "00:02:35.155"},
          {"2024-04-23-gr2/GX017244", :start, :end},
          {"2024-04-23-gr2/GX017245", :start, :end},
          {"2024-04-23-gr2/GX017246", :start, "00:00:51.585"},
          {"2024-04-23-gr2/GX017247", "00:00:00.133", :end},
          {"2024-04-23-gr2/GX017248", :start, "00:00:04.471"},
          {"2024-04-23-gr2/GX017249", :start, :end},
          {"2024-04-23-gr2/GX017250", :start, :end},
          {"2024-04-23-gr2/GX017251", :start, "00:02:54.941"},
          {"2024-04-23-gr2/GX017252", "00:00:00.234", :end},
          {"2024-04-23-gr2/GX017253", :start, :end},
          {"2024-04-23-gr2/GX017254", :start, :end},
          {"2024-04-23-gr2/GX017255", :start, :end},
          {"2024-04-23-gr2/GX017256", :start, "00:01:06.033"},
          {"2024-04-23-gr2/GX017257", "00:00:00.267", :end},
          {"2024-04-23-gr2/GX017258", :start, "00:00:31.932"},
          {"2024-04-23-gr2/GX017259", "00:00:00.300", "00:00:19.219"},
          {"2024-04-23-gr2/GX017260", "00:00:00.133", :end},
          {"2024-04-23-gr2/GX017261", :start, :end},
          {"2024-04-23-gr2/GX017262", :start, "00:00:08.842"},
          {"2024-04-23-gr2/GX017263", "00:00:00.801", :end},
          {"2024-04-23-gr2/GX017264", :start, "00:00:42.376"},
          {"2024-04-23-gr2/GX017265", "00:00:00.367", :end},
          {"2024-04-23-gr2/GX017266", :start, "00:02:30.484"},
          {"2024-04-23-gr2/GX017267", "00:00:00.300", :end},
          {"2024-04-23-gr2/GX017268", :start, :end},
          {"2024-03-30-fr6-fr7/GX017007", :start, :end},
          {"2024-03-30-fr6-fr7/GX017008", :start, "00:00:13.947"},
          {"2024-04-23-gr2/GX017269", "00:00:00.334", "00:05:52.385"},
          {"2024-04-23-gr2/GX017269", "00:05:58.258", :end},
          {"2024-04-23-gr2/GX017270", :start, :end},
          {"2024-04-23-gr2/GX017271", :start, :end},
          {"2024-04-23-gr2/GX017272", :start, :end},
          {"2024-04-23-gr2/GX017273", :start, "00:02:39.660"},
          {"2024-04-23-gr2/GX017274", :start, :end},
          {"2024-04-23-gr2/GX017275", :start, "00:01:50.010"},
          {"2024-04-23-gr2/GX017275", "00:01:52.946", "00:01:58.585"},
          {"2024-04-23-gr2/GX017275", "00:03:29.376", :end},
          {"2024-04-23-gr2/GX017276", :start, :end},
          {"2024-04-23-gr2/GX017277", :start, "00:00:19.052"}
        ]
      },
      %Video.Track{
        renderer: 4,
        group: "2. Grüner Ring",
        direction: :backward,
        from: "Rüschpark",
        to: "Teufelsbrück",
        parent_ref: __MODULE__,
        text: "2. Grüner Ring gegen Uhrzeigersinn",
        end_action: :loop,
        videos: [
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011558", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011559", :start, "00:00:03.270"},
          {"2021-08-14-fr13-und-11alt/GX012639", "00:01:48.108", "00:02:05.225"},
          {"2021-08-14-fr13-und-11alt/GX012658", "00:00:00.367", "00:00:31.532"},
          {"2021-08-04-fr13-fr14/GX012514", "00:00:11.078", "00:00:18.318"},
          {"2021-09-18-rsw-stade/GX012828x.MP4.time_lapse.mkv", "00:00:15.482", "00:00:16.650"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011559", "00:00:09.510", "00:00:09.810"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011560", "00:00:06.440", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011561", :start, "00:00:47.247"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011561", "00:02:02.389", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011562", :start, "00:02:03.323"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011542", "00:00:00.701", "00:00:24.791"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011540", "00:01:32.693", "00:02:56.209"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011563", "00:00:00.033", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011564", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011565", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011566", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011567", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011568", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011569", :start, "00:01:00.994"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011572", "00:00:10.377", "00:01:13.106"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011573", "00:00:09.142", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011574", :start, "00:00:01.568"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011579", "00:00:01.735", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011580", :start, "00:04:01.608"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX021580", "00:00:23.891", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011581", :start, "00:00:42.910"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011581", "00:00:45.078", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011582", :start, :end},
          {"2021-07-18-whburg-and-on/GX012396", :start, :end},
          {"2021-07-18-whburg-and-on/GX012397", :start, "00:00:03.604"},
          {"2021-07-03-veloroute10/GX012091", "00:00:09.176", :end},
          {"2021-07-03-veloroute10/GX012092", :start, "00:00:03.070"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011584", "00:00:11.445", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011585", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011586", :start, "00:00:35.636"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011586", "00:01:19.313", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011587", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX021587", :seamless, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011588", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011589", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011590", :start, "00:02:42.596"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011590", "00:02:45.899", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011591", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011592", :start, "00:00:13.013"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011592", "00:00:27.895", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011593", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011594", :start, "00:00:22.155"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011597", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011598", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011599", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011600", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011601", :start, "00:00:26.260"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011602", "00:00:00.067", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011603", :start, "00:00:16.016"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011603", "00:00:18.685", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011604", :start, "00:01:35.562"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011604", "00:01:51.244", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011608", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011609", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011610", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011611", :start, "00:00:08.242"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011611", "00:00:19.853", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011612", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011613", :start, "00:00:33.166"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011614", "00:00:00.968", "00:00:33.233"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011615", "00:00:03.570", "00:01:47.441"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011616", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011617", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011618", :start, "00:01:06.133"},
          {"2021-08-08-fr9/GX012621", "00:01:43.170", :end},
          {"2021-08-08-fr9/GX012622", :start, "00:00:01.568"},
          {"2021-08-08-fr9/GX012627", "00:01:44.571", "00:01:51.612"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011619", "00:00:09.343", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011620", :start, "00:00:01.468"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011620", "00:00:15.716", :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011621", :start, :end},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011622", :start, :end},
          {"2021-08-04-fr13-fr14/GX012509", :start, :end},
          {"2021-08-04-fr13-fr14/GX012510", :start, "00:00:06.840"},
          {"2022-08-09-stade-rev/GX014446", :start, :end}
        ]
      }
    ]

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6718200/radtour-zweiter-gruener-ring/"},
      {"Komoot Routenplaner: äußere Ringroute", "https://www.komoot.com/de-de/tour/227481906"},
      ~H{Route in der OpenStreetMap: <.a href="https://www.openstreetmap.org/relation/190774">Teil 1</.a>, <.a href="https://www.openstreetmap.org/relation/191378">Teil 2</.a>, <.a href="https://www.openstreetmap.org/relation/191510">Teil 3</.a>}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 2. Grüner Ring <.icon>FR11</.icon></h3>
    <span class="updated">Länge rund 100km</span>

    <p>Abgesehen von der Fährverbindung zwischen Rüschpark und Teufelsbrück kommt man aus eigener Kraft durch bzw. um ganz Hamburg und Harburg.</p>
    <p>Im Uhrzeigersinn ab <.v bounds="9.851468,53.539706,9.870508,53.553705" lon={9.863568} lat={53.547208} dir="forward" ref={@ref}>Teufelsbrück</.v> (→ Anschluss an <.a name="freizeitroute-8">Freizeitroute 8</.a>) durchquert man den <.v bounds="9.854671,53.548388,9.865148,53.557919" lon={9.859542} lat={53.550814} dir="forward" ref={@ref}>Wesselhoeftpark</.v>, den <.v bounds="9.854671,53.548388,9.865148,53.557919" lon={9.861281} lat={53.5556} dir="forward" ref={@ref}>Westerpark</.v>, fährt am <.v bounds="9.853567,53.55741,9.86569,53.566104" lon={9.857711} lat={53.560788} dir="forward" ref={@ref}>Loki-Schmidt-Garten</.v> vorbei, erreicht über verschiedene Grünflächen den <.v bounds="9.866235,53.574012,9.881239,53.582162" lon={9.872404} lat={53.577378} dir="forward" ref={@ref}>Lise-Meitner-Park</.v> und nach einer Straßenquerung den <.v bounds="9.883239,53.5703,9.91343,53.586437" lon={9.892362} lat={53.582245} dir="forward" ref={@ref}>Altonaer Volkspark</.v> (→ <.a name="freizeitroute-9">FR 9</.a>).</p>
    <p>Vom Volkspark geht es zunächst unter der <.v bounds="9.91073,53.587385,9.925203,53.594185" lon={9.916667} lat={53.589595} dir="forward" ref={@ref}>Autobahn und Bahnstrecke</.v> über Kleingärten ins <.v bounds="9.919061,53.602563,9.956312,53.618992" lon={9.933204} lat={53.613957} dir="forward" ref={@ref}>Niendorfer Gehege</.v> (→ <.a name="freizeitroute-10">FR 10</.a>). Durch am Flughafen gelegene <.v bounds="9.955991,53.608678,10.00089,53.621816" lon={9.975431} lat={53.618639} dir="forward" ref={@ref}>Kleingärten</.v> (→ <.a name="freizeitroute-12">FR 12</.a>) erreicht man die <.v bounds="9.988016,53.605423,10.03233,53.622647" lon={10.004034} lat={53.612817} dir="forward" ref={@ref}>Alster</.v> (→ <.a name="freizeitroute-1">FR 1</.a>) und quert sie um zum <.v bounds="10.02749,53.611334,10.088789,53.633001" lon={10.037264} lat={53.619833} dir="forward" ref={@ref}>Friedhof Ohlsdorf</.v> zu gelangen.</p>
    <p>An <.v bounds="10.041797,53.609313,10.072183,53.620469" lon={10.068135} lat={53.618523} dir="forward" ref={@ref}>Steilshoop</.v> vorbei durch verschiedene Grünanlagen erreicht man die <.v bounds="10.090684,53.596093,10.103055,53.607322" lon={10.09632} lat={53.604114} dir="forward" ref={@ref}>Osterbek</.v> (→ <.a name="freizeitroute-2">FR 2</.a>) und in Tonndorf die <.v bounds="10.098075,53.580045,10.117876,53.590363" lon={10.109535} lat={53.585979} dir="forward" ref={@ref}>Wandse</.v> (→ <.a name="freizeitroute-3">FR 3</.a>). Nachdem man sich durch <.v bounds="10.106034,53.570443,10.143152,53.584543" lon={10.125261} lat={53.577663} dir="forward" ref={@ref}>Jenfeld</.v> geschlängelt hat, findet man im <.v bounds="10.131008,53.546987,10.156868,53.56712" lon={10.144001} lat={53.562685} dir="forward" ref={@ref}>Öjendorfer Park</.v> ein weitläufiges Grün. Entlang des Schleemer Bach erreicht man die <.v bounds="10.098589,53.531245,10.126185,53.544762" lon={10.112726} lat={53.533625} dir="forward" ref={@ref}>Bille</.v> (→ <.a name="freizeitroute-4">FR 4</.a>). Das nächste Etappenziel ist die <.v bounds="10.102072,53.486168,10.182988,53.526137" lon={10.140335} lat={53.511157} dir="forward" ref={@ref}>Boberger Niederung</.v>, und von dort geht es fast kerzengerade bis zur <.v bounds="10.082945,53.479021,10.132834,53.490622" lon={10.102589} lat={53.483961} dir="forward" ref={@ref}>Dove Elbe</.v> (→ <.a name="freizeitroute-5">FR 5</.a>).</p>
    <p>Die Tour macht nun einen Knick flussabwärts um zentrumsnah die <.v bounds="10.02178,53.528625,10.034956,53.536789" lon={10.025892} lat={53.53218} dir="forward" ref={@ref}>Elbe zu queren</.v>. Über die <.v bounds="10.007671,53.521237,10.034862,53.533568" lon={10.02122} lat={53.527237} dir="forward" ref={@ref}>Veddel</.v> und <.v bounds="9.974523,53.468133,10.060155,53.524281" lon={10.042857} lat={53.494946} dir="forward" ref={@ref}>Wilhelmsburg</.v> (→ <.a name="freizeitroute-6">FR 6</.a>), geht's am <.v bounds="9.991622,53.439671,10.050979,53.472508" lon={10.012905} lat={53.458} dir="forward" ref={@ref}>Neuländer See</.v> vorbei Richtung <.v bounds="9.965153,53.435419,9.987681,53.452427" lon={9.979077} lat={53.450359} dir="forward" ref={@ref}>Harburger Stadtpark</.v>.</p>
    <p>Durch Eißendorf und das <.v bounds="9.924443,53.453719,9.95028,53.471033" lon={9.941844} lat={53.461819} dir="forward" ref={@ref}>Heimfelder Holz</.v> (→ <.a name="freizeitroute-7">FR 7</.a>) erreicht man die <.v bounds="9.836318,53.476357,9.90998,53.521681" lon={9.903525} lat={53.484055} dir="forward" ref={@ref}>Dritte Meile</.v> im Alten Land (→ <.a name="freizeitroute-14">FR 14</.a>). Kurz vorm Ziel kommt man durch <.v bounds="9.844071,53.524436,9.889127,53.546172" lon={9.877899} lat={53.528461} dir="forward" ref={@ref}>Finkenwerder</.v> (→ <.a name="freizeitroute-13">FR 13</.a>) und den schließlich zum <.v bounds="9.857705,53.53993,9.866148,53.543285" lon={9.863281} lat={53.541299} dir="forward" ref={@ref}>Fähranleger Rüschpark</.v>.</p>

    <h4>Auffindbarkeit</h4>

    <p><img src="/images/logo_zweiter_gruener_ring.svg" style="float:left; padding: 3px 10px 10px 0; width: 100px" alt="Logo des zweiten Grünen Rings"/>Die Tour ist durchgehend beschildert und leicht zu finden. An den Wegweisern ist die Tour als „weiße 11 auf rotem Grund“ ausgezeichnet. Viel häufiger trifft man jedoch das abgebildete Logo an. Es klebt an Laternen, Schranken, Rückseiten von Schildern und sogar Mülleimern. Teilweise auch in verkürzter Form als weißer Pfeil auf grünem Grund.</p>
    <p>Leider gibt es dennoch einige nicht direkt ersichtliche Stellen. Eine Karte kann daher hilfreich sein. Faustregel: wenn es Abzweigungen gab und man das Logo nun länger nicht mehr gesehen hat, hat man sich verfahren.</p>
    <p>Es gibt mehrere Versionen der Tour, d.h. die aufgestellten Schilder und die GPS-Tourdaten im Internet stimmen nicht immer überein. Die von veloroute.hamburg orientieren sich an den Schildern, sofern man diesen sinnvoll folgen kann.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Abschnitte gestalten sich höchst unterschiedlich: von erstklassigem Asphalt über gute Feinschotter-Wege bis hin zu schlimmen Trampelpfaden ist auf der Tour alles vorhanden. Insgesamt ist sie daher nur bedingt regensicher. Diese Vielfalt gilt auch für's Platzangebot. Manche Abschnitte sind voll, andere eng und manchmal ist man auch lange alleine auf weiter Flur.</p>

    <h4>Meinung</h4>
    <p>Als einzige vollständig ausgeschilderte Freizeitroute ist der 2. Grüne Ring besonders gut als erste Radtour für Neulinge geeignet. Wer schon fester im Sattel sitzt kann den gesamten Ring auch an einem Tag absolvieren und die verschiedenen Landschaftstypen genießen. Perfekt ist die Tour nicht, zu häufig verhindern Drängelgitter oder Randsteine eine durchgehende Fahrt. Dennoch ist sie mit eine der besten Freizeitrouten die Hamburg anbietet.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
