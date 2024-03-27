defmodule Data.Article.Static.Freizeitroute1 do
  use Article.Static

  def id(), do: "FR1"
  def route_group(), do: :freizeit
  def title(), do: "Alsterradweg (FR1)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Freizeitroute 1 führt entlang der Alster zum Duvenstedter Brook"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Alsterradweg",
        direction: :forward,
        from: "Binnenalster",
        to: "Duvenstedter Brook",
        parent_ref: __MODULE__,
        text: "entlang der Alster zum Duvenstedter Brook",
        historic: %{
          "ae2a9895017b96968a0c5a29fe7df610" => ~d[2024-03],
          "8c596cdd73de542a7ff968d8c4473090" => ~d[2022-12]
        },
        videos: [
          {"2024-03-14-fr12-fr1a/GX016842", :start, "00:01:37.764"},
          {"2024-03-14-fr12-fr1a/GX016842", "00:01:40.100", :end},
          {"2024-03-14-fr12-fr1a/GX016843", :start, :end},
          {"2024-03-14-fr12-fr1a/GX016844", :start, :end},
          {"2024-03-14-fr12-fr1a/GX016845", :start, "00:00:04.371"},
          {"2024-03-27-fr1/GX016987", "00:00:32.199", :end},
          {"2024-03-27-fr1/GX016988", :start, :end},
          {"2024-03-27-fr1/GX016989", :start, "00:07:36.890"},
          {"2024-03-27-fr1/GX016989", "00:07:46.866", "00:09:22.429"},
          {"2024-03-27-fr1/GX016990", :start, "00:02:07.527"},
          {"2024-03-27-fr1/GX016990", "00:02:20.207", :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Alsterradweg",
        direction: :backward,
        from: "Duvenstedter Brook",
        to: "Binnenalster",
        parent_ref: __MODULE__,
        text: "entlang der Alster in die Innenstadt",
        historic: %{
          "6c63cd3a50ccf9f25431236c6fe204ca" => ~d[2024-03],
          "e64adc61c39975395e7407819a1471d7" => ~d[2022-12]
        },
        videos: [
          {"2024-03-27-fr1/GX016991", "00:00:01.935", "00:04:20.560"},
          {"2024-03-27-fr1/GX016991", "00:04:23.363", :end},
          {"2024-03-27-fr1/GX016992", :start, "00:00:03.837"},
          {"2024-03-27-fr1/GX016992", "00:00:11.812", "00:02:04.191"},
          {"2024-03-14-fr12-fr1a/GX016853", "00:00:10.777", :end},
          {"2024-03-14-fr12-fr1a/GX016854", :start, :end},
          {"2024-03-14-fr12-fr1a/GX016855", :start, :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294566/radtour-city-alster-wohlsdorfer-wald-duvenstedter-brook/"},
      {"Komoot Routenplaner: entlang der Alster", "https://www.komoot.de/tour/253561892"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9040865"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 1 – Alsterradweg <.icon>FR1</.icon></h3>
    <span class="updated">Länge rund 32km</span>

    <p>Die Fahrt beginnt an der <.m bounds="9.994139,53.552351,9.99759,53.557223">Binnenalster</.m> und folgt der Alster dann flussaufwärts fast bis zur Landesgrenze. Bei <.m bounds="10.094746,53.670325,10.163218,53.707857">Ohlstedt</.m> knickt sie jedoch in den <.m bounds="10.121815,53.702633,10.214657,53.747276">Duvenstedter Brook</.m> ab und endet dort.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und muss daher nach Gefühl oder mit Navi gefolgt werden. Die Routingdaten dazu sind unten verlinkt. Da ich mich manchmal selbst verfahren habe, stimmen Video und eingezeichnete Strecke nicht immer überein. Ebenso finden sich je nach Quelle und Jahr leicht andere Führungen, die jedoch alle gleich gut sind. Ausnahme: die „Nebenroute“ leitet durch die Wohngebiete <.m bounds="10.077008,53.668168,10.122618,53.684726">Mellingstedt</.m> und <.m bounds="10.088551,53.697803,10.129147,53.71253">Duvenstedt</.m> statt dem Alstertal zu folgen und ist entsprechend deutlich weniger im Grünen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Der Belag ist meistens plattgedrückter Schotter („Grand“) und daher nur bedingt regenfest. Bis Winterhude folgt die Strecke der <.a name="alltagsroute-4">Alltagsroute <.icon link={false}>4</.icon></.a> und sollte daher auch im Winter nutzbar sein. Zwischen der <.v lat={53.60584} lon={9.99573} dir="forward" ref="FR1" bounds="9.993482,53.604168,10.000989,53.607457">Wilhelm-Metzger-Straße</.v> und der <.v lat={53.61166} lon={10.00866} dir="forward" ref="FR1" bounds="10.002239,53.608553,10.017462,53.615228">Hindenburgstraße</.v> gibt es viel Hindernisse die Lastenrädern oder E-Bikes zu schaffen machen. In diesem Abschnitt ist ein Ausweichen über die <.icon>4</.icon> empfehlenswert.</p>

    <p>Auf der Strecke selbst gibt es viel Fußverkehr und zahlreiche Engstellen. Sei exzellent zu Anderen und steige ab, bevor es brenzlig wird.</p>

    <h4>Meinung</h4>
    <p>Der Alsterradweg macht Spaß und ist gut zu befahren, sofern man von den Hindernissen um <.m bounds="9.993629,53.604893,10.006302,53.612092">Alsterdorf</.m> herum absieht. Eine Ausschilderung gerade im Alstertal wäre aber wünschenswert um sich auch ohne Navi nicht zu verfahren.</p>


    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
