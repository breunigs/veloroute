defmodule Data.Article.Static.RadverkehrskonzeptSchenefeld do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radverkehrskonzept-schenefeld"
  def display_id(), do: "S"
  def title(), do: "Radverkehrskonzept Schenefeld"
  def color(), do: RouteColors.blue2()

  def summary(),
    do: "Das Radverkehrskonzept Schenefeld legt mehrere Routen als „Radverkehrsachsen“ fest."

  def tags(), do: [id()]

  def tracks(),
    do: [
      # 0
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Domänenweg-Ost",
        to: "RSW Elmshorn",
        parent_ref: __MODULE__,
        text: "Domänenweg → Sumpfweg",
        historic: %{
          "1dfb53316f49d3d0382aae9810ac8145" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018437", "00:00:24.540", "00:00:44.801"},
          {"2025-03-13-schene/GX018438", :start, "00:01:05.428"},
          {"2025-03-13-schene/GX018438", "00:01:11.921", "00:01:32.500"}
        ]
      },
      # 1
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "RSW Elmshorn",
        to: "Domänenweg-Ost",
        parent_ref: __MODULE__,
        text: "Sumpfweg → Domänenweg",
        end_action: %{action: :play, route: __MODULE__, group: "5", direction: :forward},
        historic: %{
          "cf9901cc9f9b5f435273ccdfa8593762" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018438", "00:02:01.667", "00:02:08.228"},
          {"2025-03-13-schene/GX018439", "00:00:03.871", :end},
          {"2025-03-13-schene/GX018440", :start, "00:00:21.407"}
        ]
      },
      # 2
      %Video.Track{
        renderer: 6,
        group: "2",
        direction: :forward,
        from: "Voßhörn",
        to: "Swatten Weg",
        parent_ref: __MODULE__,
        text: "Voßhörn → Moorweg",
        historic: %{
          "353d3d57116f2763bb1bafa29fc8dc36" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018427", "00:01:43.693", "00:02:33.587"},
          {"2025-03-13-schene/GX018432", "00:01:29.723", "00:01:42.454"},
          {"2025-03-13-schene/GX018427", "00:02:55.641", "00:03:13.293"},
          {"2025-03-13-schene/GX018428", "00:00:02.069", :end},
          {"2025-03-13-schene/GX018429", :start, "00:00:20.020"},
          {"2025-03-13-schene/GX018433", "00:00:11.812", "00:00:23.857"},
          {"2025-03-13-schene/GX018429", "00:00:34.735", :end},
          {"2025-03-13-schene/GX018430", :start, "00:00:38.113"}
        ]
      },
      # 3
      %Video.Track{
        renderer: 6,
        group: "2",
        direction: :backward,
        from: "Swatten Weg",
        to: "Voßhörn",
        parent_ref: __MODULE__,
        text: "Moorweg → Voßhörn",
        historic: %{
          "8c7192b38e9846a4493c46e1dfc4ff4c" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018430", "00:00:39.413", :end},
          {"2025-03-13-schene/GX018431", :start, "00:00:16.542"},
          {"2025-03-13-schene/GX018432", :start, "00:01:12.287"},
          {"2025-03-13-schene/GX018432", "00:01:43.580", "00:02:47.460"}
        ]
      },
      # 4
      %Video.Track{
        renderer: 6,
        group: "3",
        direction: :forward,
        from: "L104",
        to: "L104-Süd",
        parent_ref: __MODULE__,
        text: "L104 nach Süden",
        end_action: %{action: :play, route: __MODULE__, group: "2", direction: :forward},
        historic: %{
          "bb5f0bb5590c251efe850d15c554d293" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018427", "00:02:47.373", "00:02:56.473"}
        ]
      },
      # 5
      %Video.Track{
        renderer: 6,
        group: "3",
        direction: :backward,
        from: "L104-Süd",
        to: "L104",
        parent_ref: __MODULE__,
        text: "L104 nach Norden",
        historic: %{
          "c757589d001336a050264ad60ad7e906" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018432", "00:01:11.520", "00:01:19.280"}
        ]
      },
      # 6
      %Video.Track{
        renderer: 6,
        group: "4",
        direction: :forward,
        from: "Schenefeld",
        to: "Achter de Hoef",
        parent_ref: __MODULE__,
        text: "Studelskamp → Achter de Hoef",
        historic: %{
          "d9e966d0ba8166150e5fe3420c927647" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018432", "00:03:26.600", "00:04:17.320"}
        ]
      },
      # 7
      %Video.Track{
        renderer: 6,
        group: "4",
        direction: :backward,
        from: "Achter de Hoef",
        to: "Schenefeld",
        parent_ref: __MODULE__,
        text: "Achter de Hoef → Studelskamp",
        end_action: %{
          action: :play,
          route: Data.Article.Static.PinnebergVeloroute3,
          group: "Pinneberg 3",
          direction: :backward
        },
        historic: %{
          "a91959e6e241dd816f273b815807ed14" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018427", "00:00:12.213", "00:01:02.893"}
        ]
      },
      # 8
      %Video.Track{
        renderer: 6,
        group: "5",
        direction: :forward,
        from: "Domänenweg-West",
        via: ["Lindenallee"],
        to: "Kreuzweg",
        parent_ref: __MODULE__,
        text: "Domänenweg → Kreuzweg",
        end_action: %{action: :play, route: __MODULE__, group: "1", direction: :backward},
        historic: %{
          "db1d4fa3eee1e14c15db9b197cef0de5" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018440", "00:00:21.407", :end},
          {"2025-03-13-schene/GX018441", :start, "00:00:19.260"}
        ]
      },
      # 9
      %Video.Track{
        renderer: 6,
        group: "5",
        direction: :backward,
        from: "Kreuzweg",
        via: ["Lindenallee"],
        to: "Domänenweg-West",
        end_action: %{action: :play, route: __MODULE__, group: "1", direction: :forward},
        parent_ref: __MODULE__,
        text: "Kreuzweg → Domänenweg",
        historic: %{
          "0b6ace3b6c2a4574b9eae09dd2d9728a" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018441", "00:00:21.240", :end},
          {"2025-03-13-schene/GX018442", :start, :end},
          {"2025-03-13-schene/GX018443", :start, "00:00:10.310"},
          {"2025-03-13-schene/GX018437", "00:00:02.870", "00:00:24.840"}
        ]
      },
      # 10
      %Video.Track{
        renderer: 6,
        group: "6",
        direction: :forward,
        from: "Alte Landstraße",
        to: "Lindenallee",
        parent_ref: __MODULE__,
        text: "Alte Landstraße → Lindenallee",
        end_action: :reverse,
        historic: %{
          "3b810678d1dae5e6c2998111e950aa8a" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018433", "00:00:28.128", "00:00:32.232"},
          {"2025-03-13-schene/GX018433", "00:00:37.804", :end},
          {"2025-03-13-schene/GX018434", :start, :end},
          {"2025-03-13-schene/GX018435", :start, :end},
          {"2025-03-13-schene/GX018436", :start, "00:00:16.848"},
          {"2025-03-13-schene/GX018437", :start, "00:00:03.620"}
        ]
      },
      # 11
      %Video.Track{
        renderer: 6,
        group: "6",
        direction: :backward,
        from: "Lindenallee",
        to: "Alte Landstraße",
        parent_ref: __MODULE__,
        text: "Lindenallee → Alte Landstraße",
        historic: %{
          "a6cb2fc6ed22ef09cd204765a3079199" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018437", "00:00:01.168", "00:00:02.884"},
          {"2025-03-13-schene/GX018443", "00:00:09.794", "00:01:09.307"}
        ]
      },
      # 12
      %Video.Track{
        renderer: 6,
        group: "7",
        direction: :forward,
        from: "Wurmkamp",
        to: "XFEL",
        parent_ref: __MODULE__,
        text: "Wurmkamp → Borndiek",
        historic: %{
          "1f4af43558e6a093f7aef69548b6cbf9" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018443", "00:01:47.407", "00:01:55.914"},
          {"2025-03-13-schene/GX018444", "00:00:00.133", "00:00:47.114"},
          {"2025-03-13-schene/GX018444", "00:00:55.155", "00:01:11.747"}
        ]
      },
      # 13
      %Video.Track{
        renderer: 6,
        group: "7",
        direction: :backward,
        from: "XFEL",
        to: "Wurmkamp",
        end_action: %{action: :play, route: __MODULE__, group: "8", direction: :forward},
        parent_ref: __MODULE__,
        text: "Borndiek → Wurmkamp",
        historic: %{
          "e0712b5423bfd90f6b546d9dd6fbcf45" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018426", "00:03:30.940", "00:04:49.440"}
        ]
      },
      # 14
      %Video.Track{
        renderer: 6,
        group: "8",
        direction: :forward,
        from: "Ellernholt",
        to: "Düpenau",
        parent_ref: __MODULE__,
        text: "Ellernholt → Osdorf",
        historic: %{
          "3da9c3c9706e05d5e4864bbcf9023cbe" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018426", :start, "00:02:28.760"}
        ]
      },
      # 15
      %Video.Track{
        renderer: 6,
        group: "8",
        direction: :backward,
        from: "Düpenau",
        to: "Ellernholt",
        parent_ref: __MODULE__,
        text: "Osdorf → Ellernholt",
        historic: %{
          "1ab374df17965092a8c9f697d3fa4692" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018424", "00:00:20.100", :end},
          {"2025-03-13-schene/GX018425", :start, "00:01:58.087"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Verkehrsentwicklungskonzept Schenefeld 2035", ~d[2022-08],
       "https://www.stadt-schenefeld.de/rathaus/planen-bauen/verkehrsentwicklung/bericht.pdf?cid=cdm"},
      {"Radverkehrskonzept", ~d[2020-01],
       "https://www.stadt-schenefeld.de/rathaus/planen-bauen/verkehrsentwicklung/a00-b05-radverkehrskonzept.pdf?cid=301"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Mit Radverkehrskonzept wurden einige „Radverkehrsachsen“ herausgearbeitet, welche hier dargestellt werden. Zusätzlich identifiziert das Konzept fehlende Verbindungen und problematische Kreuzungen.</p>

    <p>Anders als die Radrouten oder Velorouten der Nachbarstädte sind diese in Schenefeld nicht nummeriert. Das engmaschige Netz mit vielen kurzen Abschnitten lässt sich auch nicht gut in durchgängige Routen aufteilen. Die Videos decken daher zwar die meisten Strecken ab, hängen aber nicht unbedingt sinnvoll zusammen.</p>

    <h4>Auffindbarkeit</h4>
    <p>Keine der Abschnitte sind beschildert und daher nur mit Ortskenntnis oder Navi auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Wege sind prinzipiell benutzbar, aber oft uneben mit vielen Schlaglöchern. Um die <.v bounds="9.814311,53.596855,9.837378,53.604903" lon={9.828315} lat={53.599552} dir="forward" ref={@ref}>Hauptstraße</.v> herum wurden die alten Radwege zu Gehwegen mit <.ref>Fahrrad frei</.ref>. Wer mehr als Schrittgeschwindigkeit fahren möchte, muss daher auf die <.ref>Fahrbahn</.ref> ausweichen.</p>

    <p>Die Oberflächen sind meist befestigt und daher auch bei Regen befahrbar. Ausnahmen:</p>
    <ul>
      <li><.v bounds="9.824739,53.604014,9.842844,53.616478" lon={9.832664} lat={53.610906} dir="forward" ref={@ref}>Kameruner Weg</.v></li>
      <li><.v bounds="9.831048,53.598315,9.849153,53.610778" lon={9.8384} lat={53.6041} dir="forward" ref={@ref}>Wege entlang der Düpenau</.v></li>
      <li><.v bounds="9.824159,53.583838,9.840143,53.592233" lon={9.827974} lat={53.587704} dir="forward" ref={@ref}>hinterm XFEL</.v></li>
    </ul>

    <h4>Meinung</h4>
    <p>Am Ortsrand gibt es schon einige gut benutzbare Abschnitte, die auch fast autofrei sind. Im Stadtbereich sind die Routen dagegen nicht ausgebaut und verwirrend. „Fahrrad frei“ oder die Führung über „Spielstraßen“ (eigentlich: verkehrsberuhigter Bereich) ist völlig unbrauchbar. Schlechte Querungsmöglichkeiten und der oft marode Zustand bremsen unnötig aus.</p>

    <p>Insgesamt könnte das vorgeschlagene Fahrradnetz in Schenefeld gut werden. Im jetzigen Zustand ist es leider ein Trauerspiel. Wenn Schenefeld das bis 2035 verbessern will, muss es sich ranhalten. Seit das Konzept 2020 vorgestellt wurde hat sich praktisch nichts getan.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
