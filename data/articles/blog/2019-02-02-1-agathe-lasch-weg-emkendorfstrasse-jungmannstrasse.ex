defmodule Data.Article.Blog.AgatheLaschWegEmkendorfstrasseJungmannstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-1-agathe-lasch-weg-emkendorfstrasse-jungmannstrasse"
  def created_at(), do: ~D[2019-02-02]

  def title(), do: "Agathe-Lasch-Weg, Emkendorfstraße, Jungmannstraße (Veloroute 1)"

  def start(), do: ~d[2020]

  def type(), do: :intent

  def tags(), do: ["1"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Am 31. Januar 2019 fand <.a href="https://www.hamburg.de/pressemeldungen-bezirke/12074776/veloroute-1-informationsveranstaltung-othmarsch/">eine Infoveranstaltung</.a> statt, die die angedachten Verbesserung für die Veloroute an den Straßen <.m bounds="9.890562,53.552358,9.895955,53.553294">Agathe-Lasch-Weg</.m>, <.m bounds="9.890542,53.55155,9.896828,53.555703">Emkendorfstraße</.m> und <.m bounds="9.882012,53.557393,9.889645,53.557435">Jungmannstraße</.m> vorstellte. Die dazwischenliegende <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.556395, lon: 9.88976, zoom: 17}))}>Reventlowstraße</.m> ist nicht Teil dieser Planungen.</p> <p>Die Kernpunkte dieser sehr frühen Version sind im Wesentlichen:</p> <ul>
    <li>Straße sanieren</li>
    <li>Parkbuchten schaffen und so den ruhenden Verkehr ordnen</li>
    <li>Verkehrsberuhigung durch wechselseitige Hindernisse (Bäume, Parkplätze, Fahrbahnsverschiebung, etc.)</li>
    <li>nach Bedarf engere Einmündungen</li>
    </ul> <p>Für die <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.55285, lon: 9.894541, zoom: 17}))}>Kreuzung Agathe-Lasch-Weg / Emkendorfstraße</.m> konnte keine angenehme Lösung gefunden werden. Hier bleibt es also bei der abknickenden Vorfahrt mit geringer Übersichtlichkeit.</p> <p>Aus dem Publikum gab es Kritik an den wechselseitigen Hindernissen, da diese zwar den Verkehr beruhigen würden, aber eben auch den Radverkehr ausbremsen, der dann ggf. hinter den Autos warten muss. Ebenso wurde angemerkt, das diese Art der Verkehrsführung enges Überholen bzw. Abdrängen des Radverkehrs im Gegenverkehr begünstige. Das Planungsbüro will dies in der Detailplanung berücksichtigen und nochmals andere Maßnahmen der Beruhigung prüfen. Vorgeschlagen wurden etwa eine Einbahnstraßenregelung oder „Anwohner frei“, jeweils mit Freigabe für's Fahrrad. Laut Planer werden diese Lösungen aber regelmäßig von der Polizei abgelehnt.</p> <p>Insgesamt wirkt die Planung durchwachsen: der neue Belag ist natürlich gerne gesehen und das geordnete Parken dürfte auch etwas Übersichtlichkeit schaffen. Die wechselseitigen Hindernisse sind aber klar eine Krücke um KFZ-Schleichverkehr und Rasen zu vermeiden – es ist schade, das sich hier keine besseren Möglichkeiten finden lassen. Das man auch weiterhin an der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.55285, lon: 9.894541, zoom: 17}))}>Kreuzung Agathe-Lasch-Weg / Emkendorfstraße</.m> einen Zwangstop einlegen muss ist wegen des Platzmangels und Busverkehrs zwar verständlich, löst das Problem aber nicht.</p> <p>Die Planung soll nun im Detail erfolgen und die Anregungen so gut es geht berücksichtigen. Start der Baumaßnahme könnte 2020 sein.</p> <p><.a href="https://www.steg-hamburg.de/files/Projekte/Veloroute%201%20Altona/2019-01_Veloroute-Othmarschen_A17_Dokumentation_%C3%BCberarb.pdf">Dokumentation zur Infoveranstaltung</.a></p>
    """
  end
end
