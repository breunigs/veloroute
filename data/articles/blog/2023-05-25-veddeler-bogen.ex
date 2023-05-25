defmodule Data.Article.Blog.VeddelerBogen do
  use Article.Default

  def title(), do: "Veddeler Bogen (Veloroute 10)"

  def summary(),
    do:
      "Fahrradstraße im Veddeler Bogen. Radweg nach Süden; Schutzstreifen nach Norden im Niedergeorgswerder Deich."

  def type(), do: :planned

  def tags(), do: ["10", "M12.1B Nord"]

  def start(), do: ~d[2023-08]
  def stop(), do: ~d[2024-05]

  def links(_assigns) do
    [
      {"Ausschreibung Umbau", "Mai 2023",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/7caf74c4-1a20-4c61-8eb9-b6cc84373436"},
      {"Präsentation Veloroute 10 auf Wilhelmsburg", "Mai 2021",
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi//to020.asp?TOLFDNR=1028260"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Teilstück</h4>
    <p>Dieser Bauabschnitt ist ein Teil aus der <.a name="2020-10-10-niedergeorgswerder">Gesamtplanung „Niedergeorgswerder“</.a>.</p>

    <h4>Alter Zustand</h4>
    <p>Es gibt keine durchgehende Radführung. Im <.v bounds="10.017519,53.518453,10.020973,53.520872" lon={10.01889} lat={53.519974} dir="forward" ref="10">Veddeler Bogen</.v> starten bzw. enden die <.ref>Hochbordradwege</.ref> plötzlich. Im <.v bounds="10.017973,53.516964,10.021427,53.519383" lon={10.019408} lat={53.518497} dir="forward" ref="10">Niedergeorgswerder Deich</.v> gibt es nur in Richtung <.v bounds="10.0056,53.493269,10.031549,53.521472" lon={10.023933} lat={53.498046} dir="forward" ref="10">Kirchdorf</.v> einen eigenen Radweg. Ansonsten muss im <.ref>Mischverkehr</.ref> gefahren werden.</p>

    <h4>Planung</h4>
    <p>Der Veddeler Bogen wird eine Fahrradstraße. Der Bordstein zum <.v bounds="10.013634,53.519184,10.020585,53.522495" lon={10.018825} lat={53.520444} dir="backward" ref="10">Ballin Park</.v> hin entfällt und die Veloroute erhält Vorfahrt. Zur Kreuzung mit dem <.v bounds="10.017801,53.518148,10.021501,53.519675" lon={10.019333} lat={53.51893} dir="forward" ref="10">Georgswerder Bogen</.v> hin werden ersichtliche Auf- bzw. Ableitungen der Radwege gebaut.</p>

    <p>Der Niedergeorgswerder Deich erhält <.v bounds="10.018307,53.517301,10.0212,53.519398" lon={10.019441} lat={53.518347} dir="forward" ref="10">Richtung Kirchdorf</.v> einen 2,0m breiten Hochbordradweg. In <.v bounds="10.018307,53.517301,10.0212,53.519398" lon={10.019619} lat={53.518358} dir="backward" ref="10">Richtung Veddel</.v> wird ein 1,5m breiter <.ref>Schutzstreifen</.ref> aufgemalt. Dieser weitet sich an der Kreuzung auf, sodass man vor den KFZ warten kann und von dort auch <.ref>direkt links abbiegen</.ref> kann.</p>

    <p>Ansonsten ist in <.v bounds="10.017801,53.518148,10.021501,53.519675" lon={10.019333} lat={53.51893} dir="forward" ref="10">der Kreuzung</.v> auch meist <.ref>indirektes Linksabbiegen</.ref> über die Hochbordradwege möglich.</p>

    <h4>Meinung</h4>
    <p>Veddeler Bogen – passt. Niedergeorgswerder Deich – was soll das? Ein Schutzstreifen taugt nicht zur Radförderung, da dort messbar enger überholt wird als bei anderen Varianten. Es wird bei einer hohen Geisterradler-Quote auf dem Hochbordradweg bleiben.</p>

    <p>Eine zeitgemäße Planung hätte eine durchgängige Fahrradstraße oder Tempo-30-Zone vorgesehen, mit Durchfahrtssperren für private KFZ (z.B. Höhe <.v bounds="10.011806,53.498729,10.030034,53.522013" lon={10.02701} lat={53.502959} dir="forward" ref="10">Hövelpromenade</.v>). Angesichts von vier ortsnahen Autobahnauffahrten im <.a name="2020-10-10-niedergeorgswerder">gesamten Planungsgebiet</.a> ist diese Alibi-Lösung unverständlich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
