defmodule Data.Article.Static.BrNordN1 do
  use Article.Static

  def id(), do: "br-nord-n1"
  def display_id(), do: "N1"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Nord – N1 – Nord ↔ Süd"

  def color(), do: "#a8a8a8"

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

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
