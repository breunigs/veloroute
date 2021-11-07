defmodule Data.Article.Blog.Bismarckstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-06-14]

  def title(), do: "Bismarckstraße (Veloroute 3)"

  def start(), do: ~d[2017-04-10]
  def stop(), do: ~d[2021-05-21]

  def type(), do: :finished
  def construction_site_id_hh(), do: [69, 615]
  def tags(), do: ["3"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Bereits seit einiger Zeit werden in der <.m bounds="9.96173,53.573342,9.972361,53.578054">Bismarckstraße</.m> die Kanäle erneuert, im Anschluss soll das Teilstück der Veloroute 3 für den Radverkehr entsprechend umgebaut werden.</p> <p>Hierzu wird die <.m bounds="9.965203,53.575929,9.971883,53.577475" lon="9.9698612" lat="53.5764564" dir="forward">Ampel an der Bogenstraße</.m> durch einen Kreisverkehr ersetzt um das Linksabbiegen zu erleichtern. Die Bismarckstraße selbst wird zu einer Tempo-30-Zone nach aktuellem Standard umgebaut. Das heißt die Kurven werden enger gefasst um die Abbiegegeschwindigkeit zu reduzieren. Zuätzlich wird <.m bounds="9.965252,53.575519,9.972525,53.577182" lon="9.9685127" lat="53.5760991" dir="forward">nach dem Scheideweg</.m> und <.m bounds="9.96329,53.574634,9.970563,53.576298" lon="9.9668643" lat="53.5753782" dir="forward">vor der Goebenstraße</.m> eine Einengung gebaut. Das Querparken wird zugunsten breiterer Fußwege durch Längsparken ersetzt.</p> <p>Spannend ist der <.m bounds="9.963916,53.57492,9.96901,53.576086" lon="9.9666058" lat="53.575348" dir="forward">Übergang zur Goebenstraße</.m>, die auch nach dem Umbau eine Fahrradstraße bleibt. Statt Rechts-vor-Links wird durch eine Aufplasterung die Fahrt entlang der Veloroute bevorrechtigt, womit auch stadteinwärts zügiges Vorankommen möglich sein sollte.</p> <p>Abgeschlossen werden soll der Umbau bis Ende 2020.</p> <p><.a href="https://www.hamburg.de/eimsbuettel/bismarckstrasse/">Infoseite der Stadt</.a></p>
    """
  end
end
