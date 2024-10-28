defmodule Data.Article.Blog.TunnelSteinHardenbergStrasse do
  use Article.Default

  def title(), do: "Unterführung Stein-Hardenberg-Straße (Wandseradweg)"

  def summary(), do: "Der Weg im Tunnel soll noch 2024 beleuchtet werden."

  def type(), do: :intent
  def tags(), do: ["FR3"]
  def start(), do: ~d[2024]
  def stop(), do: ~d[2024]

  def point_of_interest(), do: %{lon: 10.1383853, lat: 53.5962044, zoom: 17}

  def links(_assigns) do
    [
      {"Blogpost Lokalpolitiker", ~d[2024-10],
       "https://www.buschhueter.de/licht-im-tunnel-beleuchtung-soll-noch-dieses-jahr-kommen/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Unterführung ist stockdunkel. Selbst bei Sonnenschein ist der Weg schlecht zu erkennen.</p>

    <h4>Vorhaben</h4>
    <p>Die Unterführung soll beleuchtet werden. Der Wandseradweg bleibt wie bisher unbeleuchtet.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
