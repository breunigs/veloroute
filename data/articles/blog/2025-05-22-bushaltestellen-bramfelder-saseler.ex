defmodule Data.Article.Blog.BushaltestellenBramfelderSaseler do
  use Article.Default

  def title(), do: "Bushaltestellen in Bramfelder und Saseler Chaussee (Radroute 5)"

  def summary(),
    do:
      "Schildertausch zum „gemeinsamen Fuß- und Radweg“ im Bereich einiger Bushaltestellen. Pflaster wird entsprechend angepasst."

  def start(), do: ~d[2025-07-28]
  def stop(), do: ~d[2025-11-25]

  def type(), do: :finished

  def tags(), do: ["radroute-5"]

  def map_image do
    {name(),
     [
       {"Urban Ingenieurteam", "http://www.urban-ing-team.de/"},
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2025-07],
       "https://web.archive.org/web/20250810035940/https://lsbg.hamburg.de/resource/blob/1078440/c1c0dfba791712b5b705c996dea56c28/bramfelder-chaussee-anliegerinformation-juli-2025-data.pdf"},
      {"Bauvergabe", ~d[2025-05],
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/1f7eaaef-f886-41ea-bc93-bdb879801810/details"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die <.ref>benutzungspflichtigen</.ref> <.ref>Hochbordradwege</.ref> führen direkt durch den Wartebereich der Bushaltestellen:</p>
    <ul>
      <li><.v bounds="10.082511,53.625476,10.088704,53.628561" lon={10.08541} lat={53.626601} dir="forward" ref={Radroute5}>Maisredder Richtung Sasel</.v></li>
      <li><.v bounds="10.086332,53.629969,10.093868,53.634311" lon={10.08901} lat={53.631792} dir="forward" ref={Radroute5}>Am Damm Richtung Sasel</.v></li>
      <li><.v bounds="10.091534,53.637476,10.096779,53.640611" lon={10.09476} lat={53.639066} dir="backward" ref={Radroute5}>Rolfinckstraße Richtung Bramfeld</.v></li>
    </ul>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Oberflächen werden stellenweise neu gepflastert. Im Bereich der Bushaltestellen wird die Beschilderung zu einem „gemeinsamen Fuß- und Radweg“ geändert.</p>

    <h4>Meinung</h4>
    <p>Rausgeworfenes Geld für diese nicht-Lösung. Den Bus auf der Fahrbahn halten zu lassen wäre nicht nur für die Fahrgäste angenehmer, sondern würde auch Platz schaffen um Fuß- und Radverkehr besser zu trennen. Das geht auch ohne großen Umbau.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
