defmodule Data.Article.Static.Freizeitroute10 do
  use Article.Static

  def id(), do: "FR10"
  def route_group(), do: :freizeit
  def title(), do: "Kollauradweg (FR10)"

  def color(), do: "#006106"

  def summary(),
    do: "Freizeitroute 10 führt entlang der Kollau nach Wendlohe"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        group: "Kollauradweg",
        direction: :forward,
        from: "Stephansplatz",
        to: "Wendlohe",
        parent_ref: __MODULE__,
        text: "entlang der Kollau nach Wendlohe",
        videos: [
          {"2021-08-01-freizeit9-anfang/GX012477", "00:00:29.630", "00:00:53.120"},
          {"2021-08-01-freizeit9-anfang/GX012471", "00:00:18.952", :end},
          {"2021-08-01-freizeit9-anfang/GX012482", :start, "00:00:05.739"},
          {"2021-08-07-fr10/GX012568", "00:00:43.277", :end},
          {"2021-08-07-fr10/GX012569", :start, :end},
          {"2021-08-07-fr10/GX012570", :start, :end},
          {"2021-08-07-fr10/GX012571", :start, "00:00:04.371"},
          {"2021-08-07-fr10/GX012574", :start, :end},
          {"2021-08-07-fr10/GX012575", :start, :end},
          {"2021-08-07-fr10/GX012576", :start, :end},
          {"2021-08-07-fr10/GX012577", :start, "00:01:55.582"},
          {"2021-08-07-fr10/GX012579", "00:00:01.502", :end},
          {"2021-08-07-fr10/GX012580", :start, "00:00:34.501"},
          {"2021-08-07-fr10/GX012593", "00:00:00.601", "00:00:05.005"},
          {"2021-08-07-fr10/GX012580", "00:00:37.704", :end},
          {"2021-08-07-fr10/GX012581", :start, "00:00:52.119"},
          {"2021-08-07-fr10/GX012583", "00:00:02.135", :end},
          {"2021-08-07-fr10/GX012584", :start, :end},
          {"2021-08-07-fr10/GX012585", :start, "00:00:35.469"}
        ]
      },
      %Video.Track{
        group: "Kollauradweg",
        direction: :backward,
        from: "Wendlohe",
        to: "Stephansplatz",
        parent_ref: __MODULE__,
        text: "entlang der Kollau in die Innenstadt",
        videos: [
          {"2021-08-07-fr10/GX012587", "00:00:44.011", :end},
          {"2021-08-07-fr10/GX012588", :start, "00:01:34.861"},
          {"2021-08-07-fr10/GX012589", "00:00:00.434", :end},
          {"2021-08-07-fr10/GX012590", :start, "00:01:14.908"},
          {"2021-08-07-fr10/GX012591", "00:00:00.534", "00:00:04.304"},
          {"2021-08-07-fr10/GX012591", "00:00:04.571", "00:00:06.974"},
          {"2021-08-07-fr10/GX012591", "00:00:17.718", "00:00:33.567"},
          {"2021-08-07-fr10/GX012592", "00:00:04.238", "00:01:04.031"},
          {"2021-08-07-fr10/GX012593", "00:00:11.111", :end},
          {"2021-08-07-fr10/GX012594", :start, :end},
          {"2021-08-07-fr10/GX012595", :start, "00:00:42.509"},
          {"2021-08-07-fr10/GX012597", "00:00:18.685", "00:00:36.203"},
          {"2021-08-07-fr10/GX012598", "00:00:05.506", :end},
          {"2021-08-07-fr10/GX012599", :start, :end},
          {"2021-08-07-fr10/GX012600", :start, :end},
          {"2021-08-07-fr10/GX012601", :start, :end},
          {"2021-08-07-fr10/GX012602", :start, :end},
          {"2021-08-07-fr10/GX012603", :start, :end},
          {"2021-08-07-fr10/GX012604", :start, :end},
          {"2021-08-07-fr10/GX012605", :start, :end},
          {"2021-08-07-fr10/GX012606", :start, "00:00:21.855"},
          {"2021-08-01-freizeit9-anfang/GX012469", "00:00:21.989", "00:00:27.194"},
          {"2021-08-01-freizeit9-anfang/GX012472", "00:00:04.705", "00:00:11.178"},
          {"2021-08-01-freizeit9-anfang/GX012471", "00:00:05.539", "00:00:18.285"},
          {"2021-08-01-freizeit9-anfang/GX012477", "00:00:53.820", "00:01:13.106"}
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

    <p>Los geht die Tour an <.m bounds="9.975364,53.556676,9.992494,53.564972" lon="9.988843" lat="53.559021" dir="forward">Planten un Blomen</.m>. Durch den <.m bounds="9.962894,53.563673,9.977035,53.568315" lon="9.971112" lat="53.565596" dir="forward">Sternschanzenpark</.m>, <.m bounds="9.963326,53.572971,9.970538,53.57626" lon="9.967869" lat="53.574418" dir="forward">Isebekpark</.m> und <.m bounds="9.945289,53.584999,9.957758,53.604684" lon="9.949297" lat="53.601519" dir="forward">zahlreiche Kleingärten</.m> erreicht man schließlich das <.m bounds="9.925696,53.605578,9.949393,53.620281" lon="9.938685" lat="53.607029" dir="forward">Niendorfer Gehege</.m>. Dort quert man zunächst die Kollau und folgt ihr erst wenn man das Waldstück <.m bounds="9.926832,53.618076,9.930929,53.621317" lon="9.929183" lat="53.619155" dir="forward">fast wieder verlassen</.m> hat. Am <.m bounds="9.938323,53.642209,9.950647,53.6489" lon="9.941174" lat="53.644497" dir="forward">Voßbarg</.m> vorbei erreicht man schließlich die <.m bounds="9.93087,53.652424,9.950125,53.659332" lon="9.939572" lat="53.652447" dir="forward">Landesgrenze</.m> an einem Golfplatz.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht ausgeschildert und selbst mit einem Navi sind die schmalen Eingänge zu den Kleingärten leicht zu übersehen. Im dicht bewaldeten Niendorfer Gehege sind die Ansagen auch mal zu spätum noch abbiegen zu können. Das Navi dauerhaft im Sichtbereich zu haben erleichtert daher die Wegfindung.</p>

    <h4>Befahrbarkeit</h4>
    <p>Einige Abschnitte sind gut besucht und die Wege nicht üppig breit. Gerade in den Kleingärten passen geradeso zwei Fahrräder aneinander vorbei. Entsprechend muss langsam und vorsichtig gefahren oder geschoben werden. Sei bitte exzellent zu Anderen und steige ab, bevor es brenzlig wird.</p>
    <p>Die Tour führt hauptsächlich über Feinschotter (Grand), auch wenn es hier und da asphaltierte oder gepflasterte Stellen gibt. Die Wege halten leichtem Regen problemlos stand, ansonsten ist mit Pfützenbildung zu rechnen.</p>

    <h4>Meinung</h4>
    <p>Wer es gemütlich angeht, kann an dieser Tour Gefallen finden. Die vielen Engstellen und vollen Wege verringern die Durchschnittsgeschwindigkeit merklich. Dafür bekommt man eine fast durchgehend grüne und autofreie Strecke geboten, die mit ihren zahlreichen Sitzgelegenheiten auch zum Verweilen einlädt. Wer lieber flotter unterwegs ist sucht sich besser eine andere Tour.</p>

    <p>Einige Hinweise:</p>
    <ul>
      <li>Der Umweg über die <.m bounds="9.94834,53.590992,9.951335,53.595077" lon="9.950208" lat="53.593219" dir="forward" ref="FR4">Max-Tau-Straße</.m> lohnt sich nicht. Es ist besser durch den Park zu fahren.</li>
      <li>Im <.m bounds="9.93609,53.656803,9.941178,53.660792" lon="9.938917" lat="53.658303" dir="forward" ref="FR4">Golfplatz</.m> wird die Straße zu einer Einbahnstraße. Die nahen Wege im Wald sind Reitwege. Wer hier weiter fährt muss einen anderen Rückweg einplanen.</li>
    </ul>

    <h3>Externe Links</h3>
    <.structured_links gpx="true"/>
    """
  end
end
