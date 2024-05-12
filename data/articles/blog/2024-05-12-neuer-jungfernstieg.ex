defmodule Data.Article.Blog.NeuerJungfernstieg do
  use Article.Default

  def title(), do: "Neuer Jungfernstieg (Radroute 4)"

  def summary(),
    do:
      "Engere Fahrbahn mit Tempo-25 und KFZ-Einbahnstraße Richtung Gänsemarkt. Radverkehr ausschließlich auf der Fahrbahn. Alter Radweg wird zum Gehweg."

  def type(), do: :planned
  def start(), do: ~d[2024Q3]
  def stop(), do: ~d[2024-12]

  def tags(), do: ["4", "1GR", "FR1"]

  def links(_assigns) do
    [
      {"Lagepläne und Erläuterungen, fertiger Entwurf", "Mai 2024",
       "https://fragdenstaat.de/anfrage/neuer-jungfernstieg/#nachricht-902407"}
    ]
  end

  def map_image do
    Data.MapImage.new(
      __MODULE__,
      [
        {"Bruun & Möllers GmbH & Co.", "https://www.bm-la.de/kontakt"},
        {"Ingenieurpartnerschaft Diercks Schröder", "https://www.ids-hh.de/kontakt/"}
      ],
      {
        %{lat: 53.554621877, lon: 9.990216915},
        %{lat: 53.557846271, lon: 9.992627205},
        %{lat: 53.557476384, lon: 9.994030108},
        %{lat: 53.554251360, lon: 9.991623515}
      }
    )
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf Alsterseite ist ein rund 2,5m breiter Zweirichtungs-<.ref>Hochbordradweg</.ref> vorhanden. Er verläuft neben einem 2,0m breitem Gehweg. Beide sind häufig überlastet. Alternativ steht die 9,0m breite <.ref>Fahrbahn</.ref> im <.ref>Mischverkehr</.ref> bereit.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Radverkehr findet künftig ausschließlich auf der Fahrbahn statt. Der ehemalige Radweg wird dem Gehweg zugeschlagen. KFZ-Parken ist nur noch auf der Häuserseite gestattet, sodass auch auf dem Fahrrad der Blick auf die Alster frei bleibt.</p>

    <p>Die Fahrbahn wird auf 5,0m verkleinert und auf Tempo-25 limitiert. Sie wird größtenteils zu einer KFZ-Einbahnstraße <.v bounds="9.985722,53.552819,9.99446,53.557041" lon={9.991484} lat={53.555256} dir="backward" ref="4" highlight="Gänsemarkt" >Richtung Gänsemarkt</.v>. Zwischen <.v bounds="9.989475,53.553895,9.994126,53.55735" lon={9.991088} lat={53.554506} dir="forward" ref="4">Colonnaden</.v> und <.v bounds="9.989475,53.553895,9.994126,53.55735" lon={9.992136} lat={53.555928} dir="forward" ref="4" highlight="Große Theaterstraße">Großer Theaterstraße</.v> sieht man davon ab – eine Sonderlösung für das Hotel. Die Einfahrt vom <.v bounds="9.988859,53.552621,9.995434,53.556455" lon={9.991505} lat={53.554039} dir="forward" ref="4">Jungfernstieg</.v> ist für KFZ nicht möglich, sodass trotzdem mit wenig KFZ-Verkehr in Richtung Außenalster zu rechnen ist.</p>

    <p>Einmündende Straße werden als Gehwegüberfahrten hergestellt. Dies gibt Fuß- und Radverkehr Vorrang. Auch werden Querungsstellen für den Fußverkehr freigehalten.</p>

    <p>Im Zuge des Umbaus soll auch der <.ref>Radfahrstreifen</.ref> in der <.m bounds="9.988173,53.556584,9.995027,53.55907">Esplanade</.m> bis an die Kreuzung durchgängig hergestellt werden.</p>

    <h4>Meinung</h4>
    <p>Es gibt an der Planung wenig auszusetzen. Es mutet seltsam an, dass man die Fahrbahn in Richtung Lombardsbrücke so breit hält, obwohl hier weder KFZ-Verkehr noch Radverkehr fahren sollen. Das aufgemalte 🚲↱ Piktogramm <.v bounds="9.991774,53.556473,9.994161,53.557551" lon={9.992759} lat={53.556827} dir="forward" ref="4">vorm Hochbordradweg</.v> könnte bei Ortsfremden die geradeaus zur Außenalster wollen zu Verwirrung führen. Die Fläche zu begrünen würde die Führung klarer und den Ort schöner machen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
