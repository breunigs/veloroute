defmodule Data.Article.Blog.KuehnstrasseAbJenfelderAllee do
  use Article.Default

  def created_at(), do: ~D[2022-04-15]
  def updated_at(), do: ~D[2022-09-20]

  def title(), do: "Kuehnstraße ab Jenfelder Allee (Alltagsroute 7)"

  def summary(),
    do:
      "1,85m breite Radfahrstreifen. Umbau nur möglich, wenn die Kreuzung mit der Jenfelder Allee ebenfalls mit angepasst wird."

  def type(), do: :planned
  def start(), do: ~d[2024]
  def stop(), do: ~d[2025]

  def tags(), do: ["7", "w25"]

  def links(_assigns) do
    [
      {"Problematik Kreuzung Jenfelder Allee", "September 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017324"},
      {"Pläne und Erläuterungen", "September 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1017326"},
      {"Möglicher Bautermin", "April 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1016643"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In diesem Abschnitt der Kuehnstraße gibt es keine eigenen Radwege. Der Radverkehr teilt sich im <.ref>Mischverkehr</.ref> die Fahrbahn mit den KFZ. An der Kreuzung mit der <.v bounds="10.125769,53.581522,10.12832,53.583135" lon={10.127042} lat={53.582407} dir="forward" ref="7">Jenfelder Allee</.v> gibt es noch alte <.ref>Hochbordradwege</.ref>, die je nach Richtung schwer zu erreichen bzw. zu verlassen sind. Die Kreuzung mit der <.v bounds="10.131371,53.583898,10.135139,53.585823" lon={10.132449} lat={53.584436} dir="forward" ref="7">Wilsonstraße</.v> wurde vor einigen Jahren umgebaut und bietet Radwegstummel zum <.ref>indirekten Linksabbiegen</.ref>.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen beidseitig rund 1,85m breite <.ref>Radfahrstreifen</.ref> einzurichten. Die Einmündung <.v bounds="10.129781,53.583744,10.132448,53.584673" lon={10.131055} lat={53.584248} dir="backward" ref="7">Wöschenhof</.v> soll zu einer Gehwegüberfahrt umgebaut werden. Die Gehwege werden gepflastert. Auf der Südseite sollen dazu Grundstücke gekauft werden, um die Mindestbreiten zu erreichen. Bei Fahrradanlehnbügeln und Stellplätzen für Lastenräder setzt man niedrige Bordsteine ein.</p>

    <h5>Anschluss Jenfelder Allee</h5>
    <p>Aus der Innenstadt kommend wird der schmale <.ref>Hochbordradweg</.ref> als Übergangslösung auf den Radfahrstreifen abgeleitet. Die Fahrbahn verengt sich hier von zwei auf eine Fahrspur. In der Gegenrichtung endet der Radfahrstreifen in der kombinierten Geradeaus- und Rechtsabbiegerspur.</p>

    <p>Dies wird als nicht verkehrssicher angesehen, sodass die Kreuzung mit der <.v bounds="10.126022,53.581484,10.127903,53.583278" lon={10.126946} lat={53.58255} dir="backward" ref="7">Jenfelder Allee</.v> ebenfalls mit umgebaut werden muss. Ursprünglich war vorgesehen die gesamte Jenfelder Allee zu erneuern, was aber auf unbestimmte Zeit verschoben wurde. Stattdessen soll die Kreuzung getrennt geplant und umgebaut werden – nur wenn das gelingt, kann der beschriebene Umbau der Kuehnstraße erfolgen.</p>

    <h4>Meinung</h4>
    <p>Man führt die Buslinien und das hohe KFZ Aufkommen an, um nicht am Status Quo rütteln zu müssen. Trotz Grundstückzukauf und Baumfällungen auf der Südseite bleiben dem Radverkehr nur unzeitgemäße Breiten, noch dazu ohne Trennung vom KFZ Verkehr. Mindestens die Bauweise „<.ref>Kopenhagener Radweg</.ref>“ sollte geprüft werden. Eine bessere Lösung erfordert weiträumige Planungen um die KFZ von der Veloroute wegzulenken. Besser als vorher ist es aber allemal.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
