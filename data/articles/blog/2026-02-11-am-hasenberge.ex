defmodule Data.Article.Blog.AmHasenberge do
  use Article.Default

  def title(), do: "Am Hasenberge (Bezirksroute N8, Freizeitroute 1)"

  def summary(), do: "…wird Tempo-30-Zone mit breiteren Gehwegen und schmälerer Fahrbahn."

  def type(), do: :planned
  def tags(), do: ["br-nord-n8", "FR1"]

  def start(), do: ~d[2026Q3]
  def stop(), do: ~d[2026Q3]

  def map_image do
    {name(),
     [
       {"IGS Ingenieure GmbH & Co. KG", "https://www.igs-ib.de/start.html"},
       {"Bezirksamt Nord, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/fachamt-management-des-oeffentlichen-raums-70286"}
     ]}
  end

  def links(_assigns) do
    [
      {"1. Entwurf – Pläne und Erläuterung", ~d[2026-02],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1016227"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Praktisch kann nur auf der 8,0m breiten <.ref>Fahrbahn</.ref> geradelt werden. Die nur noch stellenweise vorhandenen <.ref>Hochbordradwege</.ref> sind wegen Falschparkern und durch <.ref>Dooring-Gefahr</.ref> unbenutzbar. Tempolimit ist 50 km/h.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Abschnitt wird zur Tempo-30-Zone. Dafür wird die Fahrbahn um die Hasenbergbrücke auf 6,0m verschmälert. Radwegreste werden entfernt und die Fußwege auf Standardbreite erweitert.</p>

    <p>Hinzu kommen Fahrradbügel. Neue Querungsmöglichkeit entlang des Alsterwanderwegs.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
