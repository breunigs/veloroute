defmodule Data.Article.Blog.Tresckowstrasse do
  use Article.Default

  def title(), do: "Tresckowstraße und Goebenstraße"

  def type(), do: :intent

  def tags(), do: []

  def summary(),
    do:
      "Straße soll durchgängig asphaltiert werden, breitere Gehwege erhalten und sichere Begegnungen von Fahrrad und KFZ ermöglichen."

  def links(_assigns) do
    [
      {"Kopfsteinpflaster soll vorerst bleiben", ~d[2026-03],
       "https://www.ndr.de/nachrichten/hamburg/kopfsteinpflaster-in-eimsbuetteler-tresckowstrasse-bleibt,tresckowstrasse-100.html"},
      {"Präsentation zur Vorplanung", ~d[2025-07],
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/to020.asp?TOLFDNR=1036928"}
    ]
  end

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "a",
        direction: :forward,
        from: "Osterstraße",
        to: "Bismarckstraße",
        parent_ref: __MODULE__,
        text: "Tresckowstraße → Goebenstraße",
        historic: %{
          "911fe465ae1d7b8538234fede33f824f" => ~d[2026-02]
        },
        videos: [
          {"2026-02-15-eims/GX018759", "00:00:02.933", "00:00:41.653"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "a",
        direction: :backward,
        from: "Bismarckstraße",
        to: "Osterstraße",
        parent_ref: __MODULE__,
        text: "Goebenstraße → Tresckowstraße",
        historic: %{
          "df6b5f9b4969d7b7d68837975990c7bd" => ~d[2026-02]
        },
        videos: [
          {"2026-02-15-eims/GX018765", "00:01:28.527", "00:02:08.747"}
        ]
      }
    ]

  def map_image do
    {name(),
     [
       {"Bezirksamt Eimsbüttel – Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/ihr-bezirksamt/fachamt-management-des-oeffentlichen-raumes-58482"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <.h4_planning ref={@ref} checked={@show_map_image}>Vorplanung</.h4_planning>
    <p>Nach dem Bau der Fernwärmeleitung werden Tresckowstraße und südöstliche Goebenstraße für Fuß- und Radverkehr verbessert. Gehwege werden verbreitert, neue Fahrradbügel aufgestellt und Kopfsteinpflaster durch Asphalt ersetzt.</p>

    <p>In der Tresckowstraße wird die Fahrgasse verbreitert, damit KFZ und Radverkehr besser aneinander vorbeikommen. In der Goebenstraße wird sie dagegen von 6,7m auf etwa 5,0m verschmälert, um näher an die typischen 4,0m für Hamburger Fahrradstraßen zu kommen. Die Anpassungen erfolgen vor allem durch Markierungen .</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
