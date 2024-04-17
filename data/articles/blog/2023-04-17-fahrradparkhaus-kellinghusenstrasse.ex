defmodule Data.Article.Blog.FahrradparkhausKellinghusenstrasse do
  use Article.Default

  def title(), do: "Fahrradparkhaus Kellinghusenstraße (Veloroute 13)"

  def summary(),
    do: "Zugänge des Parkhaus werden klarer gekennzeichnet und (legal) fahrbar erreichbar."

  def start(), do: ~d[2023-09]
  def stop(), do: ~d[2023-10]

  def type(), do: :finished

  def tags(), do: ["13"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "April 2023",
       "https://lsbg.hamburg.de/resource/blob/784238/eaa771f05f8b19f4414be1ff430ba3d6/kellinghusenstrasse-anbindung-fahrradparkhaus-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan", "April 2023",
       "https://lsbg.hamburg.de/resource/blob/784240/c0233fd197cd9bf303b341443caf6210/kellinghusenstrasse-anbindung-fahrradparkhaus-abgestimmte-planung-plan-data.pdf"},
      {"Infoseite des Parkhausbetreibers",
       "https://www.pr.hamburg/b-r-anlagen/fahrradparkhaus-kellinghusenstrasse/"},
      {"Infoseite der Stadt",
       "https://www.hamburg.de/fahrradfahren-in-hamburg/14222654/fahrradparkhaus-kellinghusen/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Das Fahrradparkhaus kann nur schiebend erreicht werden. Die Zugänge bzw. Führung dorthin ist unklar.</p>

    <p>Über die Unzulänglichkeiten des Parkhauses wurde in zahlreichen Medien berichtet. Eine gute <.a href="https://www.youtube.com/watch?v=qPk-kgiR3_0">Video-Beschreibung findet sich bei @FahrradstadtHH</.a>.</p>

    <h4>Planung</h4>
    <p>Die Zufahrten sollen durch ein Schachbrettmuster, ggf. mit Fahrrad-Symbol, deutlicher gekennzeichnet werden. Wo sich Fuß- und Radverkehr kreuzen, werden taktile Leitelemente ergänzt.</p>

    <p>Die Ampel wird auch für den Radverkehr freigegeben. Zusätzlich wird auf der anderen Straßenseite eine Aufstelltasche geschaffen, sodass man links zum Parkhaus abbiegen kann, ohne dem nachfolgenden Radverkehr im Weg zu stehen.</p>

    <h4>Meinung</h4>
    <p>An der Planung ist nichts auszusetzen – sie löst den Kritikpunkt der schlechten Erreichbarkeit. Abgesehen vom Schachbrettmuster entspricht dies weitgehend der ursprünglichen Planung, die von der Polizei Hamburg abgelehnt wurde.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
