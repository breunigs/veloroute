defmodule Data.Article.Blog.Moenckebergstrasse do
  use Article.Default

  def created_at(), do: ~D[2021-01-16]

  def title(), do: "Mönckebergstraße"

  def start(), do: ~d[2021-03-01]
  def stop(), do: ~d[2022-03-31]

  def type(), do: :finished
  def construction_site_id_hh(), do: [9994]
  def tags(), do: ["7", "8", "9", "hochbahn", "u3"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Bedingt durch den barrierefreien Ausbau der U3-Haltestelle „Mönckebergstraße“ werden zahlreiche Velorouten hier unterbrochen. Das markierte Teilstück wird dann zur Schiebestrecke. Alternativ ist die Fahrt über die <.m bounds="9.996056,53.549242,10.006853,53.551148" lon="10.0043443" lat="53.5501906" dir="forward">Steinstraße</.m> in beiden Richtungen weiterhin möglich. Im Februar werden hier Ersatzhaltestellen, Ampeln und Markierungen u.ä. angebracht um die Umleitung der Busse zu ermöglichen.</p> <h4>Quelle</h4> <p><.a href="https://www.hochbahn.de/hochbahn/hamburg/de/Home/Einsteigen/Fahrplan_und_Fahrplanaenderungen/Stoerungsticker/u3_innenstadt_verlagerung_moenckeberg_in_steinstrasse">Infoseite der Hochbahn</.a></p>
    """
  end
end
