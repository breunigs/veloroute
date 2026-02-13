defmodule Data.Article.Blog.KarlHeinzRissmannWeg do
  use Article.Default

  def title(), do: "Karl-Heinz-Rissmann-Weg (Radroute 2, Radroute Plus Geesthacht)"

  def summary(),
    do:
      "Neuer eigenständiger Radweg trennt Rad- und Fußverkehr erstmals. 3m bis 4m breit, größtenteils asphaltiert, teilweise gepflastert."

  def type(), do: :planned
  def tags(), do: ["radroute-2", "rsw-geesthacht"]

  def start(), do: ~d[2026Q2]
  def stop(), do: ~d[2026Q3]

  def map_image do
    {name(),
     [
       {"Bezirksamt Bergedorf, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/bergedorf/bezirksamt/dezernat-wirtschaft-bauen-umwelt-56028"}
     ]}
  end

  def links(_assigns) do
    [
      {"Pläne und Erläuterung", ~d[2026-02],
       "https://fragdenstaat.de/anfrage/radroute-plus-karl-heinz-rissmann-weg/#nachricht-1089519"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Rad- und Fuß teilen sich einen rund 3,0m bis 4,0m breiten Weg.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Vorplatz des Nettelnburger Bahnhofs wird getrennt umgeplant. Deswegen ist er hier ausgespart.</p>

    <p>Vom Bahnhof Richtung Hamburg wird ein neuer 3,0m breiter Radweg asphaltiert. Er verläuft eher näher am Bahndamm und weniger kurvig. Der alte Weg bleibt größtenteils und ist für Fußgänger vorgesehen.</p>

    <p>Vom Bahnhof Richtung Oberer Landweg verlaufen der 4,0m breite Radweg und 3,0m breite Gehweg direkt nebeneinander. Hier kommen rote Pflastersteine zum Einsatz.</p>

    <p>Hinzu kommen an einigen Orten neue Bänke und Anschließbügel.</p>

    <h4>Meinung</h4>
    <p>Rad und Fuß voneinander zu trennen war hier das wichtigste Problem. Wenn das auch vorm Bahnhof gelingt, wird dies eine richtig gute Radroute.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
