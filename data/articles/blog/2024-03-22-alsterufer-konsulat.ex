defmodule Data.Article.Blog.AlsteruferKonsulat do
  use Article.Default

  def title(),
    do: "Alsterufer – vor ehemaligem US-Konsulat (Radroute 4, Freizeitroute FR1)"

  def summary(),
    do:
      "Fahrradstraße soll durchgängig werden. Durchfahrt weiterhin nur für den Radverkehr möglich."

  def type(), do: :finished

  def start(), do: ~d[2025-05-05]
  def stop(), do: ~d[2025-10-24]
  def construction_site_id_hh(), do: [1_396_748]

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def tags(), do: ["radroute-4", "4", "FR1"]

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2025-05],
       "https://web.archive.org/web/20260124205110/https://lsbg.hamburg.de/resource/blob/1053712/fd43b7aa2ae9fe11f2725ddb81d07fe5/alsterufer-anliegerinformation-april-2025-data.pdf"},
      {"Lageplan, fertiger Entwurf", "März 2024",
       "https://lsbg.hamburg.de/resource/blob/784080/f11ab2c8a059bb0574de9664019d0650/alsterufer-alsterfahrradachse-us-konsulat-abgestimmte-planung-plan-data.pdf"},
      {"Erläuterungen, fertiger Entwurf", "März 2024",
       "https://lsbg.hamburg.de/resource/blob/784078/ad521fcc248cf5bea59d1e290ea0f3f9/alsterufer-alsterfahrradachse-us-konsulat-abgestimmte-planung-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Wegen der Straßensperrung vor dem ehemaligen US-Konsulat verschwenkt die Fahrradstraße auf einen schmaleren Fahrradweg.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Fahrradstraße soll durchgängig werden. Die Durchfahrt wird auch in Zukunft dem Radverkehr vorbehalten. Der alte Radweg wird teils zur Grünfläche, teils Fußweg.</p>

    <h4>Meinung</h4>
    <p>Endlich entfällt die Engstelle.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
