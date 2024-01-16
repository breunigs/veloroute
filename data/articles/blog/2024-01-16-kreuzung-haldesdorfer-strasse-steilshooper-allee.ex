defmodule Data.Article.Blog.KreuzungHaldesdorferStrasseSteilshooperAllee do
  use Article.Default

  def title(),
    do:
      "Kreuzung Haldersdorfer Straße / Steilshooper Allee (Bezirksrouten W2 und W5, Freizeitroute 11)"

  def summary(),
    do:
      "Meist 2,0m breite Hochbordradwege. Größere und barrierefreie Bushaltestelle. Freizeitroute 11 behält 100m Schiebestrecke. Umplanung nötig um Bezirksroute W2 zu ermöglichen."

  def type(), do: :planned

  def tags(), do: ["br-wandsbek-w2", "br-wandsbek-w5", "FR11"]

  def links(_assigns) do
    [
      {"1. Entwurf: Lagepläne und Erläuterungen", "September 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017177"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Kreuzungsbereich sind <.ref>Hochbordradwege</.ref> mit Breiten von 1,0m bis 1,5m vorhanden.</p>

    <h5>Hinweis zum Video Freizeitroute 11</h5>
    <p>Die im Video von 2021 gezeigte Führung wurde mittlerweile angepasst. Sie verläuft nicht mehr durch den <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.090802} lat={53.606585} dir="forward" ref="FR11">Kleingartenverein „Gut-Grün“</.v> sondern länger entlang der <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.091681} lat={53.607031} dir="backward" ref="br-wandsbek-w5">Steilshooper Allee</.v>. Der in der Karte angezeigte Verlauf ist richtig.</p>

    <h4>Planung</h4>
    <p>In der <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.090275} lat={53.607411} dir="forward" ref="br-wandsbek-w5">Steilshooper Allee</.v> sind 2,0m breite Hochbordradwege geplant, die nur in die jeweilige Fahrtrichtung befahren werden dürfen. Sie sollen wieder gepflastert werden. Ausnahme: von Steilshoop kommend soll der Radweg <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.088473} lat={53.60742}dir="backward" ref="br-wandsbek-w5">kurz vor der Kreuzung</.v> als 2,0m breite <.ref>Protected-Bike-Lane</.ref> geführt werden.</p>

    <p>In der bereits umgebauten Haldesdorfer Straße soll <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.089276} lat={53.60736} dir="backward" ref="br-wandsbek-w2" highlight="Haldesdorfer Straße">die Querungsfurt</.v> künftig direkt in den <.ref>Radfahrstreifen</.ref> übergehen. <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.089103} lat={53.606943} dir="forward" ref="br-wandsbek-w2" highlight="Haldesdorfer Straße">Aus der Haldesdorfer Straße kommend</.v> wird man kurz vorher auf den Hochbordradweg aufgeleitet. Rechts abbiegen ist dann ohne an der Ampel zu warten möglich.</p>

    <p>Für die Fahrt entlang der <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.087721} lat={53.607743} dir="forward" ref="FR11">Freizeitroute 11 im Uhrzeigersinn</.v> ist <.ref>indirektes Linksabbiegen</.ref> an der Kreuzung vorgesehen. Man muss also entweder zwei Mal auf Grün warten, oder über die östliche Furt schieben. Da der nördliche Radweg ein Einrichtungsradweg bleibt, beginnt die Schiebestrecke bereits am <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.088165} lat={53.60763} dir="forward" ref="FR11">Ende der Grünfläche</.v>. Die Fahrt <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.089358} lat={53.607493} dir="backward" ref="FR11">gegen den Uhrzeigersinn</.v> ist dagegen ohne Absteigen möglich.</p>

    <p>Die Radwege verlaufen stets rechts der Wartefläche für Fahrgäste. Auf <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.089925} lat={53.607247} dir="backward" ref="br-wandsbek-w5">der Südseite</.v> verläuft er damit zwischen Wartefläche und Gehweg. Ein Zaun zwischen Wartefläche und Radweg soll dafür sorgen, dass der Radweg nur an dafür vorgesehenen Stellen gequert wird. Auf <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.090216} lat={53.607413} dir="forward" ref="br-wandsbek-w5">der Nordseite</.v> werden Rad- und Gehweg getauscht. Zu Fuß muss der Radweg damit zwei Mal gequert werden, wenn man nicht zum Bus will.</p>

    <p>Die vorgeschlagene <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.089283} lat={53.607183} dir="forward" ref="br-wandsbek-w2">Führung der Bezirksroute W2</.v> wurde erst nach dieser Planung festgelegt. Sie ist daher noch nicht berücksichtigt.</p>

    <p>Die Bushaltestellen werden vergrößert und barrierefrei. In Richtung Steilshoop ist dazu auch ein <.v bounds="10.085991,53.605429,10.096415,53.608972" lon={10.091209} lat={53.60729} dir="forward" ref="br-wandsbek-w5">kurzes Stück Busspur</.v> geplant.</p>

    <p>Von 26 zu fällenden Bäumen kann nur einer ortsnah ersetzt werden.</p>

    <h4>Meinung</h4>
    <p>Leider setzt man wieder auf schnell uneben werdendes Pflaster, statt die Radwege zu asphaltieren.</p>

    <p>Man ist bemüht den Rad- und Fußverkehr zu entflechten, was mit der vorliegenden Planung teilweise gelingen dürfte. Allerdings hat man die Führung der Freizeitroute 11 im Uhrzeigersinn ignoriert und erwartet, dass 100m geschoben wird. Das indirekte Linksabbiegen an der Kreuzung mit zwei Rotphasen ist ebenfalls unattraktiv. Man kann also davon ausgehen, dass auf der Nordseite weiter gegen die Fahrtrichtung geradelt wird.</p>

    <p>Um die <.a name="br-wandsbek-w2">Bezirksroute W2</.a> zu ermöglichen, muss die Planung angepasst werden. Es bietet sich dann an, auf der Nordseite einen Zweirichtungsradweg zu schaffen. Dies dürfte im Hinblick auf den Grünbestand und die Beschleunigung des Busverkehrs durch eine Busspur aber knifflig werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
