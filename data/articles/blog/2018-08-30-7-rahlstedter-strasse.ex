defmodule Data.Article.Blog.RahlstedterStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-7-rahlstedter-strasse"
  def created_at(), do: ~D[2018-08-30]
  def updated(), do: ~D[2020-05-31]
  def title(), do: "Rahlstedter Straße (Veloroute 7)"

  def start(), do: ~d[2018]

  def type(), do: :finished

  def tags(), do: ["7"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand 2020:</strong> Der Umbau ist mittlerweile abgeschlossen und die Radfahrsteifen lassen sich gut befahren.</p> <p>Die Rahlstedter Straße wird zur Zeit umgebaut. Dabei werden die Radwege zukünftig als Fahrradstreifen mit je ca. 1,85m Breite auf der Straße geführt. Weitere Infos:</p> <ul> <li> <.a href="https://lsbg.hamburg.de/contentblob/9226512/95071f6ea281bc0314a6f074a1ba77c2/data/veloroute-7-rahlstedter-strasse-abgestimmte-planung-plaene.pdf">vorläufiger Lageplan</.a> </li> <li> <.a href="https://lsbg.hamburg.de/contentblob/9226508/b3beb118616b379360c224418335459f/data/veloroute-7-rahlstedter-strasse-abgestimmte-planung-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a> </li> </ul>
    """
  end
end
