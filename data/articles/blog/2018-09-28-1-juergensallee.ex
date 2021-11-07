defmodule Data.Article.Blog.Juergensallee do
  use Article.Default

  def name(), do: "#{created_at()}-1-juergensallee"
  def created_at(), do: ~D[2018-09-28]
  def updated_at(), do: ~D[2020-05-29]
  def title(), do: "Jürgensallee (Veloroute 1)"

  def start(), do: ~d[2019-11]
  def stop(), do: ~d[2020-03]

  def type(), do: :finished

  def tags(), do: ["1", "a16"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Frühjahr 2020:</strong> Der Umbau ist mittlerweile abgeschlossen und der asphaltierte Teil fährt sich gut. Im denkmalgeschützten Bereich verbleibt es beim Kopfsteinpflaster und enstprechend unbequem ist dieser Abschnitt. Er ist jetzt aber deutlich kürzer, und daher zu verschmerzen.</p> <p>Die <.m bounds="9.848476,53.553139,9.870139,53.557758">Jürgensallee</.m> ist zwischen der <.m bounds="9.86395,53.547726,9.881269,53.565494">Baron-Voght-Straße</.m> und der <.m bounds="9.850007,53.552638,9.858745,53.557709">Kanzleistraße</.m> momentan vollständig in Kopfsteinpflaster geführt. Entsprechend unkomfortabel ist dieser Teilabschnitt. Nach dem geplanten Umbau im Frühjahr 2019 soll im Bereich der denkmalgeschützten Häuser das Kopfsteinpflaster bestehen bleiben (<.m bounds="9.86395,53.547726,9.881269,53.565494">Baron-Voght-Straße</.m> bis ca. Hausnummer 100), aber neu verlegt werden um den Zustand zu verbessern. Im weiteren Verlauf wird die Straße asphaltiert und es kommen an einigen Stellen noch Querungshilfen hinzu. Die Doppeleinmündung <.m bounds="9.850007,53.552638,9.858745,53.557709">Kanzleistraße</.m> und <.m bounds="9.852768,53.555115,9.859105,53.55773">Karl-Jacob-Straße</.m> wird etwas kompakter gefasst, bleibt aber sonst bei der aktuellen Führung.</p><p>Besser als vorher ist der reduzierte Streckenanteil mit Kopfsteinpflaster allemal, wirklich attraktiv sind die verbleibenden 90m aber nicht. Idealerweise würde die Route hier anders geführt werden um nicht zwischen Radverkehr und Denkmalschutz abwägen zu müssen.</p> <p><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1007916">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
