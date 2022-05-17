defmodule Data.Article.Blog.Reclamstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-06-10]

  def title(), do: "Reclamstraße (nördlicher Teil, Veloroute 14)"

  def start(), do: ~d[2021-05-17]
  def stop(), do: ~d[2021-12-31]

  def type(), do: :finished

  def construction_site_id_hh(), do: [16005]

  def tags(), do: ["14", "M6.5"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Im nördlichen Teil der Reclamstraße fährt man bisher auf schmalen Hochbordradwegen. Lediglich an der <.m bounds="10.107498,53.541066,10.110111,53.54228" lon="10.1095302" lat="53.541448" dir="backward">Kreuzung mit dem Öjendorfer Weg</.m> mischt man sich unter den KFZ-Verkehr und biegt dort dann ab. In der Gegenrichtung verläuft es genau anders herum.</p> <p>In der vorliegenden Planung wird der Radverkehr auf rund 2m breiten Radfahrstreifen geführt. Der Platz dafür entsteht durch das Wegfallen einiger Autoparkplätze, Müllcontainer und einem schmaleren Fußweg auf der Ostseite. Auf der Westseite erhält der Fußweg dagegen die Fläche des entfallenden, alten Hochbordradwegs.</p> <p>Die <.m bounds="10.107498,53.541066,10.110111,53.54228" lon="10.1095302" lat="53.541448" dir="backward">Kreuzung mit dem Öjendorfer Weg</.m> wird nur im Teil der Reclamstraße umgebaut. Die Führung bleibt jedoch schlecht: aus der Reclamstraße heraus bleibt es beim Mischverkehr Rad/Auto, in der Gegenrichtung gibt es zunächst nur einen schmalen Schutzstreifen, der sich erst nach einem ganzen Stück zu dem zwei Meter breiten Radfahrstreifen aufweitet.</p> <p>Die Planung wirkt gut. Ausnahme bildet die nach wie vor sehr autozentriete Kreuzung mit dem Öjendorfer Weg. Leider ist der Erläuterungsbericht nicht veröffentlicht worden, sodass die Gründe unklar sind.</p> <p>Gebaut werden soll ab Herbst 2020 und man hofft sogar noch 2020 fertig zu sein.</p> <p><.a href="https://www.hamburg.de/mitte/strassenbau-und-verkehr/13921778/veloroute-14-ausbau-reclamstrasse/">Infoseite der Stadt</.a> (Pläne am Ende der Seite unter Downloads)</p>
    """
  end
end
