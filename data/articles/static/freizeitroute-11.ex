defmodule Data.Article.Static.Freizeitroute11 do
  use Article.Static

  def id(), do: "FR11"
  def route_group(), do: :freizeit
  def name(), do: "zweiter-gruener-ring"
  def title(), do: "2. Grüner Ring (FR11)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary("de"),
    do:
      "Die Radroute entlang des zweiten grünen Rings führt einmal ganz im Kreis um die inneren Stadtteile herum. Gesamtlänge rund 100km."

  def summary("en"),
    do:
      "The “second green ring” route goes around the inner districts in a large circle. Total length approx. 100km."

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
        renderer: 5,
        group: "2. Grüner Ring",
        direction: :backward,
        from: "Rüschpark",
        to: "Teufelsbrück",
        parent_ref: __MODULE__,
        text: "2. Grüner Ring gegen Uhrzeigersinn",
        end_action: :loop,
        historic: %{
          "a4831b7934f6e812be0f852a7f65f401" => ~d[2024-05],
          "8037a54fdf49f973c02de2bfaae57fef" => ~d[2022-08]
        },
        videos: [
          {"2024-05-01-gr2gg/GX017324", "00:00:37.371", "00:01:14.508"},
          {"2024-05-01-gr2gg/GX017324", "00:01:21.882", :end},
          {"2024-05-01-gr2gg/GX017325", :start, :end},
          {"2024-05-01-gr2gg/GX017326", :start, :end},
          {"2024-05-01-gr2gg/GX017327", :start, :end},
          {"2024-05-01-gr2gg/GX017328", :start, :end},
          {"2024-05-01-gr2gg/GX017329", :start, "00:00:52.853"},
          {"2024-05-01-gr2gg/GX017329", "00:02:09.529", :end},
          {"2024-05-01-gr2gg/GX017330", :start, :end},
          {"2024-05-01-gr2gg/GX017331", :start, :end},
          {"2024-05-01-gr2gg/GX017332", :start, :end},
          {"2024-05-01-gr2gg/GX017333", :start, :end},
          {"2024-05-01-gr2gg/GX017334", :start, :end},
          {"2024-05-01-gr2gg/GX017335", :start, "00:01:35.963"},
          {"2024-05-01-gr2gg/GX017336", "00:00:00.367", :end},
          {"2024-05-01-gr2gg/GX017337", "00:00:00.868", "00:00:28.295"},
          {"2024-05-01-gr2gg/GX017338", "00:00:00.267", :end},
          {"2024-05-01-gr2gg/GX017339", :start, :end},
          {"2024-05-01-gr2gg/GX017340", :start, :end},
          {"2024-05-01-gr2gg/GX017341", :start, :end},
          {"2024-05-01-gr2gg/GX017342", :start, :end},
          {"2024-05-01-gr2gg/GX017343", :start, :end},
          {"2024-05-01-gr2gg/GX017344", :start, :end},
          {"2024-05-01-gr2gg/GX017345", :start, "00:02:03.056"},
          {"2024-05-01-gr2gg/GX017346", "00:00:00.200", :end},
          {"2024-05-01-gr2gg/GX017347", :start, :end},
          {"2024-05-01-gr2gg/GX017348", :start, :end},
          {"2024-05-01-gr2gg/GX017349", :start, :end},
          {"2024-05-01-gr2gg/GX017350", :start, "00:00:08.675"},
          {"2024-05-01-gr2gg/GX017351", "00:00:00.501", :end},
          {"2024-05-01-gr2gg/GX017352", :start, :end},
          {"2024-05-01-gr2gg/GX017353", :start, :end},
          {"2024-05-01-gr2gg/GX017354", :start, "00:01:18.912"},
          {"2024-05-01-gr2gg/GX017355", "00:00:02.803", :end},
          {"2024-05-01-gr2gg/GX017356", :start, :end},
          {"2024-05-01-gr2gg/GX017357", :start, :end},
          {"2024-05-01-gr2gg/GX017358", :start, "00:00:55.956"},
          {"2024-05-01-gr2gg/GX017359", "00:00:00.100", :end},
          {"2024-05-01-gr2gg/GX017360", :start, :end},
          {"2024-05-01-gr2gg/GX017361", :start, :end},
          {"2024-05-01-gr2gg/GX017362", :start, "00:00:02.870"},
          {"2024-05-01-gr2gg/GX017322", "00:00:02.769", "00:00:19.653"},
          {"2024-05-01-gr2gg/GX017323", :start, :end},
          {"2024-05-01-gr2gg/GX017324", :start, "00:00:37.371"}
        ]
      }
    ]

  def links(%{lang: "en"} = assigns) do
    [
      {"official site of the city",
       "https://www.hamburg.de/radtour/6718200/radtour-zweiter-gruener-ring/"},
      {"Komoot route planner: outer ring route", "https://www.komoot.com/tour/227481906"},
      ~H{route in OpenStreetMap: <.a href="https://www.openstreetmap.org/relation/190774">part 1</.a>, <.a href="https://www.openstreetmap.org/relation/191378">part 2</.a>, <.a href="https://www.openstreetmap.org/relation/191510">part 3</.a>},
      {"PDF Hiking Map “Wanderkarte Abenteuer Grünes Netz”",
       "https://www.hamburg.de/resource/blob/280246/9d57872ce3c795ddeaadc77179f69e3f/wanderkarte-abent-gruen-barrierefreie-datei-data.pdf"}
    ]
  end

  def links(assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6718200/radtour-zweiter-gruener-ring/"},
      {"Komoot Routenplaner: äußere Ringroute", "https://www.komoot.com/de-de/tour/227481906"},
      ~H{Route in der OpenStreetMap: <.a href="https://www.openstreetmap.org/relation/190774">Teil 1</.a>, <.a href="https://www.openstreetmap.org/relation/191378">Teil 2</.a>, <.a href="https://www.openstreetmap.org/relation/191510">Teil 3</.a>},
      {"PDF Wanderkarte Abenteuer Grünes Netz",
       "https://www.hamburg.de/resource/blob/280246/9d57872ce3c795ddeaadc77179f69e3f/wanderkarte-abent-gruen-barrierefreie-datei-data.pdf"}
    ]
  end

  def languages(), do: ~w[de en]

  def text(%{lang: "en"} = assigns) do
    ~H"""
    <h3 lang="en">Leisure route “<span translate="no" lang="de">2. Grüner Ring</span>” (2nd green ring) <.icon>FR11</.icon></h3>
    <span class="updated" lang="en">length approx. 100km</span>

    <p lang="en">Apart from the ferry connection between <span translate="no" lang="de">Rüschpark</span> and <span translate="no" lang="de">Teufelsbrück</span> you can cycle through or around all of <span translate="no" lang="de">Hamburg</span> and <span translate="no" lang="de">Harburg</span>.</p>

    <p lang="en">Clockwise starting from <.v bounds="9.851468,53.539706,9.870508,53.553705" lon={9.863568} lat={53.547208} dir="forward" ref={@ref}>Teufelsbrück</.v> (→ connects to <.a name="freizeitroute-8">leisure route FR8</.a>) you cycle through <.v bounds="9.854671,53.548388,9.865148,53.557919" lon={9.859542} lat={53.550814} dir="forward" ref={@ref}>Wesselhoeftpark</.v>, <.v bounds="9.854671,53.548388,9.865148,53.557919" lon={9.861281} lat={53.5556} dir="forward" ref={@ref}>Westerpark</.v>, pass by <.v bounds="9.853567,53.55741,9.86569,53.566104" lon={9.857711} lat={53.560788} dir="forward" ref={@ref}>Loki-Schmidt-Garten</.v>, to reach <.v bounds="9.866235,53.574012,9.881239,53.582162" lon={9.872404} lat={53.577378} dir="forward" ref={@ref}>Lise-Meitner-Park</.v> through various green areas and, after a road crossing, <.v bounds="9.883239,53.5703,9.91343,53.586437" lon={9.892362} lat={53.582245} dir="forward" ref={@ref}>Altonaer Volkspark</.v> (→ <.a name="freizeitroute-9">FR 9</.a>).</p>
    <p lang="en">From Volkspark you pass under the <.v bounds="9.91073,53.587385,9.925203,53.594185" lon={9.916667} lat={53.589595} dir="forward" ref={@ref}>motorway and rails</.v>, then through garden plots into the <.v bounds="9.919061,53.602563,9.956312,53.618992" lon={9.933204} lat={53.613957} dir="forward" ref={@ref}>Niendorfer Gehege</.v> (→ <.a name="freizeitroute-10">FR 10</.a>). Via <.v bounds="9.955991,53.608678,10.00089,53.621816" lon={9.975431} lat={53.618639} dir="forward" ref={@ref}>garden plots</.v> next to the airport (→ <.a name="freizeitroute-12">FR 12</.a>) you reach the <.v bounds="9.988016,53.605423,10.03233,53.622647" lon={10.004034} lat={53.612817} dir="forward" ref={@ref}>Alster</.v> (→ <.a name="freizeitroute-1">FR 1</.a>) and cross it to arrive at <.v bounds="10.02749,53.611334,10.088789,53.633001" lon={10.037264} lat={53.619833} dir="forward" ref={@ref} lang="en">Ohlsdorf cemetary</.v>.</p>

    <p lang="en">Passing by <.v bounds="10.041797,53.609313,10.072183,53.620469" lon={10.068135} lat={53.618523} dir="forward" ref={@ref}>Steilshoop</.v> through green areas you get to the <.v bounds="10.090684,53.596093,10.103055,53.607322" lon={10.09632} lat={53.604114} dir="forward" ref={@ref}>Osterbek</.v> (→ <.a name="freizeitroute-2">FR 2</.a>) and in <span lang="de" translate="no">Tonndorf</span> the <.v bounds="10.098075,53.580045,10.117876,53.590363" lon={10.109535} lat={53.585979} dir="forward" ref={@ref}>Wandse</.v> (→ <.a name="freizeitroute-3">FR 3</.a>). After weaving through <.v bounds="10.106034,53.570443,10.143152,53.584543" lon={10.125261} lat={53.577663} dir="forward" ref={@ref}>Jenfeld</.v>, you'll find spacious green in <.v bounds="10.131008,53.546987,10.156868,53.56712" lon={10.144001} lat={53.562685} dir="forward" ref={@ref}>Öjendorfer Park</.v>. Alongside the <span lang="de" translate="no">Schleemer Bach</span> you'll reach the <.v bounds="10.098589,53.531245,10.126185,53.544762" lon={10.112726} lat={53.533625} dir="forward" ref={@ref}>Bille</.v> (→ <.a name="freizeitroute-4">FR 4</.a>). The next target is the <.v bounds="10.102072,53.486168,10.182988,53.526137" lon={10.140335} lat={53.511157} dir="forward" ref={@ref}>Boberger Niederung</.v>, and from there almost in a straight line towards the <.v bounds="10.082945,53.479021,10.132834,53.490622" lon={10.102589} lat={53.483961} dir="forward" ref={@ref}>Dove Elbe</.v> (→ <.a name="freizeitroute-5">FR 5</.a>).</p>
    <p lang="en">The tour now makes a turn, following the <span lang="de" translate="no">Elbe</span> downriver <.v bounds="10.02178,53.528625,10.034956,53.536789" lon={10.025892} lat={53.53218} dir="forward" ref={@ref} lang="en">to cross it</.v> near the city center. It takes you across <.v bounds="10.007671,53.521237,10.034862,53.533568" lon={10.02122} lat={53.527237} dir="forward" ref={@ref}>Veddel</.v> and <.v bounds="9.974523,53.468133,10.060155,53.524281" lon={10.042857} lat={53.494946} dir="forward" ref={@ref}>Wilhelmsburg</.v> (→ <.a name="freizeitroute-6">FR 6</.a>), passing the <.v bounds="9.991622,53.439671,10.050979,53.472508" lon={10.012905} lat={53.458} dir="forward" ref={@ref}>Neuländer See</.v> towards <.v bounds="9.965153,53.435419,9.987681,53.452427" lon={9.979077} lat={53.450359} dir="forward" ref={@ref}>Harburger Stadtpark</.v>.</p>
    <p lang="en">Passing through <span lang="de" translate="no">Eißendorf</span> and the <.v bounds="9.924443,53.453719,9.95028,53.471033" lon={9.941844} lat={53.461819} dir="forward" ref={@ref}>Heimfelder Holz</.v> (→ <.a name="freizeitroute-7">FR 7</.a>) you'll reach <.v bounds="9.836318,53.476357,9.90998,53.521681" lon={9.903525} lat={53.484055} dir="forward" ref={@ref}>Dritte Meile</.v> in the area of <span lang="de" translate="no">Altes Land</span> (→ <.a name="freizeitroute-14">FR 14</.a>). Near the end you'll pass through <.v bounds="9.844071,53.524436,9.889127,53.546172" lon={9.877899} lat={53.528461} dir="forward" ref={@ref}>Finkenwerder</.v> (→ <.a name="freizeitroute-13">FR 13</.a>) and finally to <.v bounds="9.857705,53.53993,9.866148,53.543285" lon={9.863281} lat={53.541299} dir="forward" ref={@ref} lang="en">ferry dock <span lang="de" translate="no">Rüschpark</span></.v>.</p>

    <h4 lang="en">Following the route</h4>
    <p lang="en"><img src="/images/logo_zweiter_gruener_ring.svg" style="float:left; padding: 3px 10px 10px 0; width: 100px" alt="Logo of the 2nd green ring"/>The route has continuous signage and easy to follow. On signposts the route is shown as “white 11 on red background”. More commonly you'll see the logo shown here. It's placed on street lamps, backsides of other signs, barriers and even trash cans. Sometimes just as a smaller variant with a white arrow on green background.</p>
    <p lang="en">Unfortunately, there are still some places where the route isn't obvious. A map can help. Rule of thumb: if there were junctions and you haven't seen the logo in a while, you probably took a wrong turn.</p>
    <p lang="en">There are multiple versions of this tour, so the signposts and GPS routes from the internet don't always match. The variant shown on veloroute.hamburg follows the signposts, whenever that is reasonably possible.</p>

    <h4 lang="en">Printed map</h4>
    <img src="/images/wanderkarte_fr11.svg" style="float: right; height: 10.2rem; margin: -0.5rem 0 0.1rem 0.6rem" alt="front cover of the Wanderkarte – Abenteuer Grünes Netz" title="front cover of the Wanderkarte – Abenteuer Grünes Netz | © BUKEA/Studio Käfig"/>
    <p lang="en">The printed <em lang="de">Wanderkarte – Abenteuer Grünes Netz</em> can be found in Hamburgs <.search query="Bücherhalle Bücherhallen Hamburg" lang="de">Bücherhallen</.search>, its <.search query="Kundenzentrum Bezirksamt" lang="de">Kundenzentren</.search>, in the <.m bounds="9.996022,53.495824,10.008629,53.501451" lon={10.004101} lat={53.497537}>foyer of <span lang="de">Behörde für Umwelt, Klima, Energie und Agrarwirtschaft</span></.m> and many art, culture and social venues. You can also order it via <.mailto email="publikationen@bukea.hamburg.de" subject="Wanderkarte Abenteuer Grünes Netz bestellen" body="Guten Tag,

    ich möchte gerne die Wanderkarte Abenteuer Grünes Netz bestellen. Meine Adresse lautet:

    (address here)

    Vielen Dank">publikationen@bukea.hamburg.de</.mailto>.</p>

    <h4 lang="en" style="clear: both">Comfort / Quality</h4>
    <p lang="en">The segments vary a lot: from smooth asphalt, to well made fine gravel paths, to bad trails – you'll find them all on this route. Therefore parts of the route are not suitable for rainy conditions. The same idea also applies to the available space. Some parts are crowded, some are narrow and sometimes you won't meet anybody for a while. Pedestrians have the right of way in all of Hamburg's green spaces, so yield or get off your bike if necessary.</p>

    <h4 lang="en">Opinion</h4>
    <p lang="en">Being Hamburg's sole route with decent signage, the 2nd green ring is very suited as a tour for beginners. More advanced cyclists can also complete the tour in a single day and enjoy the varied landscape. The tour isn't perfect and requires you to get off your bike at various barriers and non-lowered curbs. Nonetheless it is one of the best leisure routes Hamburg has to offer.</p>

    <h3 lang="en">External links</h3>
    <.structured_links ref={@ref} gpx={true} lang="en"/>
    """
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

    <h4>Papierkarte</h4>
    <img src="/images/wanderkarte_fr11.svg" style="float: right; height: 10.2rem; margin: -0.5rem 0 0.1rem 0.5rem" alt="Deckblatt der Wanderkarte Abenteuer Grünes Netz" title="Deckblatt der Wanderkarte Abenteuer Grünes Netz | © BUKEA/Studio Käfig"/>
    <p>Die gedruckte <em>Wanderkarte – Abenteuer Grünes Netz</em> findet sich in Hamburgs <.search query="Bücherhalle Bücherhallen Hamburg">Bücherhallen</.search>, den <.search query="Kundenzentrum Bezirksamt">Kundenzentren der Stadt</.search>, im <.m bounds="9.996022,53.495824,10.008629,53.501451" lon={10.004101} lat={53.497537}>Foyer der Behörde für Umwelt, Klima, Energie und Agrarwirtschaft</.m> und weiteren Kunst-, Kultur- und Sozialeinrichtungen. Sie kann auch über <.mailto email="publikationen@bukea.hamburg.de" subject="Wanderkarte Abenteuer Grünes Netz bestellen" body="Guten Tag,

    ich möchte gerne die Wanderkarte Abenteuer Grünes Netz bestellen. Meine Adresse lautet:



    Vielen Dank">publikationen@bukea.hamburg.de</.mailto> bestellt werden.</p>

    <h4 style="clear: both">Befahrbarkeit</h4>
    <p>Die Abschnitte gestalten sich höchst unterschiedlich: von erstklassigem Asphalt über gute Feinschotter-Wege bis hin zu schlimmen Trampelpfaden ist auf der Tour alles vorhanden. Insgesamt ist sie daher nur bedingt regensicher. Diese Vielfalt gilt auch für's Platzangebot. Manche Abschnitte sind voll, andere eng und manchmal ist man auch lange alleine auf weiter Flur.</p>

    <h4>Meinung</h4>
    <p>Als einzige vollständig ausgeschilderte Freizeitroute ist der 2. Grüne Ring besonders gut als erste Radtour für Neulinge geeignet. Wer schon fester im Sattel sitzt kann den gesamten Ring auch an einem Tag absolvieren und die verschiedenen Landschaftstypen genießen. Perfekt ist die Tour nicht, zu häufig verhindern Drängelgitter oder Randsteine eine durchgehende Fahrt. Dennoch ist sie mit eine der besten Freizeitrouten die Hamburg anbietet.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
