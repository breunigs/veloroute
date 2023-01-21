defmodule Data.Article.Static.FreizeitrouteElbradwegSued do
  use Article.Static

  def id(), do: "e"
  def route_group(), do: :freizeit
  def name(), do: "elbradweg-sued"
  def title(), do: "Elbradweg (Südteil auf Hamburger Gebiet)"

  def color(), do: "#006106"

  def summary(),
    do: "Radweg auf der Elbsüdseite ab Finkenwerder"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Elbradweg Süd",
        direction: :forward,
        from: "Finkenwerder",
        to: "Cranz",
        parent_ref: __MODULE__,
        text: "Elbradweg ab Finkenweder",
        videos: [
          {"2021-08-04-fr13-fr14/GX012514", :start, "00:00:11.078"},
          {"2021-08-14-fr13-und-11alt/GX012639", "00:02:30.317", "00:02:43.830"},
          # TODO: gap
          {"2021-08-14-fr13-und-11alt/GX012657", "00:00:58.592", "00:01:35.162"},
          # TODO: gap
          {"2021-08-14-fr13-und-11alt/GX012641", :start, "00:00:19.653"},
          {"2021-08-14-fr13-und-11alt/GX012643", "00:00:00.534", :end},
          {"2021-08-14-fr13-und-11alt/GX012644", :start, "00:01:47.074"},
          {"2021-08-14-fr13-und-11alt/GX012645", "00:00:07.508", "00:00:15.649"},
          {"2021-08-14-fr13-und-11alt/GX012646", "00:00:03.737", "00:02:25.512"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "Elbradweg Süd",
        direction: :backward,
        from: "Cranz",
        to: "Finkenwerder",
        parent_ref: __MODULE__,
        text: "Elbradweg ab Cranz",
        videos: [
          {"2021-08-14-fr13-und-11alt/GX012646", "00:02:25.879", :end},
          {"2021-08-14-fr13-und-11alt/GX022646", :start, :end},
          {"2021-08-14-fr13-und-11alt/GX012647", :start, "00:03:30.343"},
          {"2021-08-14-fr13-und-11alt/GX012656", "00:01:02.329", :end},
          {"2021-08-14-fr13-und-11alt/GX012657", :start, "00:00:24.591"},
          {"2021-08-14-fr13-und-11alt/GX012657", "00:01:37.664", "00:02:38.125"},
          {"2021-08-04-fr13-fr14/GX012513", "00:01:12.406", :end}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/mit-dem-rad-durch-hamburg/318124/radtour-elberadweg/"},
      {"Info/Werbeseite zum gesamten Elbradweg (inkl. GPS Daten)", "https://www.elberadweg.de/"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/2599004"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Elbradweg (Südteil auf Hamburger Gebiet) <.icon>e</.icon></h3>
    <p>Auf der <strong>Nordseite</strong> setzt sich der Elbradweg im Wesentlichen aus der <.a name="freizeitroute-5">Freizeitroute 5</.a> im Osten und der <.a name="freizeitroute-8">Freizeitroute 8</.a> im Westen zusammen. In der Innenstadt verläuft der Elbradweg leicht anders, aber das Erkunden der genauen Führung sei dem Gast überlassen.</p>

    <p>Die <strong>Südseite</strong> geht ab Finkenwerder wieder los, welches man mit der Fähre erreicht. Von dort folgt man größtenteils den Deichen bis man bei <.v bounds="9.753531,53.527322,9.794157,53.549089" lon={9.771628} lat={53.542871} dir="forward" ref={@ref}>Cranz</.v> die Landesgrenze erreicht.</p>

    <p>Hinweis zu den Videos: in Fahrtrichtung Cranz fehlen Abschnitte im Video. Statt über die <.m bounds="9.826072,53.526433,9.84532,53.531481">Westerweiden</.m> führt der Weg am Neßdeich entlang (wie eingezeichnet).</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist mit einem geschwungenen, blauen „e“ (Buchstabe E) ausgeschildert. Leider sind diese recht spärlich und über die Jahre verblichen, sodass man sie leicht übersieht.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Strecke ist fast vollständig asphaltiert und damit sehr regenbeständig. Sie ist jedoch stark windanfällig, was einen erheblichen Unterschied in Geschwindigkeit oder Kraftaufwand bedeutet.</p>

    <h4>Meinung</h4>
    <p>Für Durchreisende ist der Abschnitt ab Finkenwerder ganz okay. Wer in Hamburg wohnt und ins Grüne will wird auf anderen Freizeitstrecken jedoch besser bedient.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
