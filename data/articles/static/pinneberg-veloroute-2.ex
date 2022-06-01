defmodule Data.Article.Static.PinnebergVeloroute2 do
  use Article.Static

  def id(), do: "pinneberg-2"
  def display_id(), do: "2"
  def route_group(), do: :alltag
  def title(), do: "Pinneberg: Veloroute 2"

  def color(), do: "#0186d0"

  def summary(),
    do:
      "Veloroute 2 führt von Pinnebergs Zentrum nach Rellingen bzw. ab dem Bahnhof nach Halstenbek"

  def tags(), do: [id(), "pinneberg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Pinneberg 2 Rellingen",
        direction: :forward,
        from: "Pinneberg Zentrum",
        to: "Rellingen",
        parent_ref: __MODULE__,
        text: "vom Zentrum nach Rellingen",
        videos: [
          {"2022-05-31-pinneberg/GX024158", "00:03:55.936", :end},
          {"2022-05-31-pinneberg/GX014159", :start, "00:00:50.707"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Pinneberg 2 Rellingen",
        direction: :backward,
        from: "Rellingen",
        to: "Pinneberg Zentrum",
        parent_ref: __MODULE__,
        text: "von Rellingen zum Zentrum",
        videos: [
          {"2022-05-31-pinneberg/GX014159", "00:01:08.388", :end},
          {"2022-05-31-pinneberg/GX014160", :start, :end},
          {"2022-05-31-pinneberg/GX014161", :start, "00:00:07.875"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Pinneberg 2 Halstenbek",
        direction: :forward,
        from: "Pinneberg Bahnhof",
        to: "Halstenbek",
        parent_ref: __MODULE__,
        text: "vom Bahnhof nach Halstenbek",
        videos: [
          {"2022-05-31-pinneberg/GX014171", "00:00:53.420", :end},
          {"2022-05-31-pinneberg/GX014172", :start, "00:00:48.372"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Pinneberg 2 Halstenbek",
        direction: :backward,
        from: "Halstenbek",
        to: "Pinneberg Bahnhof",
        parent_ref: __MODULE__,
        text: "von Halstenbek zum Bahnhof",
        videos: [
          {"2022-05-31-pinneberg/GX024158", "00:00:56.712", "00:02:40.461"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Broschüre zu Pinnebergs Velorouten", "2022, PDF",
       "https://pinneberg.de/fileadmin/user_upload/faltblatt-veloroute-stand03-2022.pdf"},
      {"Stadt Pinneberg zur Ausschilderung",
       "https://pinneberg.de/leben-in-pinneberg?chash=6c835baef9601f60fe5950927b65f235&tx_news_pi1%5Baction%5D=detail&tx_news_pi1%5Bcontroller%5D=news&tx_news_pi1%5Bnews%5D=396&cHash=3a6be95e43c0e780cd932b199730ad9c"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Pinneberg: Veloroute 2 <.icon>pinneberg-2</.icon></h3>
    <p>Die Route besteht aus zwei nicht zusammenhängenden Abschnitten:</p>
    <ul>
      <li>ab <.m bounds="9.790204,53.655989,9.810784,53.664688" lon="9.801969" lat="53.660208" dir="forward" ref="pinneberg-4">Zentrum</.m> Richtung <.m bounds="9.819153,53.648167,9.839253,53.657579" lon="9.822318" lat="53.652196" dir="forward" ref="pinneberg-4">Rellingen</.m> entlang des <.m bounds="9.801607,53.651476,9.820933,53.659716" lon="9.809094" lat="53.656459" dir="forward" ref="pinneberg-4">Fahltskamp</.m></li>
      <li>ab <.m bounds="9.787746,53.648649,9.81019,53.6582" lon="9.800345" lat="53.653859" dir="forward" ref="pinneberg-4">Bahnhof</.m> Richtung <.m bounds="9.832466,53.625179,9.864767,53.639791">Halstenbek</.m> entlang der Bahn und durch <.m bounds="9.811031,53.642002,9.824747,53.650877" lon="9.814617" lat="53.645882" dir="forward" ref="pinneberg-4">Thesdorf</.m></li>
    </ul>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist vollständig ausgeschildert. Auch ohne Ortskenntnis ist ihr leicht zu folgen.</p>


    <h4>Befahrbarkeit</h4>
    <p>Die Strecke ist größtenteils befestigt, nur im <.m bounds="9.797605,53.650342,9.80612,53.655075" lon="9.800858" lat="53.65339" dir="forward" ref="pinneberg-4">Fahlt</.m> sind die Wege aus feinem Grand und damit nur bedingt wetterfest. Dort befindet sich auch eine <.m bounds="9.800237,53.653186,9.801595,53.654221" lon="9.800625" lat="53.653774" dir="forward" ref="pinneberg-5">enge Brücke</.m> die für breite Lastenräder zum Problem werden könnte.</p>

    <h4>Meinung</h4>
    <p>Die Route ist gut nutzbar, auch wenn an manchen Stellen die gedachte Führung unklar ist. So gibt es etwa im <.m bounds="9.803929,53.657984,9.80698,53.659292" lon="9.804703" lat="53.658989" dir="forward" ref="pinneberg-5">Fahltskamp</.m> oder im <.m bounds="9.813601,53.645104,9.817125,53.646172" lon="9.815081" lat="53.645799" dir="forward" ref="pinneberg-5">Rehmen</.m> alte <.ref>Hochbordradwege</.ref>, die teils gar nicht erreichbar sind. Zudem sind sie unbequemer als die ebene <.ref>Fahrbahn</.ref>.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
