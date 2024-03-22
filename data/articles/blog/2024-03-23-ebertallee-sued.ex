defmodule Data.Article.Blog.EbertalleeSued do
  use Article.Default

  def title(),
    do: "Ebertallee – südlich Osdorfer Weg"

  def summary(),
    do:
      "Ad-Hoc Maßnahme: Die überbreite Fahrbahn soll in Radfahrstreifen und KFZ-Fahrspur aufgeteilt werden. Indirektes Linksabbiegen in den Kreuzungen."

  def type(), do: :planned
  def start(), do: ~d[2025Q3]
  def stop(), do: ~d[2025Q3]

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "ebertallee",
        direction: :forward,
        from: "Kalckreuthweg",
        to: "Cranachstraße",
        parent_ref: __MODULE__,
        text: "Ebertallee nach Süden",
        historic: %{
          "a4949688407178cc29e03c4a4a6c766e" => ~d[2023-11]
        },
        videos: [
          {"2023-11-25-random/GX016721", "00:00:25.392", "00:00:33.901", vf: "curves=lighter"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Lageplan, fertiger Entwurf", "März 2024",
       "https://lsbg.hamburg.de/resource/blob/708360/c31356103f3443bd06d7ead17d3aef7f/ebertallee-adhoc-radfahrstreifen-abgestimmte-planung-plan-data.pdf"},
      {"Erläuterungen, fertiger Entwurf", "März 2024",
       "https://lsbg.hamburg.de/resource/blob/708358/3be33799197adccfeb9208e8096c3dcc/ebertallee-adhoc-radfahrstreifen-abgestimmte-planung-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In Richtung Süden gibt es einen unebenen 1,0m breiten <.ref>Hochbordradweg</.ref>. Es darf auch auf der überbreiten <.ref>Fahrbahn</.ref> geradelt werden. In Richtung Norden ist dies die einzige möglichkeit.</p>

    <h4>Planung</h4>
    <p>Auf den überbreiten Fahrbahnen soll je ein 2,0m breiter <.ref>Radfahrstreifen</.ref> aufgemalt werden. Er wird an der <.m bounds="9.887575,53.566359,9.889263,53.568">Bushaltestelle Ebertallee</.m> unterbrochen, sodass man entweder hinter dem Bus warten muss oder sich in den KFZ-Verkehr einordnet.</p>

    <p>In den Kreuzungen mit <.v bounds="9.88594,53.56404,9.889922,53.565984" lon={9.887357} lat={53.565203} dir="forward" ref={@ref}>Kalckreuthweg</.v> und <.m bounds="9.887468,53.56712,9.889741,53.568705">Osdorfer Weg</.m> werden die Furten rot markiert. Es ist nur <.ref>indirektes Linksabbiegen</.ref> vorgesehen. V</p>

    <p>Der alte Hochbordradweg Richtung Süden wird dem Fußweg zugeschlagen, der dann 2,50m breit wird. An der <.v bounds="9.88473,53.561518,9.888358,53.562987" lon={9.886899} lat={53.562417} dir="forward" ref={@ref}>Cranachstraße</.v> wird zusätzlich die Kurve verengt, damit der Weg zum Queren der Straße kürzer ist.</p>

    <p>Es handelt sich beim Umbau um eine Ad-Hoc-Maßnahme.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
