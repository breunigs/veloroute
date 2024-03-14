defmodule Data.Article.Blog.BeimSchlump do
  use Article.Default

  def title(), do: "Beim Schlump (Freizeitroute 10)"

  def summary(),
    do:
      "Protected-Bike-Lanes mit Unterbrechungen für Bushalte. Teilweise nur Radfahrstreifen um KFZ-Parkplätze zu erhalten. Bushalt an U-Schlump im Schlump wird in Straßenmitte verlegt."

  def type(), do: :planned

  def start(), do: ~d[2026]
  def stop(), do: ~d[2028]

  def tags(), do: ["FR10"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 4,
        group: "strassenzug",
        direction: :forward,
        from: "Alstervorland",
        to: "Altona",
        parent_ref: __MODULE__,
        text: "vom Alstervorland nach Altona",
        historic: %{
          "dfcda87b7a07fc6c34caf51b991895a9" => ~d[2023-11]
        },
        videos: [
          {"2023-11-25-random/GX016709", "00:01:09.469", :end},
          {"2023-11-25-random/GX016710", :start, :end},
          {"2023-11-25-random/GX016711", :start, :end},
          {"2023-11-25-random/GX016712", :start, :end},
          {"2023-11-25-random/GX016713", :start, :end},
          {"2023-11-25-random/GX016714", :start, "00:00:14.214"},
          {"2023-05-07-stadtpark/GX015622", "00:00:00.901", :end},
          {"2023-05-07-stadtpark/GX015623", :start, "00:00:09.743"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "strassenzug",
        direction: :backward,
        from: "Altona",
        to: "Alstervorland",
        parent_ref: __MODULE__,
        text: "von Altona zum Alstervorland",
        historic: %{
          "9fb49c3944086f7e558f5923d217cc44" => ~d[2022-05]
        },
        videos: [
          {"2022-05-14-velo6-u-bundesstr/GX013847", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013848", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013849", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013850", :start, :end},
          {"2022-05-14-velo6-u-bundesstr/GX013851", :start, "00:00:09.443"},
          {"2022-01-08-rothenbaumchaussee/GX013102", "00:00:02.469", :end},
          {"2022-01-08-rothenbaumchaussee/GX013103", :start, "00:00:02.336"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"1. Entwurf", "Februar 2024",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1009108"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang des Schlump sind rund 3m breite <.ref>Radfahrstreifen</.ref> vorhanden. Sie wurden im Rahmen <.a name="2022-01-27-versuchsradweg-beim-schlump">eines Verkehrsversuches</.a> aufgemalt.</p>

    <p>An der Kreuzung mit dem Schäferskamp sind <.ref>Hochbordradwege</.ref> vorhanden. Die Anschlüsse an die Radfahrstreifen sind jedoch umständlich (<.v bounds="9.967351,53.565876,9.972475,53.568866" lon={9.97023} lat={53.56741} dir="backward" ref={@ref}>Richtung Alster</.v>) bzw. nicht durchgängig (<.v bounds="9.967351,53.565876,9.972475,53.568866" lon={9.971889} lat={53.568229} dir="forward" ref={@ref}>Richtung Altona</.v>).</p>

    <p>In der Schäferkampsallee wird der Radweg durch die Wartefläche für Fahrgäste geleitet.</p>

    <h4>Planung</h4>
    <h5>Straßenzug Beim Schlump</h5>
    <p>Im Kreuzungsbereich ab <.v bounds="9.967351,53.565876,9.972475,53.568866" lon={9.969197} lat={53.567138} dir="backward" ref={@ref} highlight="Kleiner Schäferkamp">Kleinem Schäferkamp</.v> beginnen 2,5m breite <.ref>Protected-Bike-Lanes</.ref>. Sie führen geradlinig über die <.v bounds="9.968752,53.566778,9.97175,53.568565" lon={9.97019} lat={53.567413} dir="backward" ref={@ref} highlight="Schäferkampsallee,Schröderstiftstraße">Kreuzung mit der Schäferkampsallee</.v>. Ihre Breite ändert sich im weiteren Verlauf leicht (+- 25cm). An der Kreuzung mit <.v bounds="9.972386,53.568173,9.976846,53.570479" lon={9.973906} lat={53.56905} dir="backward" ref={@ref}>Bundesstraße</.v> und <.v bounds="9.97535,53.57006,9.979101,53.572713" lon={9.97733} lat={53.571201} dir="backward" ref={@ref}>Bogenstraße</.v> bleiben Engstellen mit 1,6m Breite.</p>

    <p>An Bushalten, Einmündungen und bei KFZ-Parkplätzen in der Baumreihe wird der Radweg unterbrochen bzw. als <.ref>Radfahrstreifen</.ref> ausgeführt. Wer an einem wartenden Bus vorbei möchte, muss sich in den Autoverkehr einordnen.</p>

    <h5>Kreuzung Schäferkampsallee</h5>
    <p>Die <.v bounds="9.967351,53.565876,9.972475,53.568866" lon={9.970821} lat={53.567822} dir="forward" ref={@ref}>Bushaltestelle U-Schlump im Beim Schlump</.v> wird in die Straßenmitte verlegt. Die Gestaltung ist dann ähnlich zum <.v bounds="9.98713,53.556208,9.990939,53.559088" lon={9.988407} lat={53.55696} dir="forward" ref="3">Bushalt Stephansplatz</.v>. Für den Radverkehr ist das Linksabbiegen in die <.v bounds="9.970073,53.567219,9.971905,53.568676" lon={9.970791} lat={53.567948} dir="forward" ref="FR10">Gustav-Falke-Straße</.v> weiterhin <.ref>indirekt</.ref> möglich. Für den KFZ-Verkehr ist nur noch die Ausfahrt aus ihr gestattet.</p>

    <p>Die <.v bounds="9.968397,53.566726,9.972868,53.569124" lon={9.970456} lat={53.567363} dir="backward" ref={@ref}>dreieckige Verkehrsinsel</.v> bleibt, allerdings soll eine Ampel statt eines Zebrastreifen die Vorfahrt regeln. Die S-Kurve an dieser Stelle fällt für den Radverkehr künftig weniger scharf aus. In der Kreuzung selbst sind überall asphaltierte, rot gefärbte Furten vorgesehen. Es ist nur <.ref>indirektes Linksabbiegen</.ref> geplant.</p>

    <p>An der <.m bounds="9.968597,53.567406,9.970196,53.568296" highlight="Schäferkampsallee">Bushaltestelle im Schäferkampsallee</.m> bleibt es bei einem Hochbordradweg. Er verläuft zwischen Gehweg und Wartefläche für Fahrgäste. Ein Trenngeländer zwischen Wartefläche und Radweg erlaubt das Queren an nur noch drei Stellen.</p>

    <p>Die Anbindung der <.a name="freizeitroute-10">Freizeitroute 10</.a> aus dem <.v bounds="9.968854,53.5655,9.972792,53.569076" lon={9.970228} lat={53.566872} dir="forward" ref="FR10">Sternschanzenpark</.v> über den <.v bounds="9.96816,53.566044,9.973197,53.568522" lon={9.968829} lat={53.566972} dir="backward" ref={@ref} highlight="Kleiner Schäferkamp">Kleinen Schäferkamp</.v> soll ausgeschildert werden.</p>

    <h4>Meinung</h4>
    <p>Ich habe an der Planung wenig auszusetzen. Der Umbau macht die Radfahrt komfortabler und die Führung leicht ersichtlich. Durch bessere Trennung vom KFZ-Verkehr bzw. den Fahrgästen erhöht sich die Sicherheit. Sofern die Ampelschaltungen wie versprochen funktionieren, sollten die Radfurten auch meist frei bleiben – von besonders dreisten Autofahrern und Autofahrerinnen mal abgesehen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
