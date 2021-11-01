defmodule Data.Article.Blog.PlannedWeidenallee do
  use Article.Default

  def name(), do: "#{created_at()}-planned-weidenallee"
  def created_at(), do: ~D[2018-08-30]

  def title(), do: "Weidenallee (Veloroute 2)"

  def type(), do: :finished

  def tags(), do: ["2"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Kreuzung wird gerade umgebaut und der Radverkehr erstmals ordentlich bedacht. So wird eine Querung entlang der Veloroute 2 deutlich komfortabler und zumindest stadtauswärts auch nur eine Ampel beinhalten. Richtung Süden zähle ich
    drei Haltelinien, wobei ich im Bericht aber nichts zur genauen Ampelschaltung finden konnte. Es ist zu hoffen, das man in einem Schwung durchkommt. Weitere Infos, auch zum Umbau im weiteren Verlauf Richtung U2 Christuskirche:</p>
    <ul>
    <li>
      <.a href="https://lsbg.hamburg.de/contentblob/9146652/47c1206338310eb87de362b61d9cf08b/data/veloroute-2-schanzenstrasse-weidenallee-abgestimmte-planung-plaene.pdf">vorläufiger Lageplan</.a>
    </li>
    <li>
      <.a href="https://lsbg.hamburg.de/contentblob/9146616/fe25634deb353f14f65c99eb4435d8d1/data/veloroute-2-schanzenstrasse-weidenallee-abgestimmte-planung-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a>
    </li>
    </ul>
    """
  end
end
