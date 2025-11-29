defmodule Data.Article.Blog.OthmarscherMuehlenweg do
  use Article.Default

  def title(), do: "Othmarscher Mühlenweg (Radroute 1)"

  def summary(),
    do: "Einmündung wird rechtwinklig, bleibt aber rechts vor links."

  def type(), do: :planned

  def tags(), do: ["radroute-1", "1"]

  def start(), do: ~d[2024]
  def stop(), do: ~d[2024]

  def links(_assigns) do
    [
      {"fertiger Entwurf", ~d[2024-11],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1015850"},
      {"1. Entwurf", "Mai 2023",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1014062"}
    ]
  end

  def text(assigns) do
    ~H"""
     <h4>Alter Zustand</h4>
    <p>Die Einmündung des Othmarscher Mühlenweg ist spitzwinklig und daher in Richtung Flottbek schlecht einzusehen. Der KFZ-Verkehr ist gering, da nur Kleingärten und ein Sportplatz in der Seitenstraße sind.</p>

    <h4>Planung</h4>
    <p>Es entsteht ein neues Wohngebiet, das über eine neue Straße an den <.v bounds="9.904423,53.551515,9.907411,53.552885" lon={9.905415} lat={53.552223} dir="forward" ref={Alltagsroute1}>Othmarscher Mühlenweg</.v> angeschlossen wird. Die Einmündung des Othmarscher Mühlenweg in den <.v bounds="9.904423,53.551515,9.907411,53.552885" lon={9.905415} lat={53.552223} dir="forward" ref={Alltagsroute1}>Othmarscher Kirchenweg</.v> wird rechtwinklig um die Übersicht zu verbessern. Die Radroute erhält Vorfahrt, da die Nebenstraße mittels Gehwegüberfahrt angebunden wird.</p>

    <h4>Meinung</h4>
    <p>Dass die Verkehrssicherheit im Auge behalten wird ist gut. Es ist gut, dass man im zweiten Entwurf der Radroute die Vorfahrt gibt.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
