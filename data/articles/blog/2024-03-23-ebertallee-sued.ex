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
        from: "Notkestraße",
        to: "Elbchaussee",
        parent_ref: __MODULE__,
        text: "ab Ebertallee nach Süden",
        historic: %{
          "75981362a1d571ab6a22ff167a394230" => ~d[2024-03]
        },
        videos: [
          {"2024-03-23-ebertallee/GX016937", "00:00:19.987", :end},
          {"2024-03-23-ebertallee/GX016938", :start, :end},
          {"2024-03-23-ebertallee/GX016939", :start, :end},
          {"2024-03-23-ebertallee/GX016940", :start, :end},
          {"2024-03-23-ebertallee/GX016941", :start, :end},
          {"2024-03-23-ebertallee/GX016942", :start, :end},
          {"2024-03-23-ebertallee/GX016943", :start, :end},
          {"2024-03-23-ebertallee/GX016944", :start, "00:00:00.834"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "ebertallee",
        direction: :backward,
        from: "Elbchaussee",
        to: "Notkestraße",
        parent_ref: __MODULE__,
        text: "ab Halbmondsweg nach Norden",
        historic: %{
          "137abd58c9b4e6f00b76ae37693acecf" => ~d[2024-03]
        },
        videos: [
          {"2024-03-23-ebertallee/GX016935", "00:01:13.674", :end},
          {"2024-03-23-ebertallee/GX016936", :start, :end},
          {"2024-03-23-ebertallee/GX016937", :start, "00:00:19.987"}
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
    <p>In <.v bounds="9.8854,53.56193,9.891954,53.568974" lon={9.888577} lat={53.568232} dir="forward" ref={@ref}>Richtung Süden</.v> gibt es einen unebenen 1,0m breiten <.ref>Hochbordradweg</.ref>. Es darf auch auf der überbreiten <.ref>Fahrbahn</.ref> geradelt werden. In <.v bounds="9.8854,53.56193,9.891954,53.568974" lon={9.886986} lat={53.562188} dir="backward" ref={@ref}>Richtung Norden</.v> ist dies die einzige Möglichkeit.</p>

    <h4>Planung</h4>
    <p>Auf den überbreiten Fahrbahnen soll je ein 2,0m breiter <.ref>Radfahrstreifen</.ref> aufgemalt werden. Er wird an der <.v bounds="9.887003,53.566272,9.889695,53.56821" lon={9.888338} lat={53.567652} dir="forward" ref={@ref}>Bushaltestelle Ebertallee</.v> unterbrochen, sodass man entweder hinter dem Bus warten muss oder sich in den KFZ-Verkehr einordnet.</p>

    <p>In den Kreuzungen mit <.v bounds="9.88594,53.56404,9.889922,53.565984" lon={9.887357} lat={53.565203} dir="forward" ref={@ref}>Kalckreuthweg</.v> und <.v bounds="9.886708,53.566766,9.890283,53.568947" lon={9.888698} lat={53.567602} dir="backward" ref={@ref}>Osdorfer Weg</.v> werden die Furten rot markiert. Es ist nur <.ref>indirektes Linksabbiegen</.ref> vorgesehen.</p>

    <p>Der alte Hochbordradweg Richtung Süden wird dem Fußweg zugeschlagen, der dann 2,50m breit wird. An der <.v bounds="9.88473,53.561518,9.888358,53.562987" lon={9.886899} lat={53.562417} dir="forward" ref={@ref}>Cranachstraße</.v> wird zusätzlich die Kurve verengt, damit der Weg zum Queren der Straße kürzer ist.</p>

    <p>Es handelt sich beim Umbau um eine Ad-Hoc-Maßnahme. Diese sollen den Bauaufwand gering halten um Rad- und Fußverkehr zeitnah Verbesserungen anbieten zu können.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
