defmodule Data.Article.Blog.MeienredderEulenkrugstrasse do
  use Article.Default

  def title(),
    do: "Einmündung Meienredder / Eulenkrugstraße (Bezirksroute W1 Wandsbek)"

  def summary(),
    do:
      "Kreisel am Moorrand. Sonst unkomfortabler und teils gefährlicher Mix verschiedener Radwegarten."

  def start(), do: ~d[2023Q2]
  def stop(), do: ~d[2023Q2]

  def type(), do: :planned
  def tags(), do: ["br-wandsbek-w1"]

  def links(_assigns) do
    [
      {"1. Entwurf, Erläuterungsbericht", "März 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1018045"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Route kann ich Richtung Norden nicht gefolgt werden, da die Beschilderung das Linksabbiegen verbietet. Praktisch ist dies für kurze Fahrzeuge wie Fahrräder aber problemlos über die abgesenkte Mittelinsel möglich.</p>

    <h4>Planung</h4>
    <p>Der abgesenkte Teil der Mittelinsel und die Einmündung sollen verbreitert werden, damit der Lieferverkehr zur Gärtnerei nicht mehr durchs Wohngebiet fährt. Keine Änderungen für's Fahrrad.</p>

    <h4>Meinung</h4>
    <p>Typisch für Hamburg werden die Belange des Radverkehrs ignoriert.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
