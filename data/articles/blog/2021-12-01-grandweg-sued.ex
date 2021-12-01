defmodule Data.Article.Blog.GrandwegSued do
  use Article.Default

  def created_at(), do: ~D[2021-12-01]
  def title(), do: "Stresemannallee / Grandweg (Veloroute 3)"

  def type(), do: :construction
  def tags(), do: ["3"]

  def start(), do: ~d[2021-09-13]
  def stop(), do: ~d[2022-07-31]
  def construction_site_id_hh(), do: [21848]

  def links(_assigns) do
    [
      {"Infoseite der Stadt zur Stresemannallee",
       "https://www.hamburg.de/eimsbuettel/stresemannallee"},
      {"Lageplan",
       "https://www.hamburg.de/contentblob/12775642/c580e219163522bf964a7245d860a1d6/data/stresemannallee-abschnitt6.pdf"}
    ]
  end

  def summary(),
    do: "Abschnittsweise Vollsperrung des Grandweg; letztes Stück Stresemannallee wird saniert"

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Vom <.m bounds="9.960115,53.590877,9.961513,53.59218" lon="9.960137" lat="53.5917" dir="forward" ref="3">Henning-Wulf-Weg</.m> bis zur Kreuzung mit dem Grandweg wurde die Stresemannallee noch nicht umgebaut. Stadtauswärts findet sich dort noch ein alter <.ref>Hochbordradweg</.ref>, der jedoch nicht mehr erreichbar ist. In der Praxis fährt man hier bereits im <.ref>Mischverkehr</.ref>.</p>

    <h4>Planung</h4>
    <p>In der Stresemannallee wird der alte Radweg entfernt und dort stattdessen KFZ-Parkplätze eingerichtet. Die Kreuzung mit dem Grandweg wird ebenfalls modernisiert, wobei sich für den Radverkehr nichts Wesentliches ändert.</p>

    <p>Im Grandweg kommt es zu abschnittsweisen Vollsperrungen, da Hamburg Wasser Leitungsarbeiten durchführt. Betroffen ist der Grandweg von <.m bounds="9.960017,53.591065,9.963817,53.593333">Stresemannallee</.m> bis <.m bounds="9.965579,53.584684,9.969398,53.587647">Troplowitzstraße</.m>. Dies ist auch der Grund warum das letzte Stück der Stresemannallee erst jetzt erneuert wird.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
