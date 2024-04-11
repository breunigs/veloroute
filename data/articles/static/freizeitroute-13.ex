defmodule Data.Article.Static.Freizeitroute13 do
  use Article.Static

  def id(), do: "FR13"
  def route_group(), do: :freizeit
  def title(), do: "Radweg „Dritte Meile“ (FR13)"

  def color(), do: "#006106"
  def color_faded(), do: "#77ba7b"

  def summary(),
    do: "Video und Beschreibung zur Freizeit Radroute „Dritte Meile“ (FR13)"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "Radweg „Dritte Meile“",
        direction: :forward,
        from: "Finkenwerder",
        to: "Harburger Berge",
        parent_ref: __MODULE__,
        text: "durchs Alte Land in die Harburger Berge",
        historic: %{
          "3b98470bc865161d2c724d4caebcbd4a" => ~d[2024-04],
          "ce3369a4dde0b5709938a525cfde273e" => ~d[2021-08]
        },
        videos: [
          {"2024-04-10-fr13-u-elb/GX017154", :start, "00:00:15.549"},
          {"2024-04-10-fr13-u-elb/GX017164", "00:00:02.369", "00:00:18.685"},
          {"2024-04-10-fr13-u-elb/GX017164", "00:00:53.120", :end},
          {"2024-04-10-fr13-u-elb/GX017165", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017166", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017167", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017168", :start, "00:05:14.681"},
          {"2024-04-10-fr13-u-elb/GX017169", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017170", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "Radweg „Dritte Meile“",
        direction: :backward,
        from: "Harburger Berge",
        to: "Finkenwerder",
        parent_ref: __MODULE__,
        text: "durchs Alte Land nach Finkenwerder",
        historic: %{
          "750cb4a130b6a65212c3e9d7091a82d5" => ~d[2024-04],
          "55adebb29f17a278d337b438f23ce1a8" => ~d[2021-08]
        },
        videos: [
          {"2024-04-10-fr13-u-elb/GX017171", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017172", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017173", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017174", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017175", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017176", :start, :end},
          {"2024-04-10-fr13-u-elb/GX017177", :start, "00:00:30.063"},
          {"2024-04-10-fr13-u-elb/GX017178", "00:00:00.200", "00:00:51.585"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/radtour/6294588/radtour-finkenwerder-dritte-meile-harburger-berge/"},
      {"Komoot Routenplaner: entlang der „Dritten Meile“",
       "https://www.komoot.de/tour/227483156"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/9069490"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Freizeitroute 13 – Radweg „Dritte Meile“ <.icon>FR13</.icon></h3>
    <span class="updated">Länge rund 20km</span>

    <p>Los geht's am <.v bounds="9.875282,53.534885,9.881707,53.538191" lon={9.878724} lat={53.5363} dir="forward" ref={@ref}>Fähranleger Finkenwerder</.v>, vorbei an der <.v bounds="9.820762,53.521714,9.831061,53.529836" lon={9.826283} lat={53.528434} dir="forward" ref={@ref}>alten Süderelbe</.v> ins <.v bounds="9.741709,53.489025,9.888698,53.527376" lon={9.811284} lat={53.512371} dir="forward" ref={@ref}>Alte Land</.v>. Durch den Bau der A26 bedingt muss aktuell eine weiträumige Umleitung gefahren werden. Hat man dies geschafft; den <.v bounds="9.778873,53.474959,9.874629,53.495547" lon={9.826548} lat={53.486269} dir="forward" ref={@ref}>Moorgürtel</.v> und <.v bounds="9.815331,53.448877,9.872807,53.484768" lon={9.828228} lat={53.46938} dir="forward" ref={@ref}>Fischbek</.v> durchquert ist man schon in den <.v bounds="9.811431,53.437338,9.925314,53.470611" lon={9.84982} lat={53.450734} dir="forward" ref={@ref}>Harburger Bergen</.v> am Ziel dieser Tour.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist stellenweise beschildert, aber nicht durchgängig um damit alleine den Weg zu finden. Ein Navi oder eine Karte ist daher empfehlenswert.</p>

    <h4>Befahrbarkeit</h4>
    <p>Die Strecke besteht hauptsächlich aus naturnahen Wegen wie feinem Schotter, Trampelpfaden oder Waldwegen. Die Nutzung bei Regenwetter erfordert daher ein Mountain-Bike. Abgesehen von den Fähranlegern ist insgesamt wenig los, Stau gibt es eher nicht.</p>

    <h4>Meinung</h4>
    <p>Die Umleitung der Strecke wegen des Baus der A26 ist zwar nicht ganz so schön wie der normale Weg, macht die Tour aber nicht kaputt. Die Tour bleibt abwechslungsreich: Hafenflair, dörfliches, Obstplantagen, Moore, und schließlich Wald. Wer südlich der Elbe unterwegs ist findet hier befahrenswerte Abschnitte.</p>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
