defmodule Data.Article.Static.Freizeitroute13 do
  use Article.Static

  def id(), do: "FR13"
  def route_group(), do: :freizeit
  def title(), do: "Radweg „Dritte Meile“ (FR13)"

  def color(), do: "#006106"

  def summary(),
    do: "Video und Beschreibung zur Freizeit Radroute „Dritte Meile“ (FR13)"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 1,
        group: "Radweg „Dritte Meile“",
        direction: :forward,
        from: "Finkenwerder",
        to: "Harburger Berge",
        parent_ref: __MODULE__,
        text: "durchs Alte Land in die Harburger Berge",
        videos: [
          {"2021-08-04-fr13-fr14/GX012514", :start, "00:00:23.590"},
          {"2021-08-04-fr13-fr14/GX012515", "00:00:16.617", "00:01:11.605"},
          {"2021-08-04-fr13-fr14/GX012517", "00:00:00.467", :end},
          {"2021-08-04-fr13-fr14/GX012518", :start, :end},
          {"2021-08-04-fr13-fr14/GX012519", :start, :end},
          {"2021-08-04-fr13-fr14/GX012520", :start, :end},
          {"2021-08-04-fr13-fr14/GX012521", :start, :end},
          {"2021-08-04-fr13-fr14/GX012534", "00:00:17.217", :end},
          {"2021-08-04-fr13-fr14/GX012535", :start, :end},
          {"2021-08-04-fr13-fr14/GX012536", :start, :end},
          {"2021-08-04-fr13-fr14/GX012537", "00:00:00.133", "00:01:44.371"}
        ]
      },
      %Video.Track{
        renderer: 1,
        group: "Radweg „Dritte Meile“",
        direction: :backward,
        from: "Harburger Berge",
        to: "Finkenwerder",
        parent_ref: __MODULE__,
        text: "durchs alte Land nach Finkenwerder",
        videos: [
          {"2021-08-04-fr13-fr14/GX012551.MP4_time_lapse.mkv", "00:00:10.010", :end},
          {"2021-08-04-fr13-fr14/GX022551.MP4_time_lapse.mkv", :start, :end},
          {"2021-08-04-fr13-fr14/GX012533", "00:02:40.394", :end},
          {"2021-08-04-fr13-fr14/GX012534", :start, "00:00:15.916"},
          {"2021-08-04-fr13-fr14/GX012522", :start, :end},
          {"2021-08-04-fr13-fr14/GX012523", :start, :end},
          {"2021-08-04-fr13-fr14/GX012524", :start, "00:00:05.739"},
          {"2021-08-14-fr13-und-11alt/GX012655", "00:00:03.103", "00:00:38.805"},
          {"2021-08-04-fr13-fr14/GX012553", "00:00:05.172", "00:00:19.119"},
          {"2021-08-14-fr13-und-11alt/GX012655", "00:00:44.912", "00:01:08.969"},
          {"2021-08-04-fr13-fr14/GX012555", "00:00:07.808", :end},
          {"2021-08-04-fr13-fr14/GX012556", :start, :end},
          {"2021-08-04-fr13-fr14/GX012557", :start, :end},
          {"2021-08-04-fr13-fr14/GX012558", :start, "00:01:15.375"},
          {"2021-08-04-fr13-fr14/GX012513", "00:00:42.643", "00:00:48.482"},
          {"2021-08-04-fr13-fr14/GX012513", "00:01:04.932", :end}
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
