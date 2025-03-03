defmodule Data.Article.Static.Radroute23 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-23"
  def display_id(), do: "23"
  def title(), do: "Radroute 23"
  def color(), do: RouteColors.blue2()

  def summary(),
    do:
      "Bindet die Stadtteile Niedergeorgswerder und Kirchdorf ans Radnetz an. Schlechtere Alternative zur Radroute 4 und 12."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "23",
        direction: :forward,
        from: "Wilhelmsburger Brücke",
        to: "König-Georg-Deich",
        parent_ref: __MODULE__,
        text: "von der Veddel Richtung Harburg",
        historic: %{
          "08b7ea523d109ae2177803c2361161b8" => ~d[2024-05]
        },
        videos: [
          {"2024-05-18-vr10/GX017615", :start, "00:00:17.114"},
          {"2024-05-18-vr10/GX017616", :start, :end},
          {"2024-05-18-vr10/GX017617", :start, "00:00:27.990"},
          {"2024-05-18-vr10/GX017618", :start, "00:00:36.696"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "23",
        direction: :backward,
        from: "König-Georg-Deich",
        to: "Wilhelmsburger Brücke",
        parent_ref: __MODULE__,
        text: "von der Süderelbe zur Veddel",
        historic: %{
          "d473ba750d2dabbbed2efa16cda85a19" => ~d[2024-05]
        },
        videos: [
          {"2024-05-18-vr10/GX017625", "00:01:38.979", :end},
          {"2024-05-18-vr10/GX017626", :start, "00:02:38.226"}
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
          <.icon>radroute-23</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.012335,53.520028,10.020675,53.524421" lon={10.014909} lat={53.522241} dir="forward" ref={@ref}>Müggenburger Durchfahrt</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-21</.icon><.icon>radroute-12</.icon><.icon>radroute-3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.013197,53.518506,10.024145,53.523308" lon={10.016597} lat={53.521576} dir="forward" ref={@ref}>Ballin Park</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td><.v bounds="10.015399,53.513776,10.030245,53.520986" lon={10.019633} lat={53.517847} dir="forward" ref={@ref}>B75</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.007873,53.501034,10.037188,53.514853" lon={10.021894} lat={53.507857} dir="forward" ref={@ref}>Niedergeorgswerder</.v></td>
      </tr>
      <tr>
        <td><.icon>FR11</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.000783,53.473811,10.043885,53.507167" lon={10.019212} lat={53.490129} dir="forward" ref={@ref}>Kirchdorf</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td><.v bounds="9.994528,53.473625,10.005292,53.479597" lon={10.000792} lat={53.476145} dir="forward" ref={@ref}>B75 und Eisenbahn</.v></td>
      </tr>
      <tr>
        <td><.icon>FR6</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.99092,53.473794,10.003447,53.480396" lon={9.996636} lat={53.47774} dir="forward" ref={@ref}>König-Georg-Deich</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.99008,53.469435,10.004456,53.47901" lon={9.995673} lat={53.474976} dir="forward" ref={@ref}>Süderelbe</.v></td>
      </tr>
    </table>

    <p>Radroute 23 verläuft in Nord-Süd-Richtung. Sie bindet hauptsächlich die Stadtteile <.v bounds="10.007873,53.501034,10.037188,53.514853" lon={10.021894} lat={53.507857} dir="forward" ref={@ref}>Niedergeorgswerder</.v> und <.v bounds="10.000783,53.473811,10.043885,53.507167" lon={10.019212} lat={53.490129} dir="forward" ref={@ref}>Kirchdorf</.v> ans Radnetz an, stellt aber auch eine Alternative zur zentraleren <.a name="radroute-12">Radroute 12</.a> bzw. <.a name="radroute-4">Radroute 4</.a>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert, und daher nicht leicht auffindbar. Allerdings orientiert sie sich am großen, durchgängigen Straßenzug durch die Stadtteile. Mit ein wenig Übung findet man die Route daher auch ohne technische Hilfsmittel oder guter Ortskenntnis.</p>

    <h4>Befahrbarkeit</h4>
    <p>Sofern man auf der <.ref>Fahrbahn</.ref> fährt, ist die gesamte Route allwettertauglich und durchgängig. Wer lieber auf dem teilweise vorhandenen <.ref>Hochbordradweg</.ref> fahren möchte, muss mit Unebenheiten rechnen, teils über Gras fahren und dennoch öfters auf die Fahrbahn wechseln, weil der Radweg nicht durchgängig ist.</p>

    <h4>Meinung</h4>
    <p>Abgesehen von einem kurzen Stück am <.v bounds="10.016993,53.515881,10.021541,53.521646" lon={10.019057} lat={53.519429} dir="forward" ref={@ref}>Veddeler Bogen</.v>, ist die Route gar nicht ausgebaut. Die alten Radwegreste enden häufig im Nichts – damit steht die Route im Vergleich besonders schlecht dar. Bis die Route signifikant umgebaut wird, ist sie nicht empfehlenswert.</p>

    <p>Je nach Ziel und Wetter kann auch die <.v bounds="10.003043,53.488348,10.043072,53.518723" lon={10.017336} lat={53.505672} dir="forward" ref="FR11">Freizeitroute 11</.v> eine Alternative darstellen. Wer nur durch Wilhelmsburg möchte, ist auf <.a name="radroute-12">Radroute 12</.a> bzw. <.a name="radroute-4">Radroute 4</.a> deutlich besser unterwges.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
