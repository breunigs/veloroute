defmodule Data.Article.Blog.Hegarstrasse do
  use Article.Default

  def title(), do: "Hegarstraße (S-Bahnhof Bahrenfeld)"

  def summary(),
    do:
      "Asphaltierter, 3,5m breiter Zweirichtungsradweg statt Kopfsteinpflaster im Mischverkehr. Gehwege werden breiter und gepflastert."

  def type(), do: :planned
  def tags(), do: []

  def start(), do: ~d[2025Q2]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Hegarstraße",
        to: "Hegarstraße",
        parent_ref: __MODULE__,
        text: "Hegarstraße nach Westen",
        historic: %{
          "772e77e22fcf2d4b870f48fb6226d6c3" => ~d[2025-03]
        },
        videos: [
          {"2025-03-19-hegar/GX010068", "00:01:10.454", "00:01:20.442"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Hegarstraße",
        to: "Hegarstraße",
        parent_ref: __MODULE__,
        text: "Hegarstraße nach Osten",
        historic: %{
          "8fccbd139f90c70a6043afbb1575bb2d" => ~d[2025-03]
        },
        videos: [
          {"2025-03-19-hegar/GX010068", "00:01:35.105", "00:01:44.037"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Infoseite der Stadt",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/altona/themen/verkehr/baustellen/hegarstrasse-999432"},
      {"Zeitungsartikel zum Umbau", ~d[2025-03],
       "https://www.abendblatt.de/hamburg/altona/article408579043/s-bahnhof-bahrenfeld-verkehr-hamburg-neues-umfeld-und-fahrradstrasse-geplant-wer-profitiert.html"}
    ]
  end

  def map_image do
    {name(), [{"P + R-Betriebsgesellschaft mbH", "https://www.pr.hamburg/kontakt/"}]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die enge <.ref>Fahrbahn</.ref> ist mit Kopfsteinpflaster befestigt. Die Gehwege bestehen aus Erde/Grand.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Fahrbahn soll zu einem 3,5m breiten Zweirichtungsradweg werden. Er wird asphaltiert. KFZ bleiben zwischen und <.v bounds="9.909669,53.559747,9.911337,53.560753" lon={9.910292} lat={53.560268} dir="backward" ref={@ref}>Zöllnerstraße</.v> und <.v bounds="9.911461,53.559768,9.914043,53.561009" lon={9.912505} lat={53.56026} dir="backward" ref={@ref}>Bahrenfelder Kirchenweg</.v> draußen.</p>

    <p>Der Gehweg auf der Bahnseite wird gepflastert. Zum Schutz der Baumwurzeln erfolgt dies mit einem Metallgitter, indem kleine Pflastersteine gelegt werden („TTE-System“. Siehe z.B. <.v bounds="10.013608,53.565017,10.018834,53.568994" lon={10.016452} lat={53.566264} dir="forward" ref="FR2">Radweg am Schwanenwik</.v>). Außerhalb der Baumstämme soll der Gehweg 3,55m breit werden. </p>

    <p>Auf der Häuserseite werden die Fahrrad-Parkplätze deutlich erhöht. Dabei sollen sowohl einfache Radanlehnbügel, doppelstöckige Systeme und Fahrradboxen aufgestellt werden. Es ist auch vorgesehen E-Bikes laden zu können. Der ehemalige Gehweg entfällt auf dieser Seite.</p>

    <h4>Meinung</h4>
    <p>Mit besserem Fahrradparken wird es attraktiver, die S-Bahn auch bei nicht ganz so nahen Zielen zu verwenden. Das gilt so ähnlich auch zu Fuß – wer will schon durch Matsch laufen, wenn es mal ein bisschen regnet.</p>

    <p>Der Abschnitt soll langfristig Teil einer Bezirksroute in Ost/West Richtung werden. Es ist daher gut, den Radweg gleich mitzudenken, auch wenn er – vorerst – etwas breiter als notwendig wird.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
