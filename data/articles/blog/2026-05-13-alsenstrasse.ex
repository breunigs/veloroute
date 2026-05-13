defmodule Data.Article.Blog.Alsenstrasse do
  use Article.Default

  def title(), do: "Alsenstraße (Radroute 16)"

  def summary(), do: "In Abschnitten werden Trennelemente zum KFZ-Verkehr aufgeklebt."

  def start(), do: ~d[2026-09]
  def stop(), do: ~d[2026-09]

  def type(), do: :planned

  def tags(), do: ["radroute-16"]

  def map_image do
    {name(), [{"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def links(_assigns) do
    [
      {"Lageplan", ~d[2026-05],
       "https://lsbg.hamburg.de/resource/blob/1174672/94daec49913d4e6285313ab5ee4a2416/alsenstrasse-nachruestung-protektion-abgestimmte-planung-plan-data.pdf"},
      {"Erläuterungen", ~d[2026-05],
       "https://lsbg.hamburg.de/resource/blob/1174668/10e15b87fce9d9643940f5d5f8a10745/alsenstrasse-nachruestung-protektion-abgestimmte-planung-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Beidseitig sind <.ref>Radfahrstreifen</.ref> vorhanden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Wo dies einfach möglich ist, sollen Trennelemente zum KFZ-Verkehr aufgeklebt werden. Das ist vor allem auf der Seite <.v bounds="9.944639,53.560178,9.953372,53.566003" lon={9.949059} lat={53.562562} dir="forward" ref={Radroute16}>Richtung Eimsbüttel</.v> der Fall.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
