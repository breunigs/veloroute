defmodule Data.Article.Blog.Schlueterstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-3-schlueterstrasse"
  def created_at(), do: ~D[2018-10-13]

  def title(), do: "Schlüterstraße (Veloroute 3)"

  def type(), do: :planned
  def construction_site_id_hh(), do: [8623]
  def tags(), do: ["3"]

  def links(_assigns) do
    [
      {"Infoseite der Stadt zur Schlüterstraße",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/themen/mobilitaet/schlueterstrasse-60836"},
      {"Lageplan Teil 1",
       "https://www.hamburg.de/resource/blob/60828/5cdd0ac0a124b341714bf70c233903df/karte1-schlueterstrasse-pdf-data.pdf"},
      {"Lageplan Teil 2",
       "https://www.hamburg.de/resource/blob/60830/08f1a2d6255819275c5b618d452f320f/karte2-schlueterstrasse-pdf-data.pdf"},
      {"Lageplan Teil 3",
       "https://www.hamburg.de/resource/blob/60832/83ec8bb310097ee712fc0f02db22a61f/karte3-schlueterstrasse-pdf-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Frühjahr 2022</h4>
    <p>Bis auf den Anschluss der <.v bounds="9.984367,53.565573,9.988528,53.568126" lon={9.986502} lat={53.566116} dir="forward" ref="3">Johnsallee</.v> ist der Umbau abgeschlossen. Wann das fehlende Stück nachgeholt wird ist mir nicht bekannt.</p>

    <h4>Beschreibung</h4>
    <p>Die <.m bounds="9.985805,53.564028,9.98786,53.571384">Schlüterstraße</.m> soll auf ihrer gesamten Länge zu einer Fahrradstraße umgewidmet werden – mit Ausnahme des bereits jetzt existiernden Stücks Zufußgehendezone im Bereich der Uni. Insbesondere schließt die Planung das kurze Stück zwischen <.m bounds="9.984625,53.570123,9.988511,53.570325">Hartungstraße</.m> und <.m bounds="9.985401,53.571186,9.986163,53.572603">Hallerplatz</.m> mit ein, obwohl die Veloroute hier bereits vorher abknickt. Auch die <.m bounds="9.984625,53.570123,9.988511,53.570325">Hartungstraße</.m> wird im Bereich der Veloroute (und nur dort) zu einer Fahrradstraße und gleichzeitig auch asphaliert.</p>

    <p>Den Fahrradstraßen wird an vielen Stellen Vorfahrt gewährt, indem man den Gehweg fortführt. Die KFZ und Radfahrende die den Gehweg queren müssen entsprechend warten. Das ist etwa so an der <.v bounds="9.984367,53.565573,9.988528,53.568126" lon={9.986477} lat={53.56759} dir="forward" ref="3">Binderstraße</.v>, der <.v bounds="9.984367,53.565573,9.988528,53.568126" lon={9.986502} lat={53.566116} dir="forward" ref="3">Johnsallee</.v> und dem Ostteil der <.m bounds="9.984625,53.570123,9.988511,53.570325">Hartungstraße</.m> so geplant. An der <.m bounds="9.985703,53.563735,9.993431,53.564192">Moorweidenstraße</.m> endet die Fahrradstraße und es gilt wieder Rechts-vor-Links. Ebenso an der <.m bounds="9.984335,53.569425,9.986319,53.569708">Bieberstraße</.m>.</p>

    <p>Die Führung bleibt im Wesentlichen so wie jetzt, allerdings werden die Parkstände besser angeordnet, sodass die Strecke aufgeräumter wirkt. Außerdem kommen 100 neue Fahrradstellplätze hinzu.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
