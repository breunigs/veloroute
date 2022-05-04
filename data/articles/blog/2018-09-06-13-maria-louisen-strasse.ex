defmodule Data.Article.Blog.MariaLouisenStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-13-maria-louisen-strasse"
  def created_at(), do: ~D[2018-09-06]

  def title(), do: "Maria-Louisen-Straße (Veloroute 13)"

  def type(), do: :planned

  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Aktuell sind die Radwege in der <.m bounds="9.995052,53.583572,10.007843,53.593239">Maria-Louisen-Straße</.m> mangelhaft. Da sie viel zu schmal sind gibt es häufig Konflikte mit Zufußgehenden – und ist laut Bericht sogar ein Unfallschwerpunkt. In 2020 soll der Radverkehr daher auf die Straße verlegt werden. Leider nicht als eigene Spur, sondern wegen Platzmangel nur als Schutzstreifen (gestrichelte Linie).</p><p>Ebenso werden jeweils die Zu- und Abgänge in die <.m bounds="9.997778,53.587134,10.002754,53.588202">Klärchenstraße</.m> und <.m bounds="10.001918,53.579075,10.011211,53.592595">Dorotheenstraße</.m> an die neuen Schutzstreifen angepasst und die Abbiegebeziehungen für den Radverkehr verbessert. Weitere Infos:</p> <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11586720/b563dbc9220ce43f0171aeb94777a6a7/data/veloroute-13-maria-louisen-strasse-von-sierichstrasse-bis-dorotheenstrasse-absgestimmungsunterlage-plan.pdf">vorläufiger Lageplan</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11586716/2a42bf3d14a90ef24a693ab4dffcc803/data/veloroute-13-maria-louisen-strasse-von-sierichstrasse-bis-dorotheenstrasse-absgestimmungsunterlage-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a>
    </li>
    </ul>
    """
  end
end
