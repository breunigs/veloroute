defmodule Data.Article.Blog.BudapesterStrasse1 do
  use Article.Default

  def title(), do: "Budapester Straße (Clemens-Schultz-Straße bis Neuer Pferdemarkt)"

  def summary(),
    do:
      "Hochbordradwege werden neu gepflastert und teilweise verbreitert. Oft sind 1,75m bis 2,0m Breite vorgesehen. In Richtung Süden bleibt eine lange Engstelle mit nur 1,0m Breite."

  def type(), do: :construction

  def tags(), do: []

  def start(), do: ~d[2024-07-22]
  def stop(), do: ~d[2025-02-01]
  def construction_site_id_hh(), do: [900_555]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :forward,
        from: "Domstraße",
        to: "Eifflerstraße",
        parent_ref: __MODULE__,
        text: "B4 stadtauswärts",
        historic: %{
          "3be9a574e813711c1f226c544c57c146" => ~d[2024-04]
        },
        videos: [
          {"2024-04-06-fr4/GX017073", "00:00:05.472", :end},
          {"2024-04-06-fr4/GX017074", :start, "00:00:17.918"},
          {"2024-01-27-bergedorf/GX016753", "00:00:45.779", "00:01:07.668"},
          {"2024-03-14-fr12-fr1a/GX016858", "00:00:46.914", :end},
          {"2024-03-14-fr12-fr1a/GX016859", :start, :end},
          {"2024-03-14-fr12-fr1a/GX016860", :start, "00:00:23.190"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :backward,
        from: "Sternbrücke",
        to: "Deichtorplatz",
        parent_ref: __MODULE__,
        text: "B4 stadteinwärts",
        historic: %{
          "00696d414aaa7464ca8242c19ccf35f3" => ~d[2022-04]
        },
        videos: [
          {"2022-04-22-velo2/GX013442", :start, :end},
          {"2022-04-22-velo2/GX013443", :start, "00:00:09.643"},
          {"2022-03-26-veloroute-4/GX013388", "00:00:02.703", "00:00:05.005"},
          {"2021-04-17-freizeitrouten-6und-7/GX011253", "00:00:36.570", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011254", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011255", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011256", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011257", :start, "00:00:10.010"}
        ]
      }
    ]

  @attrib {"LSBG Hamburg (B1)", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, 1, {
        %{lat: 53.556655249, lon: 9.964669351},
        %{lat: 53.553809957, lon: 9.965392082},
        %{lat: 53.553731050, lon: 9.964514088},
        %{lat: 53.556576245, lon: 9.963790340}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.554071590, lon: 9.965181695},
        %{lat: 53.552131603, lon: 9.967524766},
        %{lat: 53.551869614, lon: 9.966910669},
        %{lat: 53.553809308, lon: 9.964566438}
      })
    ]
  end

  def links(_assigns) do
    [
      {"Baustelleninfo", "Juli 2024",
       "https://lsbg.hamburg.de/resource/blob/936084/bfb3499b1da21110b9728771fd31bdfc/budapester-strasse-geh-und-radwege-anliegerinformation-juli-2024-data.pdf"},
      {"Ausschreibung Umbau", "Mai 2024",
       "https://web.archive.org/web/20240509065037/https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/32fdcd04-6561-4d25-a3e7-4c816a11bc43/details"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die beidseitigen <.ref>Hochbordradwege</.ref> haben wechselnde Breiten. Teils sind es 2,0m, teils nur 1,0m. Die Beläge wechseln zwischen altem und modernem Pflaster – und sind in die Jahre gekommen.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Rad- und Gehwege werden neu gepflastert. Beide werden stellenweise verbreitert. In <.v bounds="9.96363,53.551774,9.967543,53.556608" lon={9.966992} lat={53.552439} dir="forward" ref={@ref}>Richtung Norden</.v> sind überwiegend 1,75m bis 2,0m geplant. In <.v bounds="9.96363,53.551774,9.967543,53.556608" lon={9.96429} lat={53.555847} dir="backward" ref={@ref}>Richtung Süden</.v> anfangs noch 2,0m, <.v bounds="9.96363,53.551774,9.967543,53.556608" lon={9.964972} lat={53.553677} dir="backward" ref={@ref}>später</.v> bleibt es bei den heutigen 1,0m Breite. Teilstücke in beide Richtungen sind mit 2,5m geplant.</p>

    <p>Wenn beim Ausbau festgestellt wird, dass wichtige Baumwurzeln einen Ausbau verhindern, werden die Wege ggf. schmaler.</p>

    <h4>Meinung</h4>
    <p>Das ohne kompletten Umbau Engstellen verbleiben, ist verständlich. Für die lange Strecke mit unbrauchbaren 1,0m Breite hätte die Gestaltungsfreude höher ausfallen müssen. Da sich hinter den KFZ-Schrägparkplätzen direkt nochmal ein KFZ-Längsparkstreifen befindet, ist es auch kein Platzproblem. Der LSBG hatte bei der <.a name="2022-05-25-saarlandstrasse-nord">Planung zur Saarlandstraße</.a> bereits festgestellt, dass bei langsamem Ausparken auf Sicherheitsabstände bzw. Maßnahmen verzichtet werden kann. Warum nicht hier?</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
