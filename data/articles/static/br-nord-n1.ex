defmodule Data.Article.Static.BrNordN1 do
  use Article.Static

  def id(), do: "br-nord-n1"
  def display_id(), do: "N1"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N1 – Nord ↔ Süd"

  def color(), do: "#bf95ff"

  def summary(),
    do:
      "Der Vorschlag zur Bezirksroute „N1 – Nord ↔ Süd“ im Bezirk Hamburg-Nord führt von Langenhorn, durch den Stadtpark nach Hohenfelde"

  def tags(), do: [id(), display_id(), "br-nord"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "n1",
        direction: :forward,
        from: "Lübeckertordamm",
        to: "Ochsenzoll",
        parent_ref: __MODULE__,
        text: "vom Lübeckertordamm zum Ochsenzoll",
        videos: [
          {"2023-10-25-brnord/GX016563", :start, :end},
          {"2023-10-25-brnord/GX016564", :start, :end},
          {"2023-10-25-brnord/GX016565", :start, :end},
          {"2023-10-25-brnord/GX016566", :start, :end},
          {"2023-10-25-brnord/GX016567", :start, :end},
          {"2023-10-25-brnord/GX016568", :start, :end},
          {"2023-10-25-brnord/GX016569", :start, :end},
          {"2023-10-25-brnord/GX016570", :start, :end},
          {"2023-10-25-brnord/GX016571", :start, :end},
          {"2023-10-25-brnord/GX016572", :start, :end},
          {"2023-10-25-brnord/GX016573", :start, :end},
          {"2023-10-25-brnord/GX016574", :start, :end},
          {"2023-10-25-brnord/GX016575", :start, :end},
          {"2023-10-25-brnord/GX016576", :start, :end},
          {"2023-10-25-brnord/GX016577", :start, :end},
          {"2023-10-25-brnord/GX016578", :start, :end},
          {"2023-10-25-brnord/GX016579", :start, :end},
          {"2023-10-25-brnord/GX016580", :start, :end},
          {"2023-10-25-brnord/GX016581", :start, :end},
          {"2023-10-25-brnord/GX016582", :start, "00:00:21.684"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "n1",
        direction: :backward,
        from: "Ochsenzoll",
        to: "Lübeckertordamm",
        parent_ref: __MODULE__,
        text: "vom Ochsenzoll zum Lübeckertordamm",
        videos: [
          {"2023-10-25-brnord/GX016582", "00:00:25.687", :end},
          {"2023-10-25-brnord/GX016583", :start, :end},
          {"2023-10-25-brnord/GX016584", :start, "00:01:03.964"},
          {"2023-10-25-brnord/GX016584", "00:01:12.072", "00:01:56.383"},
          {"2023-10-25-brnord/GX016590", "00:03:24.471", :end},
          {"2023-10-25-brnord/GX016591", :start, :end},
          {"2023-10-25-brnord/GX016592", :start, :end},
          {"2023-10-25-brnord/GX016593", :start, :end},
          {"2023-10-25-brnord/GX016594", :start, :end},
          {"2023-10-25-brnord/GX016595", :start, :end},
          {"2023-10-25-brnord/GX016596", :start, :end},
          {"2023-10-25-brnord/GX016597", :start, :end},
          {"2023-10-25-brnord/GX016598", :start, :end},
          {"2023-10-25-brnord/GX016599", :start, :end},
          {"2023-10-25-brnord/GX016600", :start, :end},
          {"2023-10-25-brnord/GX016601", :start, "00:00:27.461"},
          {"2023-10-25-brnord/GX016612", "00:00:15.215", :end},
          {"2023-10-25-brnord/GX016613", :start, :end},
          {"2023-10-25-brnord/GX016614", :start, :end},
          {"2023-10-25-brnord/GX016615", :start, :end},
          {"2023-10-25-brnord/GX016616", :start, "00:00:21.350"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Entwurf Radverkehrskonzept", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013264"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute HH-Nord – Nord ↔ Süd <.icon>N1</.icon></h3>
    <p>Bei der gezeigten Führung handelt es sich um einen Vorschlag wie die Bezirksroute „N1 – Nord ↔ Süd“ künftig verlaufen könnte.</p>

    <p>Sie beginnt an der <.v bounds="10.00972,53.554005,10.033782,53.567696" lon={10.02132} lat={53.559783} dir="forward" ref="br-nord-n1">Sechslingspforte</.v> und führt – wie ihr Name schon sagt – nach Norden. Sie verläuft westlich der <.a name="alltagsroute-5">Veloroute/Radroute 5</.a>, bzw. <.v bounds="9.989273,53.604493,10.03114,53.62206" lon={10.018001} lat={53.615397} dir="forward" ref="br-nord-n1">ab der Alster</.v> westlich der <.a name="alltagsroute-4">Veloroute/Radroute 4</.a>. Genau wie diese endet die N1 am <.v bounds="9.991922,53.675276,10.007864,53.685509" lon={10.000708} lat={53.678921} dir="forward" ref="br-nord-n1">Ochsenzoll</.v> und schließt an die <.a name="norderstedt-veloroute-2">Velorouten in Norderstedt</.a> bzw. den <.a name="rsw-bad-bramstedt">Radroute Plus/Radschnellweg nach Bad Bramstedt an.</.a></p>

    <h4>Speziell für diese Route</h4>
    <p>Bis zum Flughafen sollen die Führungsformen in etwa beibehalten werden. Verbesserungen ergeben sich aus Verbreiterung und allgemein der Sanierung. Für <.v bounds="10.012945,53.559124,10.02224,53.56598" lon={10.018703} lat={53.561518} dir="forward" ref="br-nord-n1">Ackermannstraße</.v>, <.v bounds="10.000661,53.582347,10.019264,53.592519" lon={10.011595} lat={53.586973} dir="forward" ref="br-nord-n1">Poßmoorweg</.v>, <.v bounds="10.004029,53.586788,10.027082,53.6035" lon={10.013513} lat={53.595578} dir="forward" ref="br-nord-n1">Otto-Wels-Straße</.v> und <.v bounds="9.993857,53.608479,10.030068,53.621895" lon={10.013238} lat={53.612573} dir="forward" ref="br-nord-n1">Rathenaustraße</.v> wird der Umbau zu Fahrradstraßen vorgeschlagen.</p>

    <p>Für die <.v bounds="10.002818,53.620119,10.020637,53.629562" lon={10.012068} lat={53.623319} dir="forward" ref="br-nord-n1" highlight="Weg beim Jäger,Zeppelinstraße,Alsterkrugchaussee,Röntgenstraße">Großkreuzung am Flughafen</.v> wird ein vollständiger Umbau empfohlen.</p>

    <p>Für die <.v bounds="9.997451,53.617599,10.030974,53.643726" lon={10.014007} lat={53.629934} dir="forward" ref="br-nord-n1">Alsterkrugchaussee</.v> sind <.ref>Protected-Bike-Lanes</.ref> vorgesehen, auf der <.v bounds="9.992936,53.626362,10.026459,53.652488" lon={10.014144} lat={53.638778} dir="forward" ref="br-nord-n1">Langenhorner Chaussee</.v> dagegen <.ref>Radfahrstreifen</.ref>. Die vielen Wohnstraßen in <.v bounds="9.982776,53.638648,10.027345,53.678072" lon={9.999951} lat={53.662359} dir="forward" ref="br-nord-n1">Langenhorn</.v> sollen zu Fahrradstraßen werden – idealerweise so, dass der Routenverlauf einfach erkennbar ist. Am <.v bounds="9.996305,53.673099,10.004423,53.681201" lon={10.001455} lat={53.676332} dir="forward" ref="br-nord-n1">Ochsenzoll</.v> soll die Route an die Planungen zum <.a name="rsw-bad-bramstedt">Radschnellweg</.a> bzw. zur <.a name="alltagsroute-4">Veloroute 4</.a> anschließen. </p>

    <%= Data.Article.Shared.bezirksroute(:nord) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
