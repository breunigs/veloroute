defmodule Data.Article.Static.RadrouteConceptD do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-concept-d"
  def display_id(), do: "?"
  def title(), do: "Neue Radroute (Konzept)"
  def color(), do: RouteColors.purple1()

  def summary(),
    do:
      "Die geplante Radroute soll Burgwedel (Schnelsen) mit dem Niendorfer Marktplatz verbinden. Sie stellt damit eine Ergänzung zu den geplanten Bezirksrouten in Eimsbüttel dar."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Burgwedel",
        to: "Niendorfer Marktplatz",
        parent_ref: __MODULE__,
        text: "von Burgwedel nach Niendorfer Marktplatz",
        historic: %{
          "cbc93c1dce23a0e9e64bcaa6604d05d8" => ~d[2025-02]
        },
        end_action: %{
          action: :play,
          route: Data.Article.Static.Radroute3,
          group: "3",
          direction: :forward
        },
        videos: [
          {"2025-02-28-schnelsen/GX018349", :start, :end, vf: "curves=lighter"},
          {"2025-02-28-schnelsen/GX018350", :start, :end, vf: "curves=lighter"},
          {"2025-02-28-schnelsen/GX018351", :start, "00:01:07.780", vf: "curves=lighter"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Niendorfer Marktplatz",
        to: "Burgwedel",
        parent_ref: __MODULE__,
        text: "vom Niendorfer Marktplatz nach Burgwedel",
        historic: %{
          "c2d8c130196ec7c832cee1321cc6888a" => ~d[2025-02]
        },
        videos: [
          {"2025-02-28-schnelsen/GX018344", "00:00:26.920", :end, vf: "curves=lighter"},
          {"2025-02-28-schnelsen/GX018345", :start, "00:00:03.107", vf: "curves=lighter"},
          {"2025-02-28-schnelsen/GX018346", :start, :end, vf: "curves=lighter"},
          {"2025-02-28-schnelsen/GX018347", :start, :end, vf: "curves=lighter"},
          {"2025-02-28-schnelsen/GX018348", :start, :end, vf: "curves=lighter"}
        ]
      }
    ]

  def links(_assigns) do
    [{"Ride With GPS Routenplaner", "https://ridewithgps.com/routes/52643656"}]
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-concept-d</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.898984,53.628979,9.931425,53.658078" lon={9.909102} lat={53.64848} dir="forward" ref={@ref}>Burgwedel</.v></td>
      </tr>
      <tr>
        <td><.icon>FR10</.icon><.icon>radroute-19</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.902897,53.622386,9.93339,53.646942" lon={9.916437} lat={53.638039} dir="backward" ref={@ref}>Schnelsen</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-niendorf</.icon><.icon>br-eimsbuettel-nord-sued</.icon><.icon>radroute-3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.930253,53.605376,9.961601,53.637373" lon={9.943619} lat={53.620513} dir="backward" ref={@ref}>Niendorf</.v></td>
      </tr>
    </table>

    <p>Die Route deckt sich größtenteils mit der geplanten <.a name="br-eimsbuettel-nord-sued">Bezirksroute Eimsbüttel Nord-Süd</.a>. Beiden starten in <.v bounds="9.897964,53.639914,9.926738,53.654267" lon={9.909464} lat={53.648172} dir="backward" ref={@ref} highlight="Burgwedel,Schnelsen">Burgwedel (Schnelsen)</.v> und führen nach Süden. Anders als die Bezirksroute bleibt die Radroute aber weiter auf der <.v bounds="9.933455,53.619275,9.958627,53.62805" lon={9.939983} lat={53.623857} dir="backward" ref={@ref}>Friedrich-Ebert-Straße</.v> und stößt am <.v bounds="9.941728,53.614571,9.960342,53.62493" lon={9.949454} lat={53.617875} dir="backward" ref={@ref}>Niendorfer Marktplatz</.v> auf die <.a name="radroute-3">Radroute 3</.a>.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich.</p>

    <h4>Meinung</h4>
    <p>Die Idee das Radnetz zu erweitern, damit Schnelsen eine direktere Verbindung in Richtung Zentrum bekommt ist sinnig. Die geplante Radroute ist zwar prinzipiell befahrbar, aber kaum ausgebaut. Die Radwege entlang der Friedrich-Ebert-Straße sind dabei noch am besten, weil sie durchgängig und gut erkennbar sind.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
