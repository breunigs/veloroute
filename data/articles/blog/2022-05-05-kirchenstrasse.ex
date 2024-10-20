defmodule Data.Article.Blog.Kirchenstrasse do
  use Article.Default

  def created_at(), do: ~D[2022-05-05]
  def updated_at(), do: ~D[2023-04-13]

  def title(), do: "Kirchenstraße (Veloroute 12)"
  def summary(), do: "Soll mit möglichst geringem Aufwand zu einer Fahrradstraße werden."

  def type(), do: :finished

  def start(), do: ~d[2023-11-20]
  def stop(), do: ~d[2023-12-15]
  # def construction_site_id_hh(), do: [532_784]

  def tags(), do: ["12"]

  def links(_assigns) do
    [
      {"Baustelleninfo", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/784474/0232b5bb40104fd8551058793477ab1e/kirchenstrasse-veloroute-12-anliegerinformation-oktober-2023-data.pdf"},
      {"Lageplan", "März 2023",
       "https://lsbg.hamburg.de/resource/blob/784368/d274305eef556a5464658afeec5fb810/veloroute-12-kirchenstrasse-abgestimmte-planung-plaene-data.pdf"},
      {"Erläuterungsbericht", "März 2023",
       "https://lsbg.hamburg.de/resource/blob/784366/ea37b14dbac6eccf5e04d1e8fc7d27dd/veloroute-12-kirchenstrasse-abgestimmte-planung-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr hat in der Kirchenstraße keine eigenen Wege und teilt sich Straße im <.ref>Mischverkehr</.ref> mit den KFZ.</p>

    <h4>Planung</h4>
    <p>Die Straße soll Fahrradstraße werden. Aufgrund der vielen Bauvorhaben in der Umgebung setzt man auf schnell umsetzbare Änderungen, statt einem Vollumbau. Konkret soll neu asphaltiert und neu markiert werden, sodass die Fahrradstraße erkennbar wird.</p>

    <p>Der Radwegstummel zur Breiten Straße wird entfernt; es soll direkt auf der Fahrbahn abgebogen werden. Die Einmündung wird nicht umgebaut.</p>

    <h4>Meinung</h4>
    <p>Die Kirchenstraße selbst ist bereits heute gut zu befahren, das Problem sind ihre Anschlüsse. Mit dem Umbau der <.a name="2020-12-04-koenigstrasse">Königstraße</.a> löst sich die eine Seite. Dieser Umbau verbessert auf der anderen Seite immerhin die Fahrt in Richtung Fischmarkt. Von der Breiten Straße in die Kirchenstraße zu kommen bleibt jedoch vorerst ungelöst.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
