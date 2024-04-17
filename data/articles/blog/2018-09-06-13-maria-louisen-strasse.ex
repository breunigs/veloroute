defmodule Data.Article.Blog.MariaLouisenStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-13-maria-louisen-strasse"
  def created_at(), do: ~D[2018-09-06]

  def title(), do: "Maria-Louisen-Straße (Veloroute 13)"

  def type(), do: :planned
  def start(), do: ~d[2026-06]
  def stop(), do: ~d[2027-06]

  def tags(), do: ["13"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/resource/blob/784378/8bf23d78d7e3d05f4c5dc601016710e3/veloroute-13-maria-louisen-strasse-sierichstrasse-bis-dorotheenstrasse-abstimmungsunterlage-bericht-data.pdf"},
      {"Lageplan",
       "https://lsbg.hamburg.de/resource/blob/784380/dc32cb70045290180f3b66ed38931bb8/veloroute-13-maria-louisen-strasse-sierichstrasse-bis-dorotheenstrasse-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Aktuell sind die Radwege in der <.m bounds="9.995052,53.583572,10.007843,53.593239">Maria-Louisen-Straße</.m> mangelhaft. Da sie viel zu schmal sind gibt es häufig Konflikte mit Zufußgehenden – und ist laut Bericht sogar ein Unfallschwerpunkt. In 2020 soll der Radverkehr daher auf die Straße verlegt werden. Leider nicht als eigene Spur, sondern wegen Platzmangel nur als Schutzstreifen (gestrichelte Linie).</p><p>Ebenso werden jeweils die Zu- und Abgänge in die <.m bounds="9.997778,53.587134,10.002754,53.588202">Klärchenstraße</.m> und <.m bounds="10.001918,53.579075,10.011211,53.592595">Dorotheenstraße</.m> an die neuen Schutzstreifen angepasst und die Abbiegebeziehungen für den Radverkehr verbessert.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
