defmodule Data.Article.Blog.KreuzungSpanischeFurtHolsteinerChaussee do
  use Article.Default

  def title(), do: "Kreuzung Spanische Furt mit Holsteiner Chaussee (Alltagsroute 14)"

  def summary(),
    do:
      "Radverkehr und Fahrgastbereich der Bushaltestellen werden entzerrt. Nach Norden Radweg rechts des Bushalts, nach Süden zwischen wartendem Bus und KFZ-Fahrbahn."

  def start(), do: ~d[2024]
  def stop(), do: ~d[2024]

  def type(), do: :planned
  def tags(), do: ["14"]

  def links(assigns) do
    [
      {"Plan", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/692616/2c542c265b1b7626fd259cda430dbd55/veloroute-14-spanische-furt-kreuzung-holsteiner-chaussee-abgestimmte-planung-plan-data.pdf"},
      {"Bericht", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/692614/87f1938ead8793dfa9af25b47bd513a3/veloroute-14-spanische-furt-kreuzung-holsteiner-chaussee-abgestimmte-planung-bericht-data.pdf"},
      ~H{Siehe auch: <.a name="2020-02-01-spanische-furt-heidlohstrasse">ältere, verworfene Planungen</.a>}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang der Veloroute gibt es keine eigenen Radwege, es wird im <.ref>Mischverkehr</.ref> gefahren. Entlang der Holsteiner Chaussee sind <.ref>Hochbordradwege</.ref> vorhanden.</p>

    <h4>Planung</h4>
    <p>In der <.v bounds="9.906835,53.622021,9.910894,53.623961" lon={9.909415} lat={53.623045} dir="backward" ref="14" highlight="Spanische Furt">Spanischen Furt</.v> wird ein <.ref>ARAS</.ref> aufgemalt, sodass man sich vorm KFZ Verkehr an der Ampel aufstellen kann.</p>

    <p>In der <.v bounds="9.906835,53.622021,9.910894,53.623961" lon={9.909053} lat={53.622978} dir="backward" ref="14">Holsteiner Chaussee</.v> werden die Hochbordradwege vor der Ampel jeweils zur <.ref>Protected-Bike-Lane</.ref>. Beide sollen rund 2,0m breit werden. Linksabbiegen auf die Veloroute ist nur <.ref>indirekt</.ref> vorgesehen.</p>

    <p>In Richtung Süden wird der Radverkehr links an wartenden Bussen vorbeigeführt. Eine Trennung vom KFZ-Verkehr gibt es hier nicht.</p>

    <p>In Richtung Norden wird die Bushaltestelle hinter die Ampel verlegt. Der Radverkehr wird rechts der Bushaltestelle geführt. D.h. die Fahrgäste warten links des Radwegs und steigen dort auch ein/aus. Für die Busse, die durch die Spanische Furt fahren, wird dort eine weitere Haltestelle gebaut. Der Radverkehr kann an haltenden Bussen nur über die Gegenspur vorbeifahren.</p>

    <h4>Meinung</h4>
    <p>Die Radwege vom Fahrgastbereich zu trennen ist gut. In Richtung Norden ist dies auch gelungen, indem man den Bus direkt auf der KFZ-Spur halten lässt, statt in einer Busbucht. In Richtung Süden hat das leider nicht geklappt – warum erschließt sich mir nicht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
