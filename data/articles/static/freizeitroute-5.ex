defmodule Data.Article.Static.Freizeitroute5 do
  use Article.Static

  def id(), do: "FR5"
  def route_group(), do: :freizeit
  def title(), do: "Vier und Marschlande (FR5)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Freizeitroute 5 führt durch die Vier- und Marschlande nach Borghorst"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Vier und Marschlande",
        direction: :forward,
        from: "Hauptbahnhof",
        to: "Besenhorster Sandberge",
        parent_ref: __MODULE__,
        text: "vom Hauptbahnhof nach Borghorst",
        historic: %{
          "b6249061bc668b3e3f29f19b11aa93e5" => ~d[2024-03],
          "862de23b22ca3ff53056fb393d19e8fd" => ~d[2021-06]
        },
        videos: [
          {"2024-03-26-fr5/GX016951", :start, :end},
          {"2024-03-26-fr5/GX016952", :start, :end},
          {"2024-03-26-fr5/GX016953", :start, :end},
          {"2024-03-26-fr5/GX016954", :start, :end},
          {"2024-03-26-fr5/GX016955", :start, :end},
          {"2024-03-26-fr5/GX016956", :start, :end},
          {"2024-03-26-fr5/GX016957", :start, :end},
          {"2024-03-26-fr5/GX016958", :start, :end},
          {"2024-03-26-fr5/GX016959", :start, :end},
          {"2024-03-26-fr5/GX026959", :seamless, "00:03:09.823"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Vier und Marschlande",
        direction: :backward,
        from: "Besenhorster Sandberge",
        to: "Hauptbahnhof",
        parent_ref: __MODULE__,
        text: "von Borghorst zum Hauptbahnhof",
        historic: %{
          "e329c963972ba3ac1c70b751b8e9c543" => ~d[2024-03],
          "ab75c85609385bce7a2f443dadd4ff0e" => ~d[2021-06]
        },
        videos: [
          {"2024-03-26-fr5/GX016960", :start, "00:00:38.872"},
          {"2024-03-26-fr5/GX016961", "00:00:01.201", :end},
          {"2024-03-26-fr5/GX016962", :start, "00:01:17.744"},
          {"2024-03-26-fr5/GX016962", "00:01:26.587", :end},
          {"2024-03-26-fr5/GX016963", :start, "00:00:10.342"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294596/radtour-city-elbpark-entenwerder-vier-und-marschlande/"},
      {"Komoot Routenplaner: durch die Vier- und Marschlande",
       "https://www.komoot.com/de-de/tour/227477342"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/8847599"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 5 – Vier- und Marschlande <.icon>FR5</.icon></h3>
    <span class="updated">Länge rund 35km</span>

    <p>Beginnend am <.v bounds="9.993132,53.549269,10.01548,53.556036" dir="forward" lat={53.5516} lon={10.0056} ref={@ref}>Hauptbahnhof</.v> folgt man grob der <.v lat={53.5449} lon={10.0172} bounds="9.995601,53.536759,10.048165,53.552678" dir="forward" ref={@ref}>Amsinckstraße</.v> um über den <.v bounds="10.020288,53.527317,10.050496,53.536469" lat={53.53341} lon={10.03093} dir="forward" ref={@ref}>Entenweder Park</.v> auf den <.v dir="forward" lat={53.5203} lon={10.0571} bounds="9.998449,53.497936,10.10166,53.529217" ref={@ref}>Kaltehofer Deich</.v> zu kommen. Ab jetzt ist die Tour bis auf wenige Ausnahmen autofrei.</p>

    <p>Nach Querung der <.v bounds="10.071488,53.496369,10.084494,53.501247" dir="forward" lat={53.4996} lon={10.0783} ref={@ref}>Dove Elbe</.v> folgt man dem <.v lat={53.4926} lon={10.0770} dir="forward" bounds="10.008422,53.411938,10.303531,53.501498" ref={@ref}>Marschbahndamm</.v>. Entlang dieser ehemaligen Bahntrasse kommt man fast bis zum Ziel der Tour. <.v lat={53.4410} lon={10.3007} bounds="10.293833,53.439739,10.327467,53.454259" dir="forward" ref={@ref}>Ab Borghorst</.v> teilt sich die Route, entweder man fährt weiter in Richtung <.v bounds="10.287802,53.453666,10.335029,53.474048" dir="forward" lat={53.4567} lon={10.3162} ref={@ref}>Escheburg</.v> wie im Video, oder man fährt über die <.m bounds="10.307092,53.435753,10.339602,53.44979">Besenhorster Sandberge</.m> nach Geesthacht.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist zwar nicht beschildert, aber durch ihre durchgängigen Wege ist ihr nach dem Innenstadtbereich leicht zu folgen. Ab dem <.v lat={53.5295} lon={10.0442} dir="forward" bounds="10.031863,53.523829,10.057375,53.534823" ref={@ref}>Sperrwerk Billwerder Bucht</.v> gibt es im Wesentlichen nur noch drei Stellen an denen man nicht geradeaus dem Weg folgt:</p>
    <ul>
      <li><.v bounds="10.068511,53.495066,10.085246,53.502282" dir="forward" lat={53.5000} lon={10.0785} ref={@ref}>Querung der Dove Elbe</.v></li>
      <li><.v lat={53.4135} lon={10.1824} bounds="10.176568,53.411341,10.188502,53.416497" dir="forward" ref={@ref}>Kehrtwende am ehemaligen Gleisdreieck</.v></li>
      <li><.v lat={53.4410} lon={10.3007} bounds="10.293833,53.439739,10.327467,53.454259" dir="forward" ref={@ref}>die letzten Meter ab Borghorst</.v></li>
    </ul>

    <h4>Befahrbarkeit</h4>
    <p>Man kommt auf dieser Tour gut und unterbrechungsfrei voran. Es gibt wenig Kreuzungen, die Führung ist klar und die Wege breit genug um problemlos an langsameren Ausflüglern vorbei zu kommen. Sollte es sich trotzdem mal stauen, sei bitte exzellent zu anderen und steige ab, bevor es brenzlig wird. Ein Regenschauer macht übrigens auch kein Problem, da man größtenteils auf Beton, Asphalt oder Pflaster fährt.</p>

    <h4>Meinung</h4>
    <p>Die Route ist hervorragend, da sie abseits vom Autolärm lange Strecken ohne Anhalten ermöglicht. Ihr Manko ist das sie vergleichsweise wenig abwechlungsreich ist bzw. kaum Sehenswürdigkeiten bietet.</p>

    <p>Einige Tipps:</p>
    <ul>
      <li>bis zum Entenweder Park ist die <.a name="alltagsroute-9">Alltagsroute <.icon link={false}>9</.icon></.a> die bessere Wahl. Die <.v lat={53.5449} lon={10.0172} bounds="9.995601,53.536759,10.048165,53.552678" dir="forward" ref={@ref}>Amsinckstraße</.v> hat den Charakter einer innerstädtischen Autotrasse und bietet sonst wenig.</li>
      <li>In <.m bounds="10.165931,53.394212,10.192045,53.404031">Zollenspieker</.m> kann mittels Fähre die Elbseite gewechselt werden. Dazu am <.v lat={53.4135} lon={10.1824} bounds="10.176568,53.411341,10.188502,53.416497" dir="forward" ref={@ref}>Gleisdreieck</.v> geradeaus fahren.</li>
      <li>Für Rennrad-Fahrten ist der Hauptdeich direkt an der Elbe die angenehmere Strecke, da hier auch höhere Geschwindigkeiten möglich sind.</li>
    </ul>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
