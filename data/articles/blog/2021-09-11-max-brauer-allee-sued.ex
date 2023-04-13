defmodule Data.Article.Blog.MaxBrauerAlleeSued do
  use Article.Default

  def created_at(), do: ~D[2021-09-11]
  def updated_at(), do: ~D[2022-07-17]

  def title(), do: "Max-Brauer-Allee Süd (Velorouten 1 und 12)"

  def summary(),
    do:
      "Durchgängige, mindestens 2m breite Radfahrstreifen, wo möglich durch Bordsteine vom KFZ-Verkehr getrennt. Führung zum Altonaer Balkon endlich verständlich. Bau frühestens 2023."

  def start(), do: ~d[2023Q3]
  def stop(), do: ~d[2025Q1]
  def type(), do: :planned

  def tags(), do: ["1", "12"]

  def links(_assigns) do
    [
      {"Projektseite des LSBG", "https://lsbg.hamburg.de/max-brauer-allee"},
      {"Lageplan", "Juli 2022",
       "https://lsbg.hamburg.de/resource/blob/634708/8ef3ae7af9ba39b71791a2bd31b10b09/veloroute-12-max-brauer-allee-palmaille-bis-paul-nevermann-platz-abgestimmte-planung-plaene-data.pdf"},
      {"Erläuterungsbericht", "Juli 2022",
       "https://lsbg.hamburg.de/resource/blob/634706/3db31879a15c1013be5c256c31d25c9c/veloroute-12-max-brauer-allee-palmaille-bis-paul-nevermann-platz-abgestimmte-planung-bericht-data.pdf"},
      {"erster Entwurf im Transparenz Portal", "veraltet, September 2021",
       "https://suche.transparenz.hamburg.de/dataset/veloroute-12-max-brauer-allee-zwischen-palmaille-und-paul-nevermann-platz"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Juli 2022</h4>
    <p>Der fertige Entwurf wurde veröffentlicht und der Artikel entsprechend angepasst. Im Vergleich zum ersten Entwurf wurde im Wesentlichen nur die Führung Richtung <.m bounds="9.932798,53.545513,9.936585,53.546578">Kaistraße</.m> geändert:</p>
    <ul>
      <li>Ab der Königstraße wird ein <.ref>Hochbordradweg</.ref> statt einem ungeschützten Radfahrstreifen geplant</li>
      <li>Man verwirft den <.ref>Radfahrstreifen in Mittellage</.ref> in der Palmaille als zweite Abbiegemöglichkeit. Aus der Max-Brauer-Allee kommend soll der Radverkehr über den KFZ-Parkplatz südlich des Rathauses weiterfahren. Für Radverkehr aus der Palmaille wird <.ref>indirektes Linksabbiegen</.ref> ermöglicht.</li>
    </ul>

    <h4>Alter Zustand</h4>
    <p>Im Verlauf der Veloroute sind teilweise <.ref>Hochbordradwege</.ref> vorhanden, die alle eher schmal sind. Ihre Oberflächen sind unterschiedlich und stellenweise sehr uneben. In der Max-Brauer-Allee selbst gibt es im Bereich der Veloroute gar keine eigenen Radwege.</p>
    <p>Bei den anderen Strecken im Planungsgebiet sieht es ähnlich aus. Zusätzlich ist die Führung je nach Ziel unklar, sodass man gute Ortskenntnisse braucht um sich nicht zu verfahren.</p>

    <h4>Planung</h4>
    <p>Die genaue Ausführung unterscheidet sich je nach Straße und Fahrtrichtung. Kurz gefasst sind alle Radwege mindestens 2,0m breit und wo möglich physisch vom Autoverkehr getrennt. An den Kreuzungen bleiben die Radwege rechts der KFZ-Spuren, Links abgebogen werden kann <.ref>indirekt</.ref>. Der Platz für die Radwege wird hauptsächlich durch eine Umwandlung einer KFZ-Spur gewonnen. Die alten Radwege werden zu Fußwegen, die dadurch ebenfalls breiter werden. Zusätzlich werden noch zahlreiche Radanlehnbügel installiert.</p>

    <h5>Max-Brauer-Allee Fahrtrichtung Nord</h5>
    <p>Ab der <.m bounds="9.935003,53.545947,9.937346,53.546786">Palmaille</.m> beginnt ein 2,0m breiter <.ref>Radfahrstreifen</.ref>, der ab der <.m bounds="9.935382,53.546967,9.9373,53.54763">Alten Königstraße</.m> durch Bordsteine von den KFZ-Spuren getrennt wird (<.ref>Protected-Bike-Lane</.ref>). Nach <.v bounds="9.935524,53.547523,9.936698,53.548382" lon={9.936302} lat={53.547981} dir="forward" ref="12">der Kreuzung mit der Königstraße</.v> wird auf einen <.ref>Kopenhagener Radweg</.ref> aufgeleitet. Dieser geht kurz vor der <.v bounds="9.935172,53.549812,9.937291,53.550783" lon={9.936291} lat={53.550093} dir="forward" ref="12">Kreuzung mit der Ehrenbergstraße</.v> in einen gewöhnlichen Radfahrstreifen über, ist sonst aber durchgängig.</p>

    <h5>Max-Brauer-Allee Fahrtrichtung Süd</h5>
    <p>Zunächst fährt man auf einem 2,0m breiten Radfahrstreifen, der um die <.v bounds="9.935172,53.549812,9.937291,53.550783" lon={9.936075} lat={53.550531} dir="forward" ref="13">Kreuzung mit der Ehrenbergstraße</.v> herum als <.ref>Protected-Bike-Lane</.ref> gebaut wird. Die KFZ-Parkplätze auf dem <.m bounds="9.934516,53.54758,9.936504,53.550417">„Platz der Republik“</.m> bleiben erhalten, sodass in diesem Bereich keine extra Schutzmaßnahmen umgesetzt werden. Vor der <.m bounds="9.935391,53.547372,9.936959,53.548132">Kreuzung mit der Königstraße</.m> gibt es jedoch wieder trennende Bordsteine. Bis kurz vor der Palmaille wird ein <.ref>Hochbordradweg</.ref> gebaut. Dieser führt hinter der Bushaltestelle vorbei und mündet im <.m bounds="9.934104,53.546237,9.936255,53.546785">Parkplatz südlich des Rathauses</.m>. Von dort erreicht man die <.m bounds="9.932798,53.545513,9.936585,53.546578">Kaistraße</.m>, in der ein Radfahrstreifen bergab angedeutet wird.</p>

    <h5>Ottenser Marktplatz / Königstraße</h5>
    <p>Auf der <.m bounds="9.934382,53.547437,9.936481,53.548019">Ottenser Seite</.m> gibt's bis zur Museumsstraße 2,0m breite Radfahrstreifen., die durch Bushaltestellen unterbrochen werden. Es bleibt genug Platz um an wartenden Bussen auch bei KFZ-Stau vorbeizufahren. Auf der <.m bounds="9.935883,53.547532,9.937885,53.547937">Altonaer Seite</.m> wird der Radfahrstreifen durch Bordsteine abgetrennt sofern dies durch Einfahrten, KFZ-Parkplätze oder zu wenig Platz nicht verhindert wird.</p>

    <h5>Lohbuschstraße / Ehrenbergstraße</h5>
    <p>Auf der <.v bounds="9.934501,53.550048,9.936544,53.550443" lon={9.934789} lat={53.550271} dir="forward" ref="1">Ottenser Seite</.v> gibt's zunächst Radfahrstreifen, die in Richtung Kreuzung jedoch zu Protected-Bike-Lanes werden. In der <.m bounds="9.936164,53.54978,9.94126,53.550453">Ehrenbergstraße</.m> wird dies nur auf der Nordseite (Fahrtrichtung Ottensen) umgesetzt, da die Südseite (Fahrtrichtung Innenstadt) zu viele KFZ-Parkplätze und Einfahrten besitzt. Stattdessen wird der Radweg hier mit 3,0m aber deutlich breiter. Abweichend zu anderen Abschnitten bleibt der Hochbordradweg auf der Nordseite zwischen <.m bounds="9.937894,53.549903,9.941129,53.550496">Altonaer Poststraße bis Schillerstraße</.m> erhalten. Auch er wird 2,0m breit.</p>

    <h4>Meinung</h4>
    <p>Die Planung löst viele Probleme die der Radverkehr in diesem Bereich hat. Die Radwege sind jetzt anprechend breit, durchgängig und mit Sicherheitsabstand zu den Autos geplant. Die verständliche Führung in Richtung Altonaer Balkon (Kaistraße) war überfällig. Man war sichtlich bemüht den Radverkehr vom KFZ-Verkehr zu trennen und dies durch physische Barrieren zu verdeutlichen. Das hat nicht überall geklappt, was die Umsetzung stückhaft erscheinen lässt. Dennoch sollten die neuen Radwege ein gutes Sicherheitsgefühl anbieten und liegen definitiv über dem Niveau, das in den letzten Jahren umgesetzt wurde.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
