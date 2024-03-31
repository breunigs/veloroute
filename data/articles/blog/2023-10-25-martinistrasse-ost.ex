defmodule Data.Article.Blog.MartinistrasseOst do
  use Article.Default

  def title(), do: "Martinistraße Ost (Bezirksroute Nord 6)"

  def start(), do: ~d[2024-10]
  def stop(), do: ~d[2025-08]

  def type(), do: :planned

  def summary(),
    do: "Schmälere Fahrbahn, breitere Gehwege, erstmals Anschließbügel für Fahrräder."

  def tags(), do: ["br-nord-n6"]

  def links(_assigns) do
    [
      {"fertiger Entwurf, Lageplan und Erläuterungsbericht", "März 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013888"},
      {"1. Entwurf, Lageplan und Erläuterungsbericht", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013221"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt keine eigenen Radwege; die Fahrspuren sind im <.ref>Mischverkehr</.ref> mit den KFZ zu teilen.</p>

    <h4>Planung</h4>
    <p>Die Führungsform bleibt Mischverkehr. Die Fahrbahn wird zu Gunsten der Fußwege verschmälert. Erstmals kommen auch Anschließbügel für Fahrräder hinzu. Die Kreuzungen sind nicht teil dieser Planung.</p>

    <h4>Meinung</h4>
    <p>Die Verbesserungen für den Radverkehr beschränken sich auf die Anschließbügel. Die fehlenden eigenen Wege werden sich vor allem bei Stau bemerkbar machen, wenn man nicht mehr vorbeifahren kann. Auch für junge und neue Radfahrer bleibt der Abschnitt mit viel Busverkehr eine Problemstelle.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
