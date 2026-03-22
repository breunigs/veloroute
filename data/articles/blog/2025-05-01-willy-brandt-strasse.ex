defmodule Data.Article.Blog.WillyBrandtStrasse do
  use Article.Default

  def title(), do: "Willy-Brandt-Straße (Radrouten 2 und 3)"

  def summary(),
    do:
      "Geh- und Radwege werden saniert und in der Aufteilung angepasst. Fahrt vom Deich (Radroute 2) nach Westen künftig via Deichtorplatz."

  def type(), do: :construction
  def start(), do: ~d[2025-08-04]
  def stop(), do: ~d[2026-04-26]

  def tags(), do: ["br-mitte-m1", "radroute-3", "radroute-2"]

  def map_image do
    {name(),
     [
       {"stracon", "https://stra-con.de/impressum/"},
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2025-07],
       "https://lsbg.hamburg.de/resource/blob/1081784/67f609d2d40128f981204d2412f9bcb6/willy-brandt-strasse-anliegerinformation-juli-2025-data.pdf"},
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

    <p>Eine Änderung gibt es bei der Führung vom <.v bounds="10.001129,53.544891,10.009068,53.548161" lon={10.004373} lat={53.546557} dir="backward" ref={Radroute2}>Radweg am Oberhafenkanal</.v> zur Willy-Brandt-Straße. Der Radweg <.m bounds="10.00231,53.546431,10.004668,53.547209">zwischen Deichtorcenter und Zollkanal</.m> entfällt. Stattdessen werden die vorhandenen <.v bounds="10.002096,53.54611,10.005826,53.548301" lon={10.004747} lat={53.547599} dir="backward" ref={@ref}>Fahrradfurten auf der Westseite</.v> des Deichtorplatz auf 3m verbreitert und für beide Richtungen freigegeben.</p>

    <h4>Meinung</h4>
    <p>Das Planungsbüro kann nicht zaubern, wenn ihnen politisch die Arme gebunden werden. Dem Autoverkehr exklusiv acht oder noch mehr Spuren zu schenken, während Rad- und Fußverkehr sich im Nahkampf die Reste teilen sollen, ist schlicht asozial. Die Stadt verschenkt großes Potential Altstadt und HafenCity zusammenwachsen zu lassen und sollte diesen toten Ort dringend weiterentwickeln.</p>

    <p>An der Planung selbst habe ich nur eine Sache auszusetzen: <.v bounds="10.00366,53.547034,10.006132,53.548286" lon={10.004781} lat={53.547766} dir="backward" ref={@ref}>von der neuen Zweirichtungsfurt</.v> kann man kaum nach links in die Willy-Brandt-Straße abbiegen. Man muss stark abbremsen, wenn man nicht über den Gehweg fahren will. Mit Anhänger ist es nochmal schwieriger dort die Kurve nicht zu schneiden.</p>


    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
