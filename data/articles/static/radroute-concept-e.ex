defmodule Data.Article.Static.RadrouteConceptE do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-concept-e"
  def display_id(), do: "?"
  def title(), do: "Neue Radroute (Konzept)"
  def color(), do: RouteColors.red1()

  def summary(),
    do: "Die Radroute im Konzeptstand soll vom Osdorfer Born zum Autobahndeckel Altona verlaufen."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "e",
        direction: :forward,
        from: "Am Barls",
        to: "Deckel Altona",
        parent_ref: __MODULE__,
        text: "vom Osdorfer Born zum Deckel Altona",
        historic: %{
          "b9562c759152dde0085562463cef44dd" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018445", :start, "00:01:54.548"},
          {"2025-03-13-schene/GX018445", "00:02:15.869", :end},
          {"2025-03-13-schene/GX018446", :start, "00:00:29.667"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "e",
        direction: :backward,
        from: "Deckel Altona",
        to: "Am Barls",
        parent_ref: __MODULE__,
        text: "vom Deckel Altona zum Osdorfer Born",
        historic: %{
          "f452f3838e60714b582fd267f5cc808b" => ~d[2025-03]
        },
        videos: [
          {"2025-03-13-schene/GX018419", "00:03:43.652", :end},
          {"2025-03-13-schene/GX018420", :start, "00:00:43.014"},
          {"2025-03-13-schene/GX018421", :start, :end},
          {"2025-03-13-schene/GX018422", :start, :end},
          {"2025-03-13-schene/GX018423", :start, "00:00:14.234"},
          {"2025-03-13-schene/GX018444", "00:02:45.088", :end}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-concept-e</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.795432,53.522128,9.919726,53.581305" lon={9.823799} lat={53.559959} dir="forward" ref={@ref}>Blankenese</.v></td>
      </tr>
    </table>

    <p></p>

    <h4>Auffindbarkeit</h4>

    <h4>Befahrbarkeit</h4>

    <h4>Meinung</h4>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
