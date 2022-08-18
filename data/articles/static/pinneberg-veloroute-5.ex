defmodule Data.Article.Static.PinnebergVeloroute5 do
  use Article.Static

  def id(), do: "pinneberg-5"
  def display_id(), do: "5"
  def route_group(), do: :alltag
  def title(), do: "Pinneberg: Veloroute 5"

  def color(), do: "#f4628b"

  def summary(),
    do: "Veloroute 5 führt von Pinnebergs Zentrum nach Kummerfeld"

  def tags(), do: [id(), "pinneberg"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Pinneberg 5",
        direction: :forward,
        from: "Pinneberg Zentrum",
        to: "Kummerfeld",
        parent_ref: __MODULE__,
        text: "vom Zentrum nach Kummerfeld",
        videos: [
          {"2022-02-27-pinneberg/GX013233", "00:00:00.534", :end},
          {"2022-02-27-pinneberg/GX013234", :start, "00:02:44.831"}
        ]
      },
      %Video.Track{
        renderer: 2,
        group: "Pinneberg 5",
        direction: :backward,
        from: "Kummerfeld",
        to: "Pinneberg Zentrum",
        parent_ref: __MODULE__,
        text: "von Kummerfeld zum Zentrum",
        videos: [
          {"2022-02-27-pinneberg/GX013236", "00:01:24.117", "00:01:47.107"},
          {"2022-02-27-pinneberg/GX013236", "00:02:59.813", :end},
          {"2022-02-27-pinneberg/GX013237", :start, "00:00:45.412"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Broschüre zu Pinnebergs Velorouten", "2022, PDF",
       "https://pinneberg.de/fileadmin/user_upload/faltblatt-veloroute-stand03-2022.pdf"},
      {"Stadt Pinneberg zur Ausschilderung",
       "https://pinneberg.de/leben-in-pinneberg?chash=6c835baef9601f60fe5950927b65f235&tx_news_pi1%5Baction%5D=detail&tx_news_pi1%5Bcontroller%5D=news&tx_news_pi1%5Bnews%5D=396&cHash=3a6be95e43c0e780cd932b199730ad9c"},
      {
        "ADFC zur Ausschilderung der Route",
        "https://adfc-pinneberg.de/verkehrspolitik/384-veloroute-5-ausgeschildert"
      }
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Pinneberg: Veloroute 5 <.icon>pinneberg-5</.icon></h3>
    <p>Entlang der <.m bounds="9.794008,53.66242,9.797273,53.671893" lon="9.796735" lat="53.662838" dir="forward">Bismarck- und Friedensstraße</.m> fährt man zunächst direkt nach Norden. Über den <.m bounds="9.791372,53.673151,9.791372,53.673151" lon="9.791372" lat="53.673151" dir="forward">Ossenpadd bzw. An den Fischteichen</.m> weicht man dann leicht nach Westen ab, um die Autotrasse „Westring“ queren zu können. Über den <.m bounds="9.781945,53.679587,9.787478,53.688398" lon="9.782724" lat="53.680313" dir="forward">Osterloher Weg</.m> erreicht man wieder den Ossenpadd und von dort die Ziele in Kummerfeld.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist vollständig ausgeschildert und mit Piktogrammen auf der Straße markiert. Mit Ortskenntnis folgt man ihr ohne Probleme, ohne muss man teilweise etwas genauer schauen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Führung erfolgt hauptsächlich auf Straßen mit Tempo 30. Stellenweise sind auch Fußwege mit „<.ref>Fahrrad frei</.ref>“ beschildert, die jedoch keine durchgängige Führung bieten. Die Wege sind überwiegend asphaltiert und ohne größere Schadstellen. Die gesamte Route ist für Lastenräder geeignet.</p>

    <h4>Meinung</h4>
    <p>Die Veloroute macht einen ansehnlichen Eindruck und ist angenehm zu befahren, zumindest bei wenig Autoverkehr. Kurzfristig sollten die Strecken zu Fahrradstraßen werden. Langfristig sollten weitläufige Kreuzung kompakter gestaltet werden um die Übersicht zu verbessern. Ebenso sollten die alten Radwegreste ganz entfernt und dem Fußweg zugeschlagen werden, damit keine Missverständnisse aufkommen.</p>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
