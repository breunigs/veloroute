defmodule Data.Article.Static.BrEimsbuettelRotherbaumring do
  use Article.Static

  def id(), do: "br-eimsbuettel-rotherbaumring"
  def display_id(), do: "E7"
  def route_group(), do: :bezirk
  def title(), do: "Bezirksroute Eimsbüttel – E7 – Rotherbaumring"

  def color(), do: "#b482ff"
  def color_faded(), do: "#dac2ff"

  def summary(),
    do:
      "Die Bezirksroute „Rotherbaumring“ in Eimsbüttel verläuft von der Tiergartenstraße in einem leichten Bogen über die Uni zur Außenalster."

  def tags(), do: [id(), display_id(), "br-eimsbuettel"]

  def tracks(),
    do: [
      # GPX OK
      %Video.Track{
        renderer: 3,
        group: "rotherbaumring",
        direction: :forward,
        from: "Tiergartenstraße",
        to: "Alstervorland",
        parent_ref: __MODULE__,
        text: "Bezirksroute Eimsbüttel „Rotherbaumring“ → Alstervorland",
        videos: [
          {"2023-02-25-eimsbuettel-br2/GX015237", "00:00:40.699", :end},
          {"2023-02-25-eimsbuettel-br2/GX015238", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015239", :start, :end},
          {"2023-02-25-eimsbuettel-br2/GX015240", :start, "00:00:08.208"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015126", "00:00:20.487", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015127", :start, "00:00:14.815"},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015129", :start, "00:00:11.645"}
        ]
      },
      # GPX OK
      %Video.Track{
        renderer: 3,
        group: "rotherbaumring",
        direction: :backward,
        from: "Alstervorland",
        to: "Tiergartenstraße",
        parent_ref: __MODULE__,
        text: "Bezirksroute Eimsbüttel „Rotherbaumring“ → Tiergartenstraße",
        videos: [
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015159", "00:00:13.413", :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015160", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015161", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015162", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015163", :start, :end},
          {"2023-02-19-bezirksrouten-eimsbuettel/GX015164", :start, "00:00:10.010"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Vorstellung Bezirksrouten Eimsbüttel", "Februar 2023, Details in Anhang VII",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1008163"},
      {"Infoseite Eimsbüttels zu den Bezirksrouten",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/themen/mobilitaet/bezirksrouten-60458"},
      {"Beteiligungsverfahren", "abgeschlossen, 2021",
       "https://bezirksrouten-eimsbuettel.beteiligung.hamburg/#/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h3>Bezirksroute Eimsbüttel – Rotherbaumring <.icon>E7</.icon></h3>

    <p>Die Bezirksroute „Rotherbaumring“ in Eimsbüttel verläuft von der <.v bounds="9.974713,53.562156,9.984444,53.567735" lon={9.978932} lat={53.563793} dir="forward" ref={@ref}>Tiergartenstraße</.v> in einem leichten Bogen über <.v bounds="9.980029,53.562991,9.994006,53.57029" lon={9.984557} lat={53.566466} dir="forward" ref={@ref}>die Uni</.v> (Anschluss an <.icon>3</.icon>) zur <.v bounds="9.990491,53.563877,10.004468,53.571176" lon={10.000531} lat={53.567234} dir="forward" ref={@ref}>Außenalster</.v> (Anschluss an <.icon>4</.icon>).</p>

    <h4>Speziell für diese Route</h4>
    <p>Von Tiergartenstraße bis Uni sollen die Radwege verbreitert werden. An der Uni selbst sollen <.v bounds="9.981496,53.567056,9.984768,53.568601" lon={9.982252} lat={53.567885} dir="forward" ref={@ref}>Allende-Platz</.v> und <.m bounds="9.983642,53.567047,9.986913,53.568592">Binderstraße</.m> direkt verbunden werden, indem das Verbindungsgebäude abgerissen wird. Ab der Uni sollen die Straßen dann zu Fahrradstraßen ausgebaut werden.</p>

    <%= Data.Article.Shared.bezirksroute(:eimsbuettel) %>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
