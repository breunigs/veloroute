defmodule Data.Article.Static.Alltagsroute12 do
  use Article.Static

  def id(), do: "12"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 12"

  def color(), do: "#ed6706"

  def summary(),
    do: "Alltagsroute 12 führt vom Rathaus nach Altona"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "12",
        direction: :forward,
        from: "Innenstadt",
        to: "Altona",
        parent_ref: __MODULE__,
        text: "aus der Innenstadt nach Altona",
        historic: %{
          "359b4f5e3ed270488c9f4bb3c41879cb" => ~d[2023-05],
          "46744d4e32ca048d128cb0dcf1df673c" => ~d[2022-04],
          "aaa2dfe3fe041ee5983284e7cd349011" => ~d[2021-06]
        },
        videos: [
          {"2023-05-21-vr12-vr9/GX015821", "00:00:25.020", :end},
          {"2023-05-21-vr12-vr9/GX015822", :start, :end},
          {"2023-05-21-vr12-vr9/GX015823", :start, :end},
          {"2023-05-21-vr12-vr9/GX015824", :start, :end},
          {"2023-05-21-vr12-vr9/GX015825", :start, :end},
          {"2023-05-21-vr12-vr9/GX015826", :start, :end}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "12",
        direction: :backward,
        from: "Altona",
        to: "Innenstadt",
        parent_ref: __MODULE__,
        text: "von Altona in die Innenstadt",
        historic: %{
          "ec081a60074bd5839aec7b13ce45ab3a" => ~d[2023-05],
          "4954c372030bde7d562eedc2d21bfd5f" => ~d[2022-04],
          "a5aa0cbc5c7e75039561772114010442" => ~d[2021-06]
        },
        videos: [
          {"2023-05-21-vr12-vr9/GX015789", :start, :end},
          {"2023-05-21-vr12-vr9/GX015790", :start, :end},
          {"2023-05-21-vr12-vr9/GX015791", :start, :end},
          {"2023-05-21-vr12-vr9/GX015792", :start, :end},
          {"2023-05-21-vr12-vr9/GX015793", :start, "00:00:05.772"},
          {"2023-05-21-vr12-vr9/GX015795", "00:00:13.146", :end},
          {"2023-05-21-vr12-vr9/GX015796", :start, :end},
          {"2023-05-21-vr12-vr9/GX015797", :start, :end},
          {"2023-05-21-vr12-vr9/GX015798", :start, :end},
          {"2023-05-21-vr12-vr9/GX015800", :start, :end},
          {"2023-05-21-vr12-vr9/GX015801", :start, :end},
          {"2023-05-21-vr12-vr9/GX015802", :start, :end},
          {"2023-05-21-vr12-vr9/GX015803", :start, "00:00:11.676"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426798/veloroute-12/"},
      {"Komoot Routenplaner: nach Altona", "https://www.komoot.de/tour/225148542"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/2238410"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="7" style="background-image: url(/images/route12.svg)">
          <.icon>12</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.990953,53.548317,9.998129,53.552594" lon={9.993833} lat={53.550924} dir="forward" ref="12">Rathaus</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>1</.icon>
          <.icon>11</.icon>
          <.icon>2</.icon>
        </td>
        <td><.m bounds="9.9866263,53.5479641,9.9871242,53.548472">Rödingsmarkt</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
        </td>
        <td><.m bounds="9.9661435,53.5412334,9.9761435,53.5512334">Landungsbrücken</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>11</.icon>
        </td>
        <td><.m bounds="9.9663729,53.5457403,9.9668345,53.5459993">Alter Elbtunnel</.m></td>
      </tr>
      <tr>
        <td></td>
        <td><.m bounds="9.9510767,53.5453571,9.9530303,53.546346">Fischmarkt</.m></td>
      </tr>
      <tr>
        <td>
          <.icon>13</.icon>
        </td>
        <td><.m bounds="9.92758,53.5417787,9.9602617,53.5627471">Altona</.m></td>
      </tr>
    </table>

    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
