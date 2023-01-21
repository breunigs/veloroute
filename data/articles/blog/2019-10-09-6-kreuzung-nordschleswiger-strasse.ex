defmodule Data.Article.Blog.KreuzungNordschleswigerStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-6-kreuzung-nordschleswiger-strasse"
  def created_at(), do: ~D[2019-10-09]
  def updated_at(), do: ~D[2020-06-20]
  def title(), do: "Kreuzung Nordschleswiger Straße (Veloroute 6)"

  def start(), do: ~d[2019-03]
  def stop(), do: ~d[2019-11-30]

  def type(), do: :finished

  def tags(), do: ["6"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht zum Umbau Ring 2", "Kreuzung Eulenkamp auf S16",
       "https://lsbg.hamburg.de/contentblob/9537980/128746b1e22353babee56ef3f1b0a4fc/data/wandsbeker-alle-zw-tiroler-str-u-wandsegruenzug-abgestimmte-planung-bericht.pdf"},
      {"Lageplan ",
       "https://lsbg.hamburg.de/contentblob/9537982/0a4f8a9c541a736dc2e385fed5e800f4/data/wandsbeker-alle-zw-tiroler-str-u-wandsegruenzug-abgestimmte-planung-plan.pdf"},
      {"Infoseite der Stadt zum Baufortschritt",
       "https://web.archive.org/web/20190712020017/https://lsbg.hamburg.de/ring2-hamburg-nord/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand 2020:</strong> Der Umbau ist abgeschlossen und dem Radverkehr wird im Kreuzungsbereich jeweils ein Radfahrstreifen spendiert. Indirektes Linksabbiegen ist immer möglich und die Ampeln schalten in beide Richtungen automatisch. Das heißt die eigentlich abgestimmte Fassung wurde nochmals geändert um dem Radverkehr eine vernünftige Lösung anbieten zu können – sehr gut! Der nachfolgende Teil des Artikels beschreibt den damals angedachten Zustand und ist entsprechend veraltet.</p>
    <p>Stadteinwärts musste man eine Bettelampel betätigen um die <.m bounds="10.062489,53.579484,10.069636,53.588212">Nordschleswiger Straße</.m> queren zu dürfen. Die Kreuzung wird zur Zeit umgebaut und sieht nach Abschluss der Arbeiten eine Führung im Mischverkehr vor. Das heißt, das sich Rad- und KFZ Verkehr die Spuren und hier auch die gleichen Ampeln teilen. Indirektes Linksabbiegen wird den Radfahrenden immer ermöglicht. Je nach Richtung steht manchmal auch eine direkte Abbiegemöglichkeit (zusammen mit den KFZ) zur Wahl. Vermutlich dauern die Arbeiten bis Ende November 2019.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
