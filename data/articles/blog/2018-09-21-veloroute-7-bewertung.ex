defmodule Data.Article.Blog.Veloroute7Bewertung do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-7-bewertung"
  def created_at(), do: ~D[2018-09-21]

  def title(), do: "Bewertung der Veloroute 7 Herbst 2018"

  def type(), do: nil

  def tags(), do: ["7"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Veloroute 7 wird hauptsächlich im Mischverkehr geführt, wobei es sich meist um Nebenstraßen handelt. Leider sind einige immer noch mit 50 km/h Maximalgeschwindigkeit freigegeben, obwohl sich z.B. ab Höhe <.m bounds="10.025892,53.556658,10.026498,53.55886">Steinhauerdamm</.m> eine durchgehende Fahrradstraße über <.m bounds="10.025948,53.558695,10.037018,53.561559">Angerstraße</.m>, <.m bounds="10.037018,53.561559,10.05725,53.565965">Hasselbrookstraße</.m> <.m bounds="10.05725,53.541401,10.062073,53.568979">Pappelallee</.m> und <.m bounds="10.061931,53.569042,10.06777,53.57036">Bärenallee</.m> geradezu anbieten würde.</p>
    <p>Insgesamt ist die Führung der Route ordentlich: die Streckenabschnitte an viel befahrenen Straßen sind kurz und die Führung durch die Nebenstraßen meist geradlinig ohne Umwege. Es gibt aber auch negative Stellen: an der <.m bounds="10.009954,53.552183,10.018587,53.55289">Adenauerallee</.m> und am <.m bounds="10.009945,53.552183,10.020348,53.557153">Steindamm</.m> kommt es häufig zu Konflikten mit den Zufußgehenden und man hat häufig Kopfsteinpflaster. An den <.m bounds="10.072754,53.569163,10.081741,53.571433">Bahngärten</.m> fehlt die Führung indes völlig, was bei dieser stark befahrenen Stelle mehr als unangenehm ist – hier muss dringend nachgebessert werden.</p>
    <p>In der <.m bounds="10.113785,53.576491,10.133257,53.584874">Kuehnstraße</.m> gibt es noch Radwege aus Altbestand, die selbst bei moderaten 15 km/h unbefahrbar sind, ansonsten bleibt es aber hauptsächlich beim Mischverkehr, mit Radwegen hier und da.</p>
    <p>Unterm Strich fehlt der Route ein echtes Highlight. Selbst wenn die genannten Mängel behoben sind hebt sich die Route kaum von anderen Nebenstraßen ab. Würde man sie konsequent als Fahrradstraße ausführen, hätte sie echtes Potential. Benutzbar ist sie aber allemal, da die meisten Streckenteile wenig befahren sind und man gut durchkommt.</p>
    <p><.a href="https://www.abendblatt.de/hamburg/article215478963/Im-Zickzack-kurs-durch-Wohngebiete-nach-Rahlstedt.html">Zeitungsartikel/Review vom 04.10.2018</.a></p>
    """
  end
end
