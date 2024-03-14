defmodule Data.Article.Static.Freizeitroute3 do
  use Article.Static

  def id(), do: "FR3"
  def route_group(), do: :freizeit
  def title(), do: "Wandseradweg (FR3)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Freizeitroute 3 führt entlang der Wandse nach Stapelfeld"

  def tags(), do: [id()]

  @vf "curves=lighter"

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Wandseradweg",
        direction: :forward,
        from: "Ferdinandstor",
        to: "Stapelfeld",
        parent_ref: __MODULE__,
        text: "entlang der Wandse nach Stapelfeld",
        historic: %{
          "505475ff97090aa05e06f85fb4d8e309" => ~d[2024-03],
          "df11ae36d9951ad9af89f3a024c03ba0" => ~d[2021-07]
        },
        videos: [
          {"2024-03-11-fr3/GX016788", :start, :end},
          {"2024-03-11-fr3/GX016789", :start, :end},
          {"2024-03-11-fr3/GX016790", :start, "00:00:41.909"},
          {"2024-03-11-fr3/GX016791", "00:00:14.047", :end},
          {"2024-03-11-fr3/GX016792", :start, :end},
          {"2024-03-11-fr3/GX016793", :start, :end},
          {"2024-03-11-fr3/GX016794", :start, :end},
          {"2024-03-11-fr3/GX016795", :start, "00:00:01.335"},
          {"2024-03-11-fr3/GX016795", "00:00:20.487", :end},
          {"2024-03-11-fr3/GX016796", :start, :end},
          {"2024-03-11-fr3/GX016797", :start, :end, vf: @vf},
          {"2024-03-11-fr3/GX016798", :start, "00:00:15.148", vf: @vf},
          {"2024-03-11-fr3/GX016799", "00:00:00.367", "00:02:26.747", vf: @vf},
          {"2024-03-11-fr3/GX016801", "00:01:09.736", "00:01:21.148", vf: @vf},
          {"2024-03-11-fr3/GX016800", "00:00:07.007", "00:01:08.054", vf: @vf}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Wandseradweg",
        direction: :backward,
        from: "Stapelfeld",
        to: "Ferdinandstor",
        parent_ref: __MODULE__,
        text: "entlang der Wandse in die Innenstadt",
        historic: %{
          "0703de1dd5eaaa67299eef4afc2d3258" => ~d[2024-03],
          "05882acbf67df48775d33dab86ba447a" => ~d[2021-07]
        },
        videos: [
          {"2024-03-11-fr3/GX016801", "00:00:02.002", "00:01:07.768", vf: @vf},
          {"2024-03-11-fr3/GX016802", "00:00:09.676", :end, vf: @vf},
          {"2024-03-11-fr3/GX016803", :start, :end, vf: @vf},
          {"2024-03-11-fr3/GX016804", :start, :end, vf: @vf},
          {"2024-03-11-fr3/GX016805", :start, "00:00:57.024", vf: @vf},
          {"2024-03-11-fr3/GX016806", "00:00:04.771", :end, vf: @vf},
          {"2024-03-11-fr3/GX016807", :start, :end, vf: @vf},
          {"2024-03-11-fr3/GX016808", :start, :end, vf: @vf},
          {"2024-03-11-fr3/GX016809", :start, :end},
          {"2024-03-11-fr3/GX016810", :start, :end},
          {"2024-03-11-fr3/GX016811", :start, :end},
          {"2024-03-11-fr3/GX016812", :start, "00:00:02.135"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294592/radtour-city-eilbekkanal-wandse-gruenzug/"},
      {"Komoot Routenplaner: entlang der Wandse", "https://www.komoot.de/tour/227474867"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/14910"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 3 – Wandseradweg <.icon>FR3</.icon></h3>
    <span class="updated">Länge rund 18km</span>

    <p>Anfangs fährt man rechts entlang der Außenalster, knickt nach dem <.v bounds="10.014707,53.56464,10.027611,53.568152" lat={53.56592} lon={10.01712} dir="forward" ref={@ref}>Mundsburger Kanal</.v> Richtung Osten ab und folgt dem Einbekkanal bzw. der Wandse. Ab <.v bounds="10.15223,53.598467,10.168589,53.602915" lat={53.6006} lon={10.1567} dir="forward" ref={@ref}>Rahlstedt</.v> orientiert man sich an der Stellau. Nach einem Abstecher durch das <.v lat={53.6022} lon={10.1664} bounds="10.162929,53.597604,10.180606,53.604574" dir="forward" ref={@ref}>Rahlstedter Gehölz</.v> erreicht man so die Landesgrenze bei <.v bounds="10.189129,53.599008,10.232269,53.616014" lat={53.6002} lon={10.1965} dir="forward" ref={@ref}>Stapelfeld</.v>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und <.m bounds="10.14209,53.592919,10.188502,53.611218">um Rahlstedt herum</.m> auch nicht mehr so leicht ersichtlich. Mit einem Navi kann ihr problemlos gefolgt werden. </p>

    <h4>Befahrbarkeit</h4>
    <p>Bis Höhe des <.v bounds="10.05126,53.573927,10.065831,53.579676" lat={53.57573} lon={10.05674} dir="forward" ref={@ref}>S-Bahnhof Friedrichsberg</.v> folgt man grob der <.a name="alltagsroute-6">Alltagsroute <.icon link={false}>6</.icon></.a>, welche mit Radwegpflaster und Asphalt ausgebaut ist. Hier dürfte es am ehesten Winterdienst geben.</p>
    <p>Ab dem <.v lat={53.57474} lon={10.05960} bounds="10.053359,53.573339,10.066225,53.578415" dir="forward" ref={@ref}>Mühlenteich</.v> hat man fast ausschließlich naturnahe Oberflächen: Grand oder feinen Schotter.</p>
    <p>Bei schönem Wetter sind die Wege gut besucht, hohe Geschwindigkeiten sind nicht möglich. An einigen Engstellen (z.B. <.v dir="forward" bounds="10.157231,53.599673,10.167305,53.603645" lat={53.6010} lon={10.1617} ref={@ref}>Klettenstieg</.v>) erfordert sogar einfacher Begegnungsverkehr besondere Vorsicht. Sei exzellent zu Anderen und steige ab, bevor es brenzlig wird.</p>

    <h4>Meinung</h4>
    <p>Die Route führt durch abswechslungsreiche Natur auf eben so abswechslungsreichen Wegen. Viele Orte an denen sie vorbeiführt laden aber auch zum Verweilen ein. Die Strecke ist selten langweilig und einen Ausflug wert. Allerdings sollte man Zeit mitbringen, denn die Wege sind voll, schmal oder beides – das tut dem Spaß aber keinen Abbruch.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
