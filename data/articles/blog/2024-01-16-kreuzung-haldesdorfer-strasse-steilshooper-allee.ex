defmodule Data.Article.Blog.KreuzungHaldesdorferStrasseSteilshooperAllee do
  use Article.Default

  def updated_at(), do: ~D[2024-04-19]

  def title(),
    do:
      "Kreuzung Haldesdorfer Straße / Steilshooper Allee (Bezirksrouten W2 und W5, Freizeitroute 11)"

  def summary(),
    do:
      "Meist 2,0m breite Hochbordradwege. Größere und barrierefreie Bushaltestelle. Freizeitroute 11 behält 100m Schiebestrecke."

  def type(), do: :planned
  def start(), do: ~d[2026Q2]

  def tags(), do: ["br-wandsbek-w2", "br-wandsbek-w5", "FR11"]

  def links(_assigns) do
    [
      {"fertiger Entwurf: Lagepläne nud Erläuterungen", "April 2024",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1020763"},
      {"1. Entwurf: Lagepläne und Erläuterungen", "September 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017177"}
    ]
  end

  def map_image do
    Data.MapImage.new(
      __MODULE__,
      {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
      {
        %{lat: 53.607812022, lon: 10.087428552},
        %{lat: 53.607343328, lon: 10.091804023},
        %{lat: 53.606690322, lon: 10.091605088},
        %{lat: 53.607158913, lon: 10.087229986}
      }
    )
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Kreuzungsbereich sind <.ref>Hochbordradwege</.ref> mit Breiten von 1,0m bis 1,5m vorhanden.</p>

    <.h4_planning checked={@show_map_image}/>
    <p>In der <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.090275} lat={53.607411} dir="forward" ref="br-wandsbek-w5">Steilshooper Allee</.v> sind 2,0m breite Hochbordradwege geplant, die nur in die jeweilige Fahrtrichtung befahren werden dürfen. Sie sollen wieder gepflastert werden. Ausnahme: von Steilshoop kommend soll der Radweg <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.088473} lat={53.60742}dir="backward" ref="br-wandsbek-w5">kurz vor der Kreuzung</.v> als 2,5m breiter <.ref>Kopenhagener Radweg</.ref> geführt werden.</p>

    <p>In der bereits umgebauten Haldesdorfer Straße soll <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.089276} lat={53.60736} dir="backward" ref="br-wandsbek-w2" highlight="Haldesdorfer Straße">die Querungsfurt</.v> künftig direkt in den <.ref>Radfahrstreifen</.ref> übergehen. <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.089103} lat={53.606943} dir="forward" ref="br-wandsbek-w2" highlight="Haldesdorfer Straße">Aus der Haldesdorfer Straße kommend</.v> wird man kurz vorher auf den Hochbordradweg aufgeleitet. Rechts abbiegen ist dann ohne an der Ampel zu warten möglich.</p>

    <p>Für die Fahrt entlang der <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.087721} lat={53.607743} dir="forward" ref="FR11">Freizeitroute 11 im Uhrzeigersinn</.v> ist <.ref>indirektes Linksabbiegen</.ref> an der Kreuzung vorgesehen. Man muss also entweder zwei Mal auf Grün warten, oder über die östliche Furt schieben. Da der nördliche Radweg ein Einrichtungsradweg bleibt, beginnt die Schiebestrecke bereits am <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.088165} lat={53.60763} dir="forward" ref="FR11">Ende der Grünfläche</.v>. Die Fahrt <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.089358} lat={53.607493} dir="backward" ref="FR11">gegen den Uhrzeigersinn</.v> ist dagegen ohne Absteigen möglich.</p>

    <p>Die Radwege verlaufen stets rechts der Wartefläche für Fahrgäste. Auf <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.089925} lat={53.607247} dir="backward" ref="br-wandsbek-w5">der Südseite</.v> verläuft er damit zwischen Wartefläche und Gehweg. Auf <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.090216} lat={53.607413} dir="forward" ref="br-wandsbek-w5">der Nordseite</.v> werden Rad- und Gehweg getauscht. Zu Fuß muss der Radweg damit zwei Mal gequert werden, wenn man nicht zum Bus will.</p>

    <p>Die vorgeschlagene <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.089283} lat={53.607183} dir="forward" ref="br-wandsbek-w2">Führung der Bezirksroute W2</.v> wurde erst nach Beginn dieser Planung festgelegt. Sie ist daher nicht berücksichtigt.</p>

    <p>Die Bushaltestellen werden vergrößert und barrierefrei. In Richtung Steilshoop ist dazu auch ein <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.091209} lat={53.60729} dir="forward" ref="br-wandsbek-w5">kurzes Stück Busspur</.v> geplant.</p>

    <h4>Meinung</h4>
    <p>Leider setzt man wieder auf schnell uneben werdendes Pflaster, statt die Radwege zu asphaltieren.</p>

    <p>Man ist bemüht den Rad- und Fußverkehr zu entflechten, was mit der vorliegenden Planung nur teilweise gelingen dürfte. Die Führung der Freizeitroute 11 im Uhrzeigersinn wurde ignoriert und es wird erwartet, dass 100m geschoben wird. Das indirekte Linksabbiegen an der Kreuzung mit zwei Rotphasen ist ebenfalls unattraktiv. Man kann also davon ausgehen, dass auf der Nordseite weiter gegen die Fahrtrichtung geradelt wird.</p>

    <p>Die vorgeschlagene Führung der <.a name="br-wandsbek-w2">Bezirksroute W2</.a> lässt sich mit diesem Umbau nicht mehr umsetzen. Sie muss wahrscheinlich verlegt werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
