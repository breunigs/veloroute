defmodule Data.Article.Static.Freizeitroute10 do
  use Article.Static

  def id(), do: "FR10"
  def route_group(), do: :freizeit
  def title(), do: "Kollauradweg (FR10)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Freizeitroute 10 führt entlang der Kollau nach Wendlohe"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Kollauradweg",
        direction: :forward,
        from: "Stephansplatz",
        to: "Wendlohe",
        parent_ref: __MODULE__,
        text: "entlang der Kollau nach Wendlohe",
        historic: %{
          "01d3354bb413bc8174f23f31c0f2c72e" => ~d[2024-03],
          "03f238d85f7f6530d4ce7c847bd46ea7" => ~d[2022-04]
        },
        videos: [
          {"2024-03-13-fr10/GX016824", :start, :end},
          {"2024-03-13-fr10/GX016825", :start, :end},
          {"2024-03-13-fr10/GX016826", :start, :end},
          {"2024-03-13-fr10/GX016827", :start, :end},
          {"2024-03-13-fr10/GX016828", :start, :end},
          {"2024-03-13-fr10/GX016829", :start, :end},
          {"2024-03-13-fr10/GX016830", :start, :end},
          {"2024-03-13-fr10/GX016831", :start, :end},
          {"2024-03-13-fr10/GX016832", :start, :end},
          {"2024-03-13-fr10/GX016833", :start, "00:00:46.370"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Kollauradweg",
        direction: :backward,
        from: "Wendlohe",
        to: "Stephansplatz",
        parent_ref: __MODULE__,
        text: "entlang der Kollau in die Innenstadt",
        historic: %{
          "a73f386aabeada9360881f4dd2f139fc" => ~d[2024-03],
          "7f53e0a300ec78e9e181ef33bbf48f82" => ~d[2022-04]
        },
        videos: [
          {"2024-03-13-fr10/GX016833", "00:00:47.371", :end},
          {"2024-03-13-fr10/GX016834", :start, :end},
          {"2024-03-13-fr10/GX016835", :start, :end},
          {"2024-03-13-fr10/GX016836", :start, "00:00:39.506"},
          {"2024-03-13-fr10/GX016836", "00:01:13.140", :end},
          {"2024-03-13-fr10/GX016837", :start, :end},
          {"2024-03-13-fr10/GX016838", :start, :end},
          {"2024-03-13-fr10/GX016839", :start, :end},
          {"2024-03-13-fr10/GX016840", :start, "00:01:15.409"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294584/radtour-city-sternschanzenpark-niendorfer-gehege/"},
      {"Komoot Routenplaner: entlang der Kollau", "https://www.komoot.de/tour/227481122"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/2910884"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 10 – Kollauradweg <.icon>FR10</.icon></h3>
    <span class="updated">Länge rund 16km</span>

    <p>Los geht die Tour an <.v bounds="9.975364,53.556676,9.992494,53.564972" lon={9.988843} lat={53.559021} dir="forward" ref={@ref}>Planten un Blomen</.v>. Durch den <.v bounds="9.962894,53.563673,9.977035,53.568315" lon={9.971112} lat={53.565596} dir="forward" ref={@ref}>Sternschanzenpark</.v>, <.v bounds="9.963326,53.572971,9.970538,53.57626" lon={9.967869} lat={53.574418} dir="forward" ref={@ref}>Isebekpark</.v> und <.v bounds="9.945289,53.584999,9.957758,53.604684" lon={9.949297} lat={53.601519} dir="forward" ref={@ref}>zahlreiche Kleingärten</.v> erreicht man schließlich das <.v bounds="9.925696,53.605578,9.949393,53.620281" lon={9.938685} lat={53.607029} dir="forward" ref={@ref}>Niendorfer Gehege</.v>. Dort quert man zunächst die Kollau und folgt ihr erst wenn man das Waldstück <.v bounds="9.926832,53.618076,9.930929,53.621317" lon={9.929183} lat={53.619155} dir="forward" ref={@ref}>fast wieder verlassen</.v> hat. Am <.v bounds="9.938323,53.642209,9.950647,53.6489" lon={9.941174} lat={53.644497} dir="forward" ref={@ref}>Voßbarg</.v> vorbei erreicht man schließlich die <.v bounds="9.93087,53.652424,9.950125,53.659332" lon={9.939572} lat={53.652447} dir="forward" ref={@ref}>Landesgrenze</.v> an einem Golfplatz.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht ausgeschildert und selbst mit einem Navi sind die schmalen Eingänge zu den Kleingärten leicht zu übersehen. Im dicht bewaldeten Niendorfer Gehege sind die Ansagen auch mal zu spätum noch abbiegen zu können. Das Navi dauerhaft im Sichtbereich zu haben erleichtert daher die Wegfindung.</p>

    <h4>Befahrbarkeit</h4>
    <p>Einige Abschnitte sind gut besucht und die Wege nicht üppig breit. Gerade in den Kleingärten passen geradeso zwei Fahrräder aneinander vorbei. Entsprechend muss langsam und vorsichtig gefahren oder geschoben werden. Sei bitte exzellent zu Anderen und steige ab, bevor es brenzlig wird.</p>
    <p>Die Tour führt hauptsächlich über Feinschotter (Grand), auch wenn es hier und da asphaltierte oder gepflasterte Stellen gibt. Die Wege halten leichtem Regen problemlos stand, ansonsten ist mit Pfützenbildung zu rechnen.</p>

    <h4>Meinung</h4>
    <p>Wer es gemütlich angeht, kann an dieser Tour Gefallen finden. Die vielen Engstellen und vollen Wege verringern die Durchschnittsgeschwindigkeit merklich. Dafür bekommt man eine fast durchgehend grüne und autofreie Strecke geboten, die mit ihren zahlreichen Sitzgelegenheiten auch zum Verweilen einlädt. Wer lieber flotter unterwegs ist sucht sich besser eine andere Tour.</p>

    <p>Ein Hinweis: Der Umweg über die <.v bounds="9.94834,53.590992,9.951335,53.595077" lon={9.950208} lat={53.593219} dir="forward" ref={@ref}>Max-Tau-Straße</.v> lohnt sich nicht. Es ist besser durch den Park zu fahren.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
