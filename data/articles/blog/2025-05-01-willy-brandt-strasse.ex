defmodule Data.Article.Blog.WillyBrandtStrasse do
  use Article.Default

  def title(), do: "Willy-Brandt-Straße (Radrouten 2 und 3)"

  def summary(),
    do:
      "Geh- und Radwege werden saniert und in der Aufteilung angepasst. Fahrt vom Deich (Radroute 2) nach Westen künftig via Deichtorplatz."

  def type(), do: :planned
  def start(), do: ~d[2025-08-04]
  def stop(), do: ~d[2026-04-30]

  def tags(), do: ["radroute-3", "radroute-2"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Rödingsmarkt",
        to: "Deichtorplatz",
        parent_ref: __MODULE__,
        text: "Willy-Brandt-Straße nach Osten",
        historic: %{
          "bac66065e31e8f79c98c7aac8c05b583" => ~d[2024-01]
        },
        videos: [
          {"2024-01-27-bergedorf/GX016739", :start, :end},
          {"2024-01-27-bergedorf/GX016740", :start, "00:00:04.538"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :backward,
        from: "Deichtorplatz",
        to: "Rödingsmarkt",
        parent_ref: __MODULE__,
        text: "Willy-Brandt-Straße nach Westen",
        historic: %{
          "325a9aa367f287f73dffca00f2d4d136" => ~d[2021-04]
        },
        videos: [
          {"2021-04-17-freizeitrouten-6und-7/GX011314", "00:00:03.337", :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011315", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011316", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011317", :start, :end},
          {"2021-04-17-freizeitrouten-6und-7/GX011318", :start, :end}
        ]
      }
    ]

  def map_image do
    {name(),
     [
       {"stracon", "https://stra-con.de/impressum.html"},
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Bauvergabe mit Lageplan", ~d[2025-04],
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/e39994f7-fe6a-4624-b2ff-aecf0b6da6fa/details"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind beidseitig <.ref>Hochbordradwege</.ref> unterschiedlicher Breite vorhanden. Stellenweise nur 1m breit und und mit <.v bounds="10.002739,53.547322,10.004075,53.547878" lon={10.003364} lat={53.547617} dir="backward" ref={@ref}>Pollern mitten auf dem Radweg</.v>.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Planung belässt die Straßenaufteilung gleich und macht nur kleine Anpassungen an Rad- und Gehwegen.</p>

    <p>Wo möglich, werden die <.ref>Hochbordradwege</.ref> auf 2,0m verbreitert und mit weißen Noppenblatten vom Gehweg abgetrennt. Es gibt breitere Stellen mit 2,5m aber auch schmälere mit nur 1,5m breiten Radwegen. Stellenweise werden Rad- und Fußverkehr nicht voneinander getrennt, sondern müssen sich irgendwie arrangieren.</p>

    <p>Eine Änderung gibt es bei der Führung vom <.v bounds="10.001129,53.544891,10.009068,53.548161" lon={10.004373} lat={53.546557} dir="backward" ref="radroute-2">Radweg am Oberhafenkanal</.v> zur Willy-Brandt-Straße. Der Radweg <.m bounds="10.00231,53.546431,10.004668,53.547209">zwischen Deichtorcenter und Zollkanal</.m> entfällt. Stattdessen werden die vorhandenen <.v bounds="10.002096,53.54611,10.005826,53.548301" lon={10.004747} lat={53.547599} dir="backward" ref={@ref}>Fahrradfurten auf der Westseite</.v> des Deichtorplatz auf 3m verbreitert und für beide Richtungen freigegeben.</p>

    <h4>Meinung</h4>
    <p>Das Planungsbüro kann nicht zaubern, wenn ihnen politisch die Arme gebunden werden. Dem Autoverkehr exklusiv acht oder noch mehr Spuren zu schenken, während Rad- und Fußverkehr sich im Nahkampf die Reste teilen sollen, ist schlicht asozial. Die Stadt verschenkt großes Potential Altstadt und HafenCity zusammenwachsen zu lassen und sollte diesen toten Ort dringend weiterentwickeln.</p>

    <p>An der Planung selbst habe ich nur eine Sache auszusetzen: <.v bounds="10.00366,53.547034,10.006132,53.548286" lon={10.004781} lat={53.547766} dir="backward" ref={@ref}>von der neuen Zweirichtungsfurt</.v> kann man kaum nach links in die Willy-Brandt-Straße abbiegen. Man muss stark abbremsen, wenn man nicht über den Gehweg fahren will. Mit Anhänger ist es nochmal schwieriger dort die Kurve nicht zu schneiden.</p>


    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
