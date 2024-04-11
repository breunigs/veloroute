defmodule Data.Article.Static.FreizeitrouteElbradwegSued do
  use Article.Static

  def id(), do: "e"
  def route_group(), do: :freizeit
  def name(), do: "elbradweg-sued"
  def title(), do: "Elbradweg (Südteil auf Hamburger Gebiet)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Radweg auf der Elbsüdseite ab Finkenwerder"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Elbradweg Süd",
        direction: :forward,
        from: "Finkenwerder",
        to: "Borstel",
        parent_ref: __MODULE__,
        text: "Elbradweg ab Finkenweder",
        historic: %{
          "3871272769ef8a607b4332a051745262" => ~d[2024-04],
          "7e58a9c61c3d8106a07214588825796f" => ~d[2021-08]
        },
        end_action: :reverse,
        videos: [
          {"2024-04-10-fr13-u-elb/GX017154", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017155", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017156", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017157", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017158", :start, "00:05:14.251"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Elbradweg Süd",
        direction: :backward,
        from: "Borstel",
        to: "Finkenwerder",
        parent_ref: __MODULE__,
        text: "Elbradweg ab Borstel",
        historic: %{
          "967981da5bfa348075fd35516dfd591e" => ~d[2024-04],
          "d90ee60af08f7df0d75c0f1fbb1bb73b" => ~d[2021-08]
        },
        videos: [
          {"2024-04-10-fr13-u-elb/GX017158", "00:05:14.251", :end},
          {"2024-04-10-fr13-u-elb/GX017159", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017160", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017161", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017162", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017163", :start, "00:01:22.049"},
          {"2024-04-10-fr13-u-elb/GX017178", "00:00:44.678", "00:00:51.585"}
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
