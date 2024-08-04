defmodule Data.Article.Blog.Jungfernstieg do
  use Article.Default

  def created_at(), do: ~D[2022-05-18]

  def title(), do: "Jungfernstieg (Alltagsrouten 3 und 4)"

  def summary(),
    do: "Fahrbahn enger, Mischverkehr bleibt, extra Baumreihe. Mehr Maßnahmen gegen Falschfahrer."

  def start(), do: ~d[2024-03-04]
  def stop(), do: ~d[2025-04-11]
  def construction_site_id_hh(), do: [642_126]

  def type(), do: :construction

  def tags(), do: ["3", "4"]

  def links(_assigns) do
    [
      {"Pressemitteilung zum Umbaustart", "Februar 2024",
       "https://web.archive.org/web/20240320035836/https://www.hamburg.de/bvm/medien/18282764/2024-02-29-bvm-jungfernstieg/"},
      {"Baustelleninfo", "Februar 2024",
       "https://lsbg.hamburg.de/resource/blob/783412/c5c25367e99ea1b5bc9c12479b8d68d3/jungfernstieg-umbau-februar-2024-data.pdf"},
      {"Ausschreibung Umbau", "Oktober 2023",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/a71ec5ea-3fee-4417-bec1-f7c9aa44bfce"},
      {"Projektseite des LSBG", "https://lsbg.hamburg.de/jungfernstieg"},
      {"Lageplan", "2. Entwurf, Dezember 2022",
       "https://lsbg.hamburg.de/resource/blob/783406/909a747db313331284547e8542aa0712/jungfernstieg-phase-2-abgestimmte-planung-plan-data.pdf"},
      {"Erläuterungsbericht", "2. Entwurf, Dezember 2022",
       "https://lsbg.hamburg.de/resource/blob/783404/2be5875a027a2b435af90702274c63fa/jungfernstieg-phase-2-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan", "1. Entwurf, Mai 2022",
       "https://lsbg.hamburg.de/resource/blob/783410/242b11d53d376a0c975bbd3a7d005a38/jungfernstieg-phase-2-abstimmungsunterlage-plan-data.pdf"},
      {"Erläuterungsbericht", "1. Entwurf, Mai 2022",
       "https://lsbg.hamburg.de/resource/blob/783408/04b45a21dcc4e901e3dfebf3c396bb0a/jungfernstieg-phase-2-abstimmungsunterlage-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Beteiligungsverfahren</h4>
    <p>Die Stadt lädt dazu ein bis zum 26.06.2022 Feedback zum Entwurf zu geben: <.a href="https://beteiligung.hamburg/jungfernstieg/#/projectinfo">Beteiligungsverfahren Jungfernstieg</.a>.</p>

    <h4>Alter Zustand</h4>
    <p>Der Radverkehr fährt mit den motorisierten Fahrzeugen im <.ref>Mischverkehr</.ref>. Zugelassen sind Busse und Taxen, sowie Lieferverkehr in den Nebenzeiten. Diese Regelung wird häufig missachtet, sodass weiterhin private KFZ den Jungfernstieg belasten.</p>

    <h4>Planung</h4>
    <p>Die Promenade auf der Wasserseite soll verbreitert und um eine Baumreihe ergänzt werden. Die <.ref>Fahrbahn</.ref> wird mit 3,50m je Richtung deutlich schmaler als heute. Die momentan aufgestellten Pflanzkübel werden durch eine gewöhnlichere Mittelinsel ersetzt, die zu Fuß weiterhin leichtes Queren der Straße erlauben soll. Im Bereich der Bushaltestellen entfällt die Mittelinsel, damit sich Bus- und Radverkehr überholen können.</p>

    <p>Auf der Gebäudeseite bleibt der heutige Randstein im Wesentlichen erhalten. Die Einmündungen von <.v bounds="9.990175,53.553377,9.993081,53.554486" lon={9.991446} lat={53.55392} dir="backward" ref="4">Große Bleichen</.v> und <.v bounds="9.991988,53.552346,9.995461,53.553675" lon={9.992989} lat={53.552935} dir="backward" ref="4">Neuer Wall</.v> werden als Gehwegüberfahrten gestaltet, damit man zu Fuß Vorrang hat. Poller sollen das KFZ-Durchfahrtsverbot außerhalb der Lieferzeiten sicherstellen. Linksabbiegen aus dem Neuen Wall bleibt nur noch für den Radverkehr möglich.</p>

    <p>Im Jungfernstieg ist Tempo 30 vorgesehen.</p>

    <p>Aus der Straße <.v bounds="9.989586,53.553871,9.993511,53.555314" lon={9.99103} lat={53.554704} dir="backward" ref="4">Neuer Jungfernstieg</.v> dürfen KFZ künftig nur noch rechts abbiegen. Es ist außerdem vorgesehen dort eine Tempo-20-Zone und eine KFZ-Einbahnstraße Richtung Süden einzurichten. Die Details dazu werden von einem anderen Amt erarbeitet und die Planung zum Jungfernstieg greift diese Vorschläge nur auf. Die Pläne zum Neuen Jungfernstieg sind noch nicht bekannt.</p>

    <p>Am <.v bounds="9.993117,53.551624,9.995346,53.552726" lon={9.994928} lat={53.552167} dir="backward" ref="6">Ballindamm</.v> werden die KFZ-Abbiegebeziehungen für KFZ ebenfalls eingeschränkt, um den KFZ-Durchgangsverkehr bestmöglich zu reduzieren.</p>

    <p>Gebaut wird zunächst an Kabeln und Leitungen im Boden. Im Anschluss sollen der Umbau von Jungfernstieg und Neuer Jungfernstieg aufeinander abgestimmt werden.</p>

    <h4>Meinung</h4>
    <p>Die Vergrößerung der Promenade ist gut. Das man mit Automatikpollern das KFZ-Verbot in den Nebenstraßen durchsetzen will ebenfalls. Die Abbiegeverbote an den Einmündungen werden zwar deutlicher, können renitente Autofahrende aber nicht heraushalten.</p>

    <p>Die fehlende Trennung von Rad und KFZ/Bus ist schade, aber nachvollziehbar. In jeder Variante kreuzen sich die Wege von Rad und Bus. Daher entschied man sich für diejenige, die dem Fußverkehr gutes Queren ermöglicht. Angesichts des hohen Fußaufkommens mehr als gerechtfertigt.</p>

    <p>Die „Vorbeifahrstellen“ im Bereich der Bushaltestellen sind einerseits gut, weil man nicht hinter einem haltenden Bus warten muss. Andererseits erlauben sie Bussen das spontane Ausfahren und KFZ das Überholen. Je nach genauer Situation kann sich das unangenehm anfühlen.</p>

    <p>Insgesamt ist dieser erste Entwurf durchdacht und erzielt für den Radverkehr ein brauchbares Ergebnis. Es ist zu erwarten das in einem zweiten Entwurf Details verbessert werden.</p>


    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
