defmodule Data.Article.Blog.PlannedLagerstrasse do
  use Article.Default

  def created_at(), do: ~D[2018-08-30]

  def title(), do: "Lagerstraße (Veloroute 2)"

  def type(), do: :finished

  def tags(), do: ["2"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Mitte 2019: Diese Baumaßnahme wurde bereits umgesetzt.</strong></p> <p>Diese Kreuzung wird demnächst zu einem Kreisel umgebaut. Weitere Infos, auch zum Umbau im weiteren Verlauf Richtung U2 Christuskirche:</p> <ul>
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
