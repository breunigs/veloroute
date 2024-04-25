defmodule Data.Article.Blog.Oberbillwerder1 do
  use Article.Default

  def title(), do: "Vollsperrung Radweg Höhe S-Bahnhof Allermöhe (Radroute 9)"

  def summary(),
    do: "Vollsperrung zwecks Kampfmittelsuche für Oberbillwerder"

  def type(), do: :finished

  def tags(), do: ["9"]

  def start(), do: ~d[2024-02-05]
  def stop(), do: ~d[2024-03-31]

  def links(_assigns) do
    [
      {"Pressemitteilung", "Februar 2024",
       "https://www.hamburg.de/bergedorf/18153924/kampfmittelsondierung-oberbillwerder/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Vollsperrung</h4>
    <p>Wegen der Suche nach Kampfmitteln aus dem 2. Weltkrieg ist die Radroute 9 Höhe S-Bahnhof Allermöhe voll gesperrt. Die Umleitung erfolgt über den <.m bounds="10.146049,53.488794,10.160358,53.492794">Walter-Rudolphi-Weg</.m> bzw. den anschließenden <.m bounds="10.12674,53.489717,10.14965,53.496397">Wanderweg</.m>. Am <.v bounds="10.125129,53.493062,10.138124,53.501094" lon={10.133241} lat={53.498118} dir="backward" ref="9" highlight="Mittlerer Landweg">Mittleren Landweg</.v> kann zurück auf die Radroute gewechselt werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
