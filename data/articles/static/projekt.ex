defmodule Data.Article.Static.Projekt do
  use Article.Static

  def title(), do: "Projekt"

  def tags(), do: []

  def languages(), do: ~w[de en]

  defp with_stats(assigns) do
    assign(assigns, %{
      distance: Statistics.visible_video_distance_km(),
      duration: Statistics.visible_video_duration_h()
    })
  end

  def text(%{lang: "en"} = assigns) do
    assigns = with_stats(assigns)

    ~H"""
    <p lang="en">The aim is to show newcomers decent bicycle routes in Hamburg, so that they can try this nice mode of transport – and maybe stick with it. The in-depth articles are meant for interested people and to provide a basis for discussion.</p>

    <h4 lang="en">Helping</h4>
    <ul>
      <li>report (completed) constructions</li>
      <li>Improve the <.a href="https://learnosm.org/en/beginner/">OpenStreetMap</.a></li>
    </ul>

    <h4 lang="en">History</h4>
    <p lang="en">When the project started in 2018, an in-depth search was needed to find the “Veloroutes”. By now, the city presents the routes much better on <.a href="https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/mit-dem-fahrrad-durch-hamburg" lang="de">fahrrad.hamburg</.a>. Detailed information still needs to be collected from various departments and agencies. Therefore, and also out of personal interest, I document planned construction and construction sites as they are published.</p>

    <h4 lang="en">Statistics</h4>
    <p lang="en">Currently the site allows you to watch approximately <%= @duration %> hours of video, covering a distance of <%= @distance %> km. This statistic is counted per direction, i.e. the same road filmed in two directions is counted twice. When multiple routes share a segment, that segment is also counted multiple times.</p>

    <h4 lang="en">Camera</h4>
    <p lang="en">The video recordings are done with an off-the-shelf action camera attached to the handlebar. The built-in image stabilization and horizon lock are sufficient to achieve a smooth camera ride. Note that it still requires bright daylight, which is why the recordings in tunnels are so blurry. The camera should have built-in GPS. While recording GPS-tracks externally with a phone is possible, it means more effort in post processing.</p>

    <h5 lang="en">Tips for your own recordings</h5>
    <ul lang="en">
      <li>straight on – up to 25 km/h. Turning – up to 15 km/h. Bicycle barriers, tight turns, etc. – 1 km/h. With a 5x time lapse the video remains comprehensible without being boring.</li>
      <li>Know the route well. Combining two videos works best on straight sections when the recordings overlap a bit, or when standing on the same spot (e.g. traffic light). Conversely, you always need to make the correct turn at intersections or re-record the entire intersection. Best not to lose your way in the first place.</li>
      <li>Camera batteries last around an hour. To avoid annoying battery swapping, charge using an external USB-battery while cycling. 10&#8239;000 mAh are suitable even for day trips. With “battery cover &lt;camera model&gt;” you can find after-market equipment if you don't want to tinker.</li>
      <li>Best weather: dry, bright and overcast. If you notice singular rain drops, regularly wipe or check the lens. Direct sun and the resulting hard-edged shadows lead to a noisier recording. Additionally, current camera technology has issues capturing the large differences in contrast.</li>
      <li>Camera position: higher means clearer view. Lower means more action. Check beforehand if bicycle parts protrude into the image. With racing bike handlebars, that can be the gear lever while switching gears when turning. Vibrations (“cobblestone”) might misalign the camera mount. Tighten screws well, use rubber bands or assembly paste to improve stability.</li>
      <li>Settings: stabilization on, horizon lock on, GPS on, use on-camera time lapse instead of in post-processing (if desired), wide recording angle (buy a fish eye lense if need be). Avoid operating errors by removing unnecessary buttons, recording profiles, etc. and enable the screen lock.</li>
    </ul>

    <h4 lang="en">Technology and licenses</h4>
    <p lang="en">The site itself is available under a <.a href="https://github.com/breunigs/veloroute">permissive open source license on Github</.a>. However, source code and site data are not separated. If there's interest in just the code, I am sure something can be arranged – <.mailto>write an email</.mailto> or create a ticket on Github.</p>

    <p lang="en">The videos are provided by veloroute.hamburg and are “<.a href="https://de.wikipedia.org/wiki/Gemeinfreiheit" lang="de">gemeinfrei</.a>”, which is similar to the “public domain” concept or <.a href="https://creativecommons.org/publicdomain/zero/1.0/">Creative Commons Zero license</.a>. While I am happy to be credited/attributed, it is not required.</p>

    <p>Map data is provided by <.a href="https://www.openstreetmap.org">OpenStreetMap</.a> (<.a href="https://www.openstreetmap.org/copyright">ODbL license</.a>). The shown bicycle routes are maintained separately for the site and are <span lang="de">gemeinfrei</span>/public domain/creative commons zero, just like the videos.</p>
    """
  end

  def text(assigns) do
    assigns = with_stats(assigns)

    ~H"""
    <p>Ziel des Projekts ist es Neulingen gute Fahrradstrecken in Hamburg aufzuzeigen, damit alle dieses tolle Verkehrsmittel ausprobieren können – und vielleicht auch dabei bleiben. Die tiefergehenden Informationen sind für Interessierte und um inhaltlicher Diskussion eine Basis zu bieten.</p>

    <h4>Helfen</h4>
    <ul>
      <li>Melde (abgeschlossene) Umbauten</li>
      <li>Verbessere die <.a href="https://learnosm.org/de/beginner/">OpenStreetMap</.a></li>
    </ul>

    <h4>Hintergrund</h4>
    <p>Als das Projekt 2018 begann, musste man schon sehr genau suchen um die Velorouten zu finden. Mittlerweile stellt die Stadt die Velorouten auf <.a href="https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/mit-dem-fahrrad-durch-hamburg">fahrrad.hamburg</.a> deutlich besser dar, detaillierte Informationen muss man aber nach wie vor bei den einzelnen Behörden und Ämtern abgrasen. Auch aus persönlichem Interesse dokumentiere ich daher Bauvorhaben oder Baustellen, so sie bekannt gemacht werden.</p>

    <h4>Statistiken</h4>
    <p>Die momentan auf der Seite ansehbaren Videos dauern zusammen rund <%= @duration %> Stunden und decken ca. <%= @distance %> km Strecke ab. Die Statistik zählt pro Fahrtrichtung, d.h. ein 1 km langer Radweg, der in beide Richtungen befahren wurde, geht hier als 2 km ein. Wenn mehrere Routen sich einen Abschnitt teilen, wird dieser auch mehrfach gezählt, d.h. Überlappungen werden nicht herausgerechnet.</p>

    <h4>Kamera</h4>
    <p>Die Videoaufnahmen werden mit einer handelsüblichen am Lenker befestigten Action-Kamera gemacht. Die in den modernen Modellen eingebaute Bildstabilisierung mit Horizontausgleich ist ausreichend um die ruhige Kamerafahrt zu erreichen. Allerdings benötigt die Technik noch Tageslicht, weswegen die Aufnahmen in Tunnels so verwackelt sind. Die Kamera sollte eingebautes GPS haben. GPS-Spuren extern mit dem Handy aufzeichnen geht zwar auch, ist aber viel mehr Aufwand in der Nachbereitung.</p>

    <h5>Tipps für die eigene Aufnahme</h5>
    <ul>
      <li>Geradeaus – bis 25 km/h. Abbiegen – bis 15 km/h. Durch Drängelgitter, enge Kurven, usw. – 1 km/h. Mit 5x Zeitraffer bleibt das Video verständlich ohne langweilig zu werden.</li>
      <li>Route gut kennen. Videos zusammenschneiden geht gut auf geraden Strecken wenn sich die Aufnahmen überlappen, oder wenn man an der gleichen Stelle steht (z.B. Ampel). Im Umkehrschluss: man muss auf der Kreuzung immer richtig abbiegen, oder den Abbiegevorgang nochmal komplett neu aufnehmen. Daher besser erst gar nicht verfahren.</li>
      <li>Kamera-Akkus halten rund eine Stunde. Um nervige Akku-Wechsel zu vermeiden mit einem externen USB-Akku während der Fahrt laden. 10&#8239;000 mAh reichen auch für Tagestouren. Mit „Batteriedeckel Loch &lt;Kamera Modell&gt;“ findet man Nachrüstsätze wenn man nicht selbst basteln mag.</li>
      <li>Bestes Wetter: trocken, hell, durchgängig bewölkt. Wenn man einzelne Tropfen wahrnimmt regelmäßig die Linse kontrollieren/abwischen. Sonne erzeugt durch sichtbaren Schattenwurf ein unruhigeres Bild. Auch haben aktuelle Kameras Probleme die Helligkeitsunterschiede gut einzufangen (Überblenden/Absaufen).</li>
      <li>Kamera Position: je höher, desto übersichtlicher. Je niedriger, desto mehr Action. Vorher prüfen ob Fahrradteile ins Bild ragen. Bei Rennradlenkern können das die Schalthebel während des Schaltens in der Kurve sein. Durch Vibration („Kopfsteinpflaster“) kann sich die Halterung verstellen. Schrauben gut anziehen, mit Gummis oder Montagepaste für sicheren Halt sorgen.</li>
      <li>Einstellungen: Bildstabilisierung an, Horizontausgleich an, GPS an, Zeitraffer in der Kamera statt in der Nachbearbeitung (sofern gewünscht), großer Aufnahmewinkel (ggf. Fischaugenlinse nachkaufen). Fehlbedienung vermeiden: unnötige Buttons, Profile, etc. vor der Fahrt entfernen und die Bildschirmsperre aktivieren.</li>
    </ul>

    <h4>Technik und Lizenzen</h4>
    <p>Die Seite selbst steht unter einer <.a href="https://github.com/breunigs/veloroute">freien Lizenz auf Github</.a>. Technik und Daten sind nicht ordentlich getrennt um mir Arbeit zu sparen. Bei Interesse an der reinen Technik lässt sich das bestimmt ändern – <.mailto>schreib mir</.mailto> oder erstelle ein Ticket auf Github.</p>

    <p>Die Videos werden von veloroute.hamburg bereitgestellt und sind <.a href="https://de.wikipedia.org/wiki/Gemeinfreiheit">gemeinfrei</.a>. Ich freue mich natürlich über Namensnennung, auch wenn diese nicht notwendig ist.</p>

    <p>Die Kartendaten stammen aus der <.a href="https://www.openstreetmap.org">OpenStreetMap</.a> (<.a href="https://www.openstreetmap.org/copyright">ODbL lizenziert</.a>). Die auf der Seite angezeigten Routen werden getrennt speziell für die Seite verwaltet und sind <.a href="https://de.wikipedia.org/wiki/Gemeinfreiheit">gemeinfrei</.a>.</p>

    """
  end
end
