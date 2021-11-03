defmodule Data.Article.Blog.HammerStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-hammer-strasse"
  def created_at(), do: ~D[2021-02-10]

  def title(), do: "Hammer Straße zwischen Jüthornstraße und Grenzknick"

  def start(), do: ~d[2021-06]
  def stop(), do: ~d[2021-08]

  def type(), do: :planned

  def tags(), do: ["radfahrstreifen", "bettelampel", "articles"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In Fahrtrichtung Süden müssen sich Radverkehr und Leute zu Fuß den rund 1,5m bis 2,0m breiten Weg teilen. In der Gegenrichtung sind Fuß- und Radweg getrennt, aber ebenfalls je nur rund 1,5m breit. Illegal abgestellte Autos schränken die nutzbare Breite weiter ein, obwohl im ganzen Abschnitt das Parken in den <.ref>Nebenflächen</.ref> untersagt ist. Vom <.m bounds="10.065137,53.557086,10.074764,53.561503">Horner Kreisel kommend</.m> muss der Radverkehr die Straßenseite wechseln, wozu eine Ampel mit manuellem Taster bereit steht.</p>

    <h4>Planung</h4>
    <p>Die Planung sieht vor den Radverkehr zukünftig auf rund 2,0m breiten Radfahrstreifen zu führen. Dies kann ohne größere Umbauten passieren, da die KFZ-Spuren bisher deutlich breiter als notwendig sind. Die <.m bounds="10.06712,53.559619,10.071364,53.561566">Ampel am Grenzknick</.m> bleibt weiterhin eine Bettelampel, deren Taster man mit dem Rad nicht immer sinnvoll erreichen kann.</p>

    <p>Wo keine Bäume im Weg sind werden die Gehwege verbreitert. Das illegale Parken wird legalisiert, wobei ein Wabengitter aus Kunststoff die Baumwurzeln schützen soll.</p>

    <p>Eine <.ref>Protected-Bike-Lane</.ref> wurde geprüft, aber verworfen. Die Bäume sind bei einem größeren Umbau gefährdet, da sie oberflächennah wurzeln. Eine Protected-Bike-Lane ist durch die Trennelemente etwas breiter als herkömmliche Radfahrstreifen und würde daher diesen Umbau benötigen. Es werden weitere Gründe angeführt, z.B. die bessere Laubreinigung durch die Stadtreinigung im Herbst, die vielen Einfahrten die eine Unterbrechung der Trennelemente erfordern und der Wunsch der Anlieger die (illegalen) Parkplätze zu erhalten.</p>

    <h4>Meinung</h4>
    <p>Der Hauptkritikpunkt ist die Fehlplanung um die <.m bounds="10.06712,53.559619,10.071364,53.561566">Ampel am Grenzknick</.m>. Eine Bettelampel ist nicht mehr zeitgemäß, aber wenn dann sollten wenigstens die Taster vom Fahrrad aus erreichbar sein. In der Planung muss man absteigen, illegal über den Fußweg fahren oder innerhalb des Radwegs eine 180° Wende schaffen.</p>
    <p>Das keine Protected-Bike-Lane eingerichtet werden kann ist zwar schade, aber verständlich.</p>

    <h4>Quelle</h4>
    <ul>
    <li><.a href="https://lsbg.hamburg.de/contentblob/14873580/2e15aa1daa468d525066d61607ef09fc/data/hammer-strasse-von-grenzknick-bis-juethornstrasse-abgestimmte-planung-bericht.pdf">Erläuterungsbericht</.a></li>
    <li><.a href="https://lsbg.hamburg.de/contentblob/14873568/e8f1cbf923603ceaa61db8061c4c0ab3/data/hammer-strasse-von-grenzknick-bis-juethornstrasse-abgestimmte-planung-plan.pdf">Lageplan</.a></li>
    </ul>
    """
  end
end
