defmodule Data.Article.Blog.GrandwegSued do
  use Article.Default

  def created_at(), do: ~D[2021-12-01]
  def updated_at(), do: ~D[2022-02-23]

  def title(), do: "Stresemannallee / Grandweg (Veloroute 3)"

  def type(), do: :planned
  def tags(), do: ["3", "br-nord-n7"]

  def start(), do: ~d[2024Q2]
  def stop(), do: ~d[2024Q2]
  # def construction_site_id_hh(), do: [21848]

  def links(_assigns) do
    [
      {"fertiger Entwurf (Lageplan und Erläuterungsbericht)", "März 2024",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1009145"},
      {"Geplanter Bautermine", "November 20223",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/to020.asp?TOLFDNR=1030471"},
      {"Infoseite der Stadt zur Stresemannallee",
       "https://www.hamburg.de/eimsbuettel/stresemannallee"},
      {"1. Entwurf (veraltet, Lageplan und Erläuterungsbericht)",
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1007317"}
    ]
  end

  def summary(),
    do:
      "Grandweg abschnittsweise gesperrt; Diagonaltrenner bei Stresemannallee/Behrkampsweg geplant"

  def text(assigns) do
    ~H"""
    <h4>Stand Februar 2022</h4>
    <p>Die Planung wurde erneut überarbeitet: es soll zusätzlich ein Diagonaltrenner gebaut werden.</p>

    <h4>Alter Zustand</h4>
    <p>Vom <.v bounds="9.960115,53.590877,9.961513,53.59218" lon={9.960137} lat={53.5917} dir="forward" ref="3">Henning-Wulf-Weg</.v> bis zur Kreuzung mit dem Grandweg wurde die Stresemannallee noch nicht umgebaut. Stadtauswärts findet sich dort noch ein alter <.ref>Hochbordradweg</.ref>, der jedoch nicht mehr erreichbar ist. In der Praxis fährt man hier bereits im <.ref>Mischverkehr</.ref>.</p>

    <h4>Planung</h4>
    <p>In der Stresemannallee wird der alte Radweg entfernt und dort stattdessen KFZ-Parkplätze eingerichtet. Die Kreuzung mit dem Grandweg wird ebenfalls modernisiert, wobei ein Diagonaltrenner gebaut werden soll. Diese bleibt für Rad- und Fuß in alle Richtungen passierbar. KFZ die der Veloroute stadtauswärts folgen müssen dort dann rechts abbiegen in den Grandweg abbiegen; in Fahrtrichtung stadteinwärts links in den Behrkampsweg.</p>

    <p>Im Grandweg kommt es zu abschnittsweisen Vollsperrungen, da Hamburg Wasser Leitungsarbeiten durchführt. Betroffen ist der Grandweg von <.m bounds="9.960017,53.591065,9.963817,53.593333">Stresemannallee</.m> bis <.m bounds="9.965579,53.584684,9.969398,53.587647">Troplowitzstraße</.m>. Dies ist auch der Grund warum das letzte Stück der Stresemannallee erst jetzt erneuert wird.</p>

    <h4>Meinung</h4>
    <p>Der Diagonaltrenner tat Not. Vorher waren keine wesentlichen Verbesserungen für den Radverkehr vorgesehen. Jetzt ist nicht nur das Linksabbiegen deutlich einfacher, sondern auch der KFZ-Schleichverkehr wird aus dem Wohngebiet herausgehalten. Davon profitieren auch die anliegenden Abschnitte der Veloroute, die dadurch weniger KFZ-belastet sind.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
