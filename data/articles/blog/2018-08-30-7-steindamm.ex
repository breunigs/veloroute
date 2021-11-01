defmodule Data.Article.Blog.Steindamm do
  use Article.Default

  def name(), do: "#{created_at()}-7-steindamm"
  def created_at(), do: ~D[2018-08-30]

  def title(), do: "Steindamm (Veloroute 7)"

  def start(), do: ~d[2019-10-14]
  def stop(), do: ~d[2021-04-16]

  def type(), do: :finished
  def construction_site_id_hh(), do: [2034]
  def tags(), do: ["7"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Bisher zeichnet sich der Steindamm vor allem durch Kopfsteinpflaster in Parkbereichen und Hochbordradwege aus. Letztere sind qualitativ gar nicht mal so schlecht, aber für das Radaufkommen zu schmal und werden häufig von Zufußgehenden und Lieferverker mitbenutzt. Entsprechend langsam und unbequem kommt man aktuell voran.</p> <p>In der Neufassung erhält das Fahrrad durchgehende Fahrradstreifen von ca. 1,80m Breite (laut Plan: 2m inkl Markierung), wobei diese im Haltestellenbereich mit den Bussen geteilt werden. Um an haltenden Bussen vorbeizufahren muss sich der Radverkehr in den fließenden KFZ-Verkehr einordnen, was kritisch zu betrachten ist. Positiv: der Lieferverkehr wurde extra bedacht – es bleibt also zu hoffen, das der Radfahrstreifen halbwegs frei bleibt. Der Umbau soll 2019 stattfinden, zusammen mit dem barrierefreien Ausbau der U-Lohmühlenstraße. Weitere Infos:</p> <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/13601334/f5c037b639f29b2849788c800468ec4a/data/steindamm-zweiter-bauabschnitt-stand-dez-2020.pdf">Baufortschritt</.a> (Dezember 2020)
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11504940/a4f71097cf72e63cabfe233be0472d27/data/veloroute-7-steindamm-abgestimmte-planung-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11504942/746c8529d9f00a48593a612b9bc41501/data/veloroute-7-steindamm-abgestimmte-planung-plaene.pdf">vorläufiger Lageplan</.a>
    </li>
    </ul>
    """
  end
end
