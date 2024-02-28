defmodule Data.Article.Blog.Bundesstrasse2 do
  use Article.Default

  def title(), do: "Bundesstraße (Rentzelstraße bis Kippingstraße)"

  def summary(),
    do:
      "Beidseitig sollen 1,75m breite Radfahrstreifen aufgemalt werden. KFZ-Parken wird entsprechend neu sortiert."

  def type(), do: :planned

  def tags(), do: ["Bezirksroute B", "Eimsbüttel"]
  def start(), do: ~d[2024Q3]
  def stop(), do: ~d[2024-12]

  def tracks(), do: Data.Article.Blog.Bundesstrasse.tracks()

  def links(_assigns) do
    [
      {"fertiger Entwurf", "Februar 2023",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1009114"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im geplanten Abschnitt sind teilweise unebene, rund 1m breite <.ref>Hochbordradwege</.ref> vorhanden. Sie verlaufen im gefährlichen <.ref>Dooring-Bereich</.ref>.</p>

    <h4>Planung</h4>
    <p>Es sollen rund 1,75m breite <.ref>Radfahrstreifen</.ref> aufgemalt werden. Das KFZ-Parken wird dazu neu sortiert und mit 50cm Sicherheitsabstand zum Radverkehr vorgesehen. Die alten Radwege werden zur Verbreiterung der Gehwege genutzt.</p>

    <p>An den Bushaltestellen wird der Radverkehr über die Wartefläche der Busse geführt. Wer an einem wartenden Bus vorbeifahren möchte, muss sich in den Autoverkehr einordnen.</p>

    <p>An der Kreuzungen mit der <.v bounds="9.977082,53.564613,9.980906,53.567857" lon={9.979681} lat={53.565805} dir="forward" ref={@ref}>Rentzelstraße</.v> und <.v bounds="9.97249,53.567068,9.976314,53.570313" lon={9.974424} lat={53.569076} dir="forward" ref={@ref}>Beim Schlump</.v> sollen die Radfurten rot gefärbt werden. Es werden Aufstelltaschen für <.ref>indirektes Linksabbiegen</.ref> aufgemalt. Es darf auch weiterhin <.ref>direkt</.ref> abgebogen werden.</p>

    <h4>Meinung</h4>
    <p>Die Radfahrstreifen sind okay, aber schmal und ohne sichere Trennung vom KFZ-Verkehr. Es ist verwunderlich, dass eine Fahrradstraße gar nicht erwägt wurde. Dabei ist dies die geplante Führungsform im <.a name="2021-10-19-bundesstrasse">östlichen Teil der Bundesstraße</.a>.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>

    """
  end
end
