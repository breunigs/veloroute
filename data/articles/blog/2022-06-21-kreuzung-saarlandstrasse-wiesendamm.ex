defmodule Data.Article.Blog.KreuzungSaarlandstrasseWiesendamm do
  use Article.Default
  def created_at(), do: ~D[2022-06-21]
  def title(), do: "Kreuzung Saarlandstraße/Wiesendamm (Alltagsroute 5N)"

  def summary(),
    do: "Meist 2,0m breite Radfahrstreifen ohne Trennelemente neben bis zu vier KFZ-Spuren."

  def type(), do: :planned
  def tags(), do: ["5N", "5"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "Juni 2022",
       "https://lsbg.hamburg.de/contentblob/16267670/7b5c29beabb81b9ec73ae6d157478856/data/saarlandstrasse-kreuzung-wiesendamm-abstimmungsunterlage-bericht.pdf"},
      {"Lageplan", "Juni 2022",
       "https://lsbg.hamburg.de/contentblob/16267672/0f41229b1e684aa782af8f0d7c2940a9/data/saarlandstrasse-kreuzung-wiesendamm-abstimmungsunterlage-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird über unebene und schmale <.ref>Hochbordradwege</.ref> geführt.</p>

    <h4>Planung</h4>
    <p>Der Radverkehr wird meist auf 2,0m breiten <.ref>Radfahrstreifen</.ref> geführt. Diese werden nicht vom KFZ-Verkehr abgetrennt.</p>

    <p>Auf der <.m bounds="10.031744,53.588043,10.033311,53.589838" lon="10.032869" lat="53.58928" dir="backward" ref="5">Seite des U-Bahnhofs Saarlandstraße</.m> bleibt es beim Hochbordradweg. Dieser wird auf 3,0m verbreitert und  bis zum Bahnhof für beide Fahrtrichtungen freigegeben. Wer der Veloroute in Richtung Innenstadt folgen möchte, muss den „gegenläufigen“ Radverkehr in Richtung Bahnhof Vorfahrt gewähren.</p>

    <p>In allen Straßen werden jeweils nach der Kreuzung Bushaltestellen eingerichtet. Bei der <.m bounds="10.031688,53.587485,10.034289,53.589685" lon="10.033459" lat="53.58824" dir="backward" ref="5">Saarlandstraße Richtung Norden</.m> klassisch als Busbucht, wo der Radfahrstreifen links am Bus vorbeiläuft. An allen anderen Stellen hält der Bus auf dem Radfahrstreifen. Entweder muss man hinter dem Bus warten, oder sich in den KFZ-Verkehr einordnen um vorbeizufahren.</p>

    <p>Zum Linksabbiegen in die <.m bounds="10.031375,53.585788,10.035432,53.588372" lon="10.03368" lat="53.586992" dir="backward" ref="5">Jarrestraße</.m> wird eine eigene Aufstellfläche und Ampel zum <.ref>indirekten Linksabbiegen</.ref> geschaffen. An der Kreuzung mit dem Wiesendamm ist ebenfalls indirektes Linksabbiegen vorgesehen.</p>

    <h4>Meinung</h4>
    <p>Die Planung ist für 2022 ein Armutszeugnis, denn sie wirft den Radverkehr ungeschützt neben bis zu vier KFZ-Spuren. Die Fahrbahn wird teilweise verschwenkt um eine weitere KFZ-Spur zu erhalten. An ähnlichen Stellen, wie z.B. in der Grindelallee, wird der Radweg dort regelmäßig durch KFZ geschnitten. An den Bushaltestellen muss man auf dem Fahrrad dann ebenfalls zusehen, wo man bleibt.</p>

    <p>Eine zeitgemäße Planung würde den Radverkehr durchgehend vom KFZ-Verkehr trennen. KFZ-Parkplätze müssen abgeschafft oder verlegt werden, z.B. in die Straßenmitte wie an der Esplanade.</p>

    <p>Auch der Zweirichtungs-Radweg fällt unter gut gemeint, schlecht gemacht: wer vom Bahnhof Richtung Norden möchte muss immer noch einen riesigen Umweg machen. Eine Querungsmöglichkeit auf Höhe des Bahnhofs wäre für Alle deutlich bequemer.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
