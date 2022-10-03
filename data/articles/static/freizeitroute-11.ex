defmodule Data.Article.Static.Freizeitroute11 do
  use Article.Static

  def id(), do: "FR11"
  def route_group(), do: :freizeit
  def name(), do: "zweiter-gruener-ring"
  def title(), do: "2. Grüner Ring (FR11)"

  def color(), do: "#006106"

  def summary(),
    do:
      "Der Radroute entlang des zweiten grünen Rings führt einmal ganz im Kreis um die inneren Stadtteile herum"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "2. Grüner Ring",
        direction: :forward,
        from: "Teufelsbrück",
        to: "Rüschpark",
        parent_ref: __MODULE__,
        text: "2. Grüner Ring im Uhrzeigersinn",
        videos: [
          {"2021-08-04-fr13-fr14/GX012560", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011420", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011421", :start, "00:00:02.302"},
          {"2021-06-05-velorouten-1-1a-2/GX011668", "00:01:15.909", "00:01:18.378"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011421", "00:00:18.051",
           "00:00:45.379"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011421", "00:01:01.428",
           "00:01:56.483"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011421", "00:02:06.593", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011422", :start, "00:00:01.335"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011423", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011424", :start, "00:00:54.755"},
          {"2021-08-08-fr9/GX012627", "00:01:19.513", "00:01:37.698"},
          {"2021-08-08-fr9/GX012628", "00:00:02.402", :end},
          {"2021-08-08-fr9/GX012629", :start, "00:00:14.848"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011425", "00:00:15.916", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011426", :start, "00:01:08.268"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011426", "00:01:12.306",
           "00:05:00.066"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021426", "00:00:07.508",
           "00:00:42.709"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021426", "00:00:45.112", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011429", :start, "00:00:47.047"},
          {"2021-04-04-freizeitroute-12-speedup-5x/GX011159", "00:00:41.742", "00:02:33.286"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011430", "00:01:00.394", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011431", :start, "00:00:05.839"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011431", "00:00:25.659", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011432", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011433", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011434", :start, "00:02:27.648"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011435", "00:00:04.905",
           "00:01:39.900"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011437", "00:00:11.178", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011438", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011439", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011440", :start, "00:00:39.640"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011440", "00:00:59.026",
           "00:02:12.432"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011440", "00:02:22.876", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011441", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011442", "00:01:01.328",
           "00:02:37.290"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011442", "00:02:55.075", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011443", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011444", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011445", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011446", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011447", :start, :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021447", :seamless, "00:00:53.220"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011586", "00:01:00.861", "00:01:17.978"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX021447", "00:01:05.332", :end},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011448", :start, "00:02:44.564"},
          {"2021-04-03-freizeitroute-5-zeitraffer/GX021126", "00:01:51.979", "00:02:35.989"},
          {"2021-05-01-freizeit8-und-ring-nord-uhrzeiger/GX011449", "00:00:22.189",
           "00:00:44.945"},
          {"2021-04-17-freizeitrouten-6und-7/GX011261", "00:00:16.016", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011262", :start, "00:00:26.660"},
          {"2021-07-18-whburg-and-on/GX012389", "00:00:26.360", :end},
          {"2021-07-18-whburg-and-on/GX012390", :start, :end},
          {"2021-07-18-whburg-and-on/GX012391", :start, :end},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX011462x.MP4_time_lapse.mkv", :start,
           :end},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX021462x.MP4_time_lapse.mkv", :seamless,
           :end},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX031462x.MP4_time_lapse.mkv", :seamless,
           "00:00:33.767"},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX031462x.MP4_time_lapse.mkv",
           "00:00:36.904", :end},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX041462x.MP4_time_lapse.mkv", :seamless,
           :end},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn/GX011463x.MP4_time_lapse.mkv", :start,
           :end},
          {"2021-05-02-gruener-ring-sued-uhrzeigersinn-zeitraffer/GX011465", :start,
           "00:01:17.344"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011523", "00:00:43.377", :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011524", :start, :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011525", :start, :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011526", :start, "00:00:22.756"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011526", "00:00:56.823", :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011527", :start, :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011528", :start, "00:00:11.311"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011531", "00:00:53.787", :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011533", :start, :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011534", :start, "00:00:06.874"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011534", "00:00:09.343", :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011535", :start, :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011536", :start, :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011538", :start, :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011539", :start, "00:01:51.612"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011540", "00:00:00.467", "00:01:27.521"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011542", "00:00:46.747", :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011543", :start, :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011544", :start, :end},
          {"2022-08-09-stade-rev/GX014465", :start, "00:01:00.360"},
          {"2021-06-01-gruener-ring-gg-uhrzeiger/GX011561", "00:01:25.352", "00:01:25.953"},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011546", "00:00:58.692", :end},
          {"2021-05-30-gruener-ring-sued-uhrzeiger/GX011547", :start, "00:00:06.306"},
          {"2021-08-04-fr13-fr14/GX012513", "00:01:04.231", "00:01:12.272"},
          {"2021-08-14-fr13-und-11alt/GX012659", "00:00:01.001", "00:01:47.774"},
          {"2022-08-09-stade-rev/GX014469", "00:01:07.367", "00:01:37.698"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "2. Grüner Ring",
        direction: :backward,
        from: "Rüschpark",
        to: "Teufelsbrück",
        parent_ref: __MODULE__,
        text: "2. Grüner Ring gegen Uhrzeigersinn",
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
      {"Komoot Routenplaner: äußere Ringroute", "https://www.komoot.de/tour/227481906"},
      ~H{Route in der OpenStreetMap: <.a href="https://www.openstreetmap.org/relation/190774">Teil 1</.a>, <.a href="https://www.openstreetmap.org/relation/191378">Teil 2</.a>, <.a href="https://www.openstreetmap.org/relation/191510">Teil 3</.a>}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 2. Grüner Ring <.icon>FR11</.icon></h3>
    <span class="updated">Länge rund 100km</span>

    <p>Abgesehen von der Fährverbindung zwischen Rüschpark und Teufelsbrück kommt man aus eigener Kraft durch bzw. um ganz Hamburg und Harburg.</p>
    <p>Im Uhrzeigersinn ab <.m bounds="9.851468,53.539706,9.870508,53.553705" lon={9.863568} lat={53.547208} dir="forward">Teufelsbrück</.m> (→ Anschluss an <.a name="freizeitroute-8">Freizeitroute 8</.a>) durchquert man den <.m bounds="9.854671,53.548388,9.865148,53.557919" lon={9.859542} lat={53.550814} dir="forward">Wesselhoeftpark</.m>, den <.m bounds="9.854671,53.548388,9.865148,53.557919" lon={9.861281} lat={53.5556} dir="forward">Westerpark</.m>, fährt am <.m bounds="9.853567,53.55741,9.86569,53.566104" lon={9.857711} lat={53.560788} dir="forward">Loki-Schmidt-Garten</.m> vorbei, erreicht über verschiedene Grünflächen den <.m bounds="9.866235,53.574012,9.881239,53.582162" lon={9.872404} lat={53.577378} dir="forward">Lise-Meitner-Park</.m> und nach einer Straßenquerung den <.m bounds="9.883239,53.5703,9.91343,53.586437" lon={9.892362} lat={53.582245} dir="forward">Altonaer Volkspark</.m> (→ <.a name="freizeitroute-9">FR 9</.a>).</p>
    <p>Vom Volkspark geht es zunächst unter der <.m bounds="9.91073,53.587385,9.925203,53.594185" lon={9.916667} lat={53.589595} dir="forward">Autobahn und Bahnstrecke</.m> über Kleingärten ins <.m bounds="9.919061,53.602563,9.956312,53.618992" lon={9.933204} lat={53.613957} dir="forward">Niendorfer Gehege</.m> (→ <.a name="freizeitroute-10">FR 10</.a>). Durch am Flughafen gelegene <.m bounds="9.955991,53.608678,10.00089,53.621816" lon={9.975431} lat={53.618639} dir="forward">Kleingärten</.m> (→ <.a name="freizeitroute-12">FR 12</.a>) erreicht man die <.m bounds="9.988016,53.605423,10.03233,53.622647" lon={10.004034} lat={53.612817} dir="forward">Alster</.m> (→ <.a name="freizeitroute-1">FR 1</.a>) und quert sie um zum <.m bounds="10.02749,53.611334,10.088789,53.633001" lon={10.037264} lat={53.619833} dir="forward">Friedhof Ohlsdorf</.m> zu gelangen.</p>
    <p>An <.m bounds="10.041797,53.609313,10.072183,53.620469" lon={10.068135} lat={53.618523} dir="forward">Steilshoop</.m> vorbei durch verschiedene Grünanlagen erreicht man die <.m bounds="10.090684,53.596093,10.103055,53.607322" lon={10.09632} lat={53.604114} dir="forward">Osterbek</.m> (→ <.a name="freizeitroute-2">FR 2</.a>) und in Tonndorf die <.m bounds="10.098075,53.580045,10.117876,53.590363" lon={10.109535} lat={53.585979} dir="forward">Wandse</.m> (→ <.a name="freizeitroute-3">FR 3</.a>). Nachdem man sich durch <.m bounds="10.106034,53.570443,10.143152,53.584543" lon={10.125261} lat={53.577663} dir="forward">Jenfeld</.m> geschlängelt hat, findet man im <.m bounds="10.131008,53.546987,10.156868,53.56712" lon={10.144001} lat={53.562685} dir="forward">Öjendorfer Park</.m> ein weitläufiges Grün. Entlang des Schleemer Bach erreicht man die <.m bounds="10.098589,53.531245,10.126185,53.544762" lon={10.112726} lat={53.533625} dir="forward">Bille</.m> (→ <.a name="freizeitroute-4">FR 4</.a>). Das nächste Etappenziel ist die <.m bounds="10.102072,53.486168,10.182988,53.526137" lon={10.140335} lat={53.511157} dir="forward">Boberger Niederung</.m>, und von dort geht es fast kerzengerade bis zur <.m bounds="10.082945,53.479021,10.132834,53.490622" lon={10.102589} lat={53.483961} dir="forward">Dove Elbe</.m> (→ <.a name="freizeitroute-5">FR 5</.a>).</p>
    <p>Die Tour macht nun einen Knick flussabwärts um zentrumsnah die <.m bounds="10.02178,53.528625,10.034956,53.536789" lon={10.025892} lat={53.53218} dir="forward">Elbe zu queren</.m>. Über die <.m bounds="10.007671,53.521237,10.034862,53.533568" lon={10.02122} lat={53.527237} dir="forward">Veddel</.m> und <.m bounds="9.974523,53.468133,10.060155,53.524281" lon={10.042857} lat={53.494946} dir="forward">Wilhelmsburg</.m> (→ <.a name="freizeitroute-6">FR 6</.a>), geht's am <.m bounds="9.991622,53.439671,10.050979,53.472508" lon={10.012905} lat={53.458} dir="forward">Neuländer See</.m> vorbei Richtung <.m bounds="9.965153,53.435419,9.987681,53.452427" lon={9.979077} lat={53.450359} dir="forward">Harburger Stadtpark</.m>.</p>
    <p>Durch Eißendorf und das <.m bounds="9.924443,53.453719,9.95028,53.471033" lon={9.941844} lat={53.461819} dir="forward">Heimfelder Holz</.m> (→ <.a name="freizeitroute-7">FR 7</.a>) erreicht man die <.m bounds="9.836318,53.476357,9.90998,53.521681" lon={9.903525} lat={53.484055} dir="forward">Dritte Meile</.m> im Alten Land (→ <.a name="freizeitroute-14">FR 14</.a>). Kurz vorm Ziel kommt man durch <.m bounds="9.844071,53.524436,9.889127,53.546172" lon={9.877899} lat={53.528461} dir="forward">Finkenwerder</.m> (→ FR13) und den schließlich zum <.m bounds="9.857705,53.53993,9.866148,53.543285" lon={9.863281} lat={53.541299} dir="forward">Fähranleger Rüschpark</.m>.</p>

    <h4>Auffindbarkeit</h4>

    <p><img src="/images/logo_zweiter_gruener_ring.svg" style="float:left; padding: 3px 10px 10px 0; width: 100px" alt="Logo des zweiten Grünen Rings"/>Die Tour ist durchgehend beschildert und leicht zu finden. An den Wegweisern ist die Tour als „weiße 11 auf rotem Grund“ ausgezeichnet. Viel häufiger trifft man jedoch das abgebildete Logo an. Es klebt an Laternen, Schranken, Rückseiten von Schildern und sogar Mülleimern. Teilweise auch in verkürzter Form als weißer Pfeil auf grünem Grund.</p>
    <p>Leider gibt es dennoch einige nicht direkt ersichtliche Stellen. Eine Karte kann daher hilfreich sein. Faustregel: wenn es Abzweigungen gab und man das Logo nun länger nicht mehr gesehen hat, hat man sich verfahren.</p>
    <p>Es gibt mehrere Versionen der Tour, d.h. die aufgestellten Schilder und die GPS-Tourdaten im Internet stimmen nicht immer überein. Die von veloroute.hamburg orientieren sich an den Schildern, sofern man diesen sinnvoll folgen kann.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Abschnitte gestalten sich höchst unterschiedlich: von erstklassigem Asphalt über gute Feinschotter-Wege bis hin zu schlimmen Trampelpfaden ist auf der Tour alles vorhanden. Insgesamt ist sie daher nur bedingt regensicher. Diese Vielfalt gilt auch für's Platzangebot. Manche Abschnitte sind voll, andere eng und manchmal ist man auch lange alleine auf weiter Flur.</p>

    <h4>Meinung</h4>
    <p>Als einzige vollständig ausgeschilderte Freizeitroute ist der 2. Grüne Ring besonders gut als erste Radtour für Neulinge geeignet. Wer schon fester im Sattel sitzt kann den gesamten Ring auch an einem Tag absolvieren und die verschiedenen Landschaftstypen genießen. Perfekt ist die Tour nicht, zu häufig verhindern Drängelgitter oder Randsteine eine durchgehende Fahrt. Dennoch ist sie mit eine der besten Freizeitrouten die Hamburg anbietet.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx={true}/>
    """
  end
end
