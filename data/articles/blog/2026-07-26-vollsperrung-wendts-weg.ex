defmodule Data.Article.Blog.VollsperrungWendtsWeg do
  use Article.Default

  def title(),
    do: "Wendts Weg (2. Grüner Ring)"

  def summary(),
    do: "Marode Brücke im Wendts Weg macht eine Vollsperrung notwendig."

  def type(), do: :construction

  def tags(), do: ["FR11"]

  def links(_assigns) do
    [
      {"Zeitungsartikel", ~d[2026-07],
       "https://www.abendblatt.de/hamburg/harburg/article412656095/stadt-sperrt-bruecke-fuer-anwohner-warum-spricht-niemand-mit-uns.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Aktueller Zustand</h4>
    <p>Weil die Brücke über den Neuländer Wettern marode ist, wurde sie kurzfristig von der Stadt voll gesperrt. Eine Umleitung für die den zweiten Grünen Ring ist noch nicht ausgeschildert.</p>

    <p>Persönliche Empfehlung: der unbenannte <.v bounds="10.019083,53.467622,10.027876,53.472246" lon={10.02353} lat={53.471108} dir="forward" ref={Freizeitroute11}>Weg etwas weiter östlich</.v> ist eine gut nutzbare Alternative.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
