defmodule Data.Article.Static.PinnebergVeloroute4 do
  use Article.Static

  def id(), do: "pinneberg-4"
  def display_id(), do: "4"
  def route_group(), do: :alltag
  def title(), do: "Pinneberg: Veloroute 4"

  def color(), do: "#a02636"

  def summary(),
    do: "Veloroute 4 führt von Pinnebergs Zentrum nach Appen"

  def tags(), do: [id(), "pinneberg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Pinneberg 2",
        direction: :forward,
        from: "Pinneberg Zentrum",
        to: "Appen",
        parent_ref: __MODULE__,
        text: "vom Zentrum nach Appen",
        videos: [
          {"2022-05-31-pinneberg/GX014161", "00:00:43.277", :end},
          {"2022-05-31-pinneberg/GX014162", :start, "00:00:09.109"},
          {"2022-05-31-pinneberg/GX014169", "00:00:13.981", "00:00:27.427"},
          {"2022-05-31-pinneberg/GX014163", "00:00:08.709", :end},
          {"2022-05-31-pinneberg/GX014164", :start, :end},
          {"2022-05-31-pinneberg/GX014165", :start, :end},
          {"2022-05-31-pinneberg/GX014166", :start, "00:00:07.673"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Pinneberg 2",
        direction: :backward,
        from: "Appen",
        to: "Pinneberg Zentrum",
        parent_ref: __MODULE__,
        text: "von Appen zum Zentrum",
        videos: [
          {"2022-05-31-pinneberg/GX014167", "00:00:38.030", :end},
          {"2022-05-31-pinneberg/GX014168", :start, "00:00:01.502"},
          {"2022-05-31-pinneberg/GX014168", "00:00:26.793", :end},
          {"2022-05-31-pinneberg/GX014170", :start, :end},
          {"2022-05-31-pinneberg/GX014171", :start, "00:00:15.716"}
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
    <h3>Pinneberg: Veloroute 4 <.icon>pinneberg-4</.icon></h3>
    <p>Los geht's am <.m bounds="9.788303,53.659153,9.796227,53.661387" lon="9.795319" lat="53.661077" dir="backward" ref="pinneberg-4">Rübekamp</.m> und mit der <.m bounds="9.78829,53.659137,9.792636,53.661052" lon="9.789596" lat="53.660131" dir="backward" ref="pinneberg-4">Bahnunterführung</.m> Richtung Westen. Über den <.m bounds="9.774689,53.650542,9.792636,53.661052" lon="9.783673" lat="53.655112" dir="backward" ref="pinneberg-4">Kirchhofsweg</.m> und die <.m bounds="9.768361,53.649378,9.776908,53.652094" lon="9.772907" lat="53.65093" dir="backward" ref="pinneberg-4">Lange Twiete</.m> erreicht man einen <.m bounds="9.752139,53.650283,9.770798,53.659509" lon="9.767815" lat="53.6519" dir="backward" ref="pinneberg-4">gemeinsamen Fuß- und Radweg der nach Appen</.m> führt.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist vollständig ausgeschildert. Auch ohne Ortskenntnis ist ihr leicht zu folgen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Route ist durchgehend befestigt und daher allwettertauglich. Die Zweirichtungsradwege sind stellenweise schmal, aber noch mit einem Lastenrad nutzbar.</p>

    <h4>Meinung</h4>
    <p>Eine gute Strecke, die nur stellenweise Verbesserungen benötigt. Neben den bereits erwähnten Engstellen ist dies vor allem die Kreuzung  <.m bounds="9.774379,53.649711,9.777099,53.650951" lon="9.775567" lat="53.650511" dir="backward" ref="pinneberg-4">Lange Twiete / Wedeler Weg</.m>, wo die Führung für den Radverkehr unklar ist.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
