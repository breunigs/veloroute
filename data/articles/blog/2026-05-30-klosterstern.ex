defmodule Data.Article.Blog.Klosterstern do
  use Article.Default

  def title(), do: "Klosterstern"

  def summary(), do: "Radspur soll angepasst werden um Unfälle zu reduzieren."

  def start(), do: ~d[2026]
  def stop(), do: ~d[2026]

  def type(), do: :planned

  def tags(), do: []

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "1",
        direction: :forward,
        from: "Rothenbaumchaussee Einfahrt",
        to: "Rothenbaumchaussee Ausfahrt",
        parent_ref: __MODULE__,
        text: "Klosterstern im Uhrzeigersinn",
        historic: %{
          "0a76a00a19e1f4ee3ab7f4b9181a6a50" => ~d[2022-01]
        },
        videos: [
          {"2022-01-08-rothenbaumchaussee/GX013125", "00:00:34.935", "00:00:44.302"},
          {"2022-01-08-rothenbaumchaussee/GX013107", "00:00:11.342", "00:00:14.781"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"fertiger Entwurf, Erläuterung", ~d[2026-05],
       "https://lsbg.hamburg.de/resource/blob/1179104/fe9f65ca307b14b4b432bf5fc0b682b6/klosterstern-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf, Karte", ~d[2026-05],
       "https://lsbg.hamburg.de/resource/blob/1179108/5e94ef84c4abbd81fcd04fc45d4bf72b/klosternstern-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Ein rot gefärber <.ref>Radfahrstreifen</.ref> verläuft kreisrund um den Klosterstern. Er ist leicht von der Fahrbahn abgesetzt. An fast allen Einmündungen passieren häufig Unfälle.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>An den Einmündungen soll er Radfahrstreifen etwas in Richtung Kreismitte verschoben werden. Sie werden dort noch 1,7m breit.</p>

    <p>Man erhofft sich dadurch bessere Sichtbeziehungen für einbiegende Fahrzeuge auf den Radfahrstreifen.</p>

    <h4>Meinung</h4>
    <p>Als Sofortmaßnahme um die Unfallzahlen zu reduzieren in Ordnung.</p>

    <p>Langfristig muss der Klosterstern neu gedacht werden und den starken Fokus auf das Auto reduzieren. Die in der Planung vorgestellten Ansätze orientieren sich noch immer am KFZ-Durchsatz, statt die Grünfläche zu einem Park aufzuwerten und Fußwege zu verkürzen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
