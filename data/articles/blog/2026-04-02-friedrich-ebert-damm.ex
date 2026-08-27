defmodule Data.Article.Blog.FriedrichEbertDamm do
  use Article.Default

  def title(), do: "Friedrich-Ebert-Damm (Radroute 6)"

  def summary(),
    do:
      "Radfahrstreifen werden stellenweise mittels Borden vom KFZ-Verkehr abgetrennt („Protected-Bike-Lane“)."

  def type(), do: :construction
  def tags(), do: ["radroute-6"]

  def start(), do: ~d[2026-09-01]
  def stop(), do: ~d[2026-09-15]

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"fertige Planung, Erläuterungen", ~d[2026-04],
       "https://lsbg.hamburg.de/resource/blob/1162182/f573d7c6c7d4493f002149cd80845277/friedrich-ebert-damm-nachruestung-protektion-abgestimmte-planung-bericht-data.pdf"},
      {"fertige Planung, Karte", ~d[2026-04],
       "https://lsbg.hamburg.de/resource/blob/1162212/e7c217db2434ac7cb19f99bf0278b382/friedrich-ebert-damm-nachruestung-protektion-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind beidseitig <.ref>Radfahrstreifen</.ref> vorhanden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es werden Betonborde als Trennelemente zum KFZ-Verkehr nachgerüstet. Diese werden überall angebracht, wo dies einfach möglich ist. Neben KFZ-Parkplätzen wird der Radfahrstreifen rot gefärbt.</p>

    <h4>Meinung</h4>
    <p>Gute Sache! Die <.ref>Radfahrstreifen in Mittellage</.ref> und andere Unzulänglichkeiten wird man damit zwar nicht los, aber zumindest ist der Weg dazwischen entspannter.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
