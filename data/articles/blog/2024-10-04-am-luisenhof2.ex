defmodule Data.Article.Blog.AmLuisenhof2 do
  use Article.Default

  def title(), do: "Am Luisenhof – Tegelweg bis Busüberlieger (Bezirksroute Wandsbek W5)"

  def summary(),
    do:
      "Instandsetzung bringt leicht breiteren Radweg Richtung U-Farmsen. In Gegenrichtung werden Fuß- und Radverkehr mit irritierender Führung gegeneinander ausgespielt."

  def type(), do: :finished

  def tags(), do: ["br-wandsbek-w5"]

  def map_image do
    {name(), [{"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def links(_assigns) do
    [
      {"Lagepläne zur Sanierung", ~d[2024-10],
       "https://fragdenstaat.de/anfrage/am-luisenhof/#nachricht-934002"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind beidseitig rund 1,0m breite <.ref>Hochbordradwege</.ref> vorhanden. Die Wege sind durch Unebenheiten und viele Teilausbesserungen geprägt. Wer mag, darf auch auf der <.ref>Fahrbahn</.ref> radeln.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>In <.v bounds="10.106453,53.605352,10.113094,53.607549" lon={10.107691} lat={53.606015} dir="backward" ref={BrWandsbekW5}>Fahrtrichtung U-Farmsen</.v> soll der Radweg auf 1,25m verbreitert werden. Zum mindestens 2,25m breiten Gehweg soll er mit weißen Noppenplatten abgegrenzt werden.</p>

    <p>In <.v bounds="10.106156,53.605196,10.113835,53.60754" lon={10.111766} lat={53.607024} dir="forward" ref={BrWandsbekW5}>Fahrtrichtung Bramfeld</.v> soll für ein kurzes Stück der alte Radweg zum Gehweg mit <.ref>Fahrrad frei</.ref> werden. Ab der Querungsstelle mit Ampel soll dagegen der alte Gehweg zum reinen Radweg werden. Wer zu Fuß unterwegs ist, muss die Straßenseite wechseln oder in den Park ausweichen.</p>

    <h4>Meinung</h4>
    <p>Man erwartet bei dieser reinen Instandsetzung keine Luftsprünge. Entsprechend wohlwollend sollte man den schmalen Radweg Richtung U-Farmsen sehen. Er ist immerhin durchgängig und erhält neues Pflaster.</p>

    <p>Die Gegenrichtung weist jedoch eine irre Führung auf. Beim <.a ref={AmLuisenhof}>neugebauten Busüberlieger</.a> sind Rad und Fuß noch ordentlich getrennt. Dann gibt es für rund 50m nur einen Gehweg und danach nur einen Radweg. Dass der Radverkehr auf Schrittgeschwindigkeit abbremst oder zu Fuß der Umweg über den Park genommen wird, ist unrealistisch. Man spielt hier Fuß- gegen Radverkehr aus, statt eine ordentliche Lösung zu finden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
