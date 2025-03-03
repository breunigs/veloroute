defmodule Data.Article.Blog.VierlaenderDamm do
  use Article.Default

  def title(), do: "Billhorner Röhrendamm, Vierländer Damm, Ausschläger Allee (Rothenburgsort)"
  def updated_at(), do: ~D[2024-05-15]

  def summary(),
    do:
      "Erstmals erkennbare und durchgängige Radwege. Komplizierte Planung mit guten und mäßig Abschnitten für den Radverkehr, aber insgesamt faire Aufteilung unter den Verkehrsarten."

  def type(), do: :construction

  def start(), do: ~d[2024-04-22]
  def stop(), do: ~d[2025-02-28]
  def construction_site_id_hh(), do: [882_875, 1_024_062]

  def tags(), do: ["radroute-22", "FR5"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "strassenzug",
        direction: :forward,
        from: "Billhorner Brückenstraße",
        to: "Tiefstack",
        parent_ref: __MODULE__,
        text: "von der Billhorner Brückenstraße zum Tiefstack",
        historic: %{
          "ed965983cff8f295400f6f7c3cbcfe03" => ~d[2024-01]
        },
        videos: [
          {"2024-01-27-bergedorf/GX016740", "00:01:23.016", :end},
          {"2024-01-27-bergedorf/GX016741", :start, "00:01:14.393"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "strassenzug",
        direction: :backward,
        from: "Tiefstack",
        to: "Billhorner Brückenstraße",
        parent_ref: __MODULE__,
        text: "vom Tiefstack zur Billhorner Brückenstraße",
        historic: %{
          "d7d9e00c93dbe75b9a0714fa3ae878c3" => ~d[2024-01]
        },
        videos: [
          {"2024-01-27-bergedorf/GX016745", "00:00:12.010", "00:00:39.006"},
          {"2024-01-27-bergedorf/GX016745", "00:00:40.240", "00:01:43.082"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2025-03],
       "https://lsbg.hamburg.de/resource/blob/1016102/7d173a0b73561e339988ca33a0365927/billhorner-roehrendamm-hst-billhorner-deich-anliegerinformation-februar-2025-data.pdf"},
      # {"Baustelleninfo", ~d[2025-01],
      #  "https://lsbg.hamburg.de/resource/blob/984538/4c805f97b33d388715245c9dd4b20d02/billhorner-roehrendamm-hst-thiedingreihe-anliegerinformation-oktober-2024-data.pdf"},
      # {"Baustelleninfo", ~d[2024-11],
      #  "https://lsbg.hamburg.de/resource/blob/985810/b9817a457204b7f6865566eec4239b3a/billhorner-roehrendamm-hst-billhorner-deich-anliegerinformation-november-2024-data.pdf"},
      # {"Baustelleninfo", ~d[2024-10],
      #  "https://lsbg.hamburg.de/resource/blob/984538/e832755a5115ff63c56cbddc55ec98f0/billhorner-roehrendamm-anliegerinformation-oktober-2024-data.pdf"},
      # {"Baustelleninfo", ~d[2024-09],
      #  "https://lsbg.hamburg.de/resource/blob/885484/63f351d4fab3b1442eb795c1a3d31586/vierlaender-damm-billhorner-roehrendamm-mb3-haltestelle-thiedingreihe-september-2024-data.pdf"},
      # {"Baustelleninfo", ~d[2024-09],
      #  "https://lsbg.hamburg.de/resource/blob/885484/a92a2d15093fcd561f551841ccebdea9/vierlaender-damm-billhorner-roehrendamm-mb3-haltestelle-thiedingreihe-juni-2024-data.pdf"},
      # {"Baustelleninfo", "Juni 2024",
      #  "https://lsbg.hamburg.de/resource/blob/885484/96087f06180ac52e335a7e7528ab9b99/vierlaender-damm-billhorner-roehrendamm-mb3-haltestelle-thiedingreihe-juni-2024-data.pdf"},
      {"Pressemitteilung zum Baustart", "April 2024",
       "https://web.archive.org/web/20240523021928/https://www.hamburg.de/bvm/medien/18533074/2024-04-16-bvm-rothenburgsort/"},
      {"Möglicher Baustart", "Februar 2024",
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1017554"},
      {"Lageplan, überarbeiteter fertiger Entwurf", "Mai 2024",
       "https://lsbg.hamburg.de/resource/blob/870300/b4a5ed52b42aa58605f0cfc84581c13f/billhorner-roehrendamm-vierlaender-damm-mb3-abgestimmte-planung-plaene-data.pdf"},
      {"Erläuterungsbericht, überarbeiteter fertiger Entwurf", "Mai 2024",
       "https://lsbg.hamburg.de/resource/blob/870326/a74f99e8080702e28615f70b10d424ff/billhorner-roehrendamm-vierlaender-damm-mb3-abgestimmte-planung-berichte-data.pdf"},
      {"Lageplan, 1. Entwurf", "April 2021",
       "https://web.archive.org/web/20240215205214if_/http://www.via-bus.de/contentblob/15032948/ad10d351d791270e024ead44e9dcf90b/data/mb3-lageplan-haltestellen-rothenburgsort.pdf"},
      {"Erläuterungsbericht, 1. Entwurf", "Februar 2021",
       "https://web.archive.org/web/20240215205255/http://www.via-bus.de/contentblob/15030614/ef0af43aa5513c0c0d2591bb536f0ff8/data/56-mb3-bushaltestellen-rothenburgsort-erstverschickung.pdf"}
    ]
  end

  def map_image do
    {name(),
     [
       {"LSBG Hamburg (S1)",
        "https://lsbg.hamburg.de/ueber-uns/unsere-geschaeftsbereiche/geschaeftsbereich-strassen"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Mai 2024</h4>
    <p>Es wurden zwei Planungsänderungen am bereits fertigen Entwurf vorgenommen. Auch gab es einige Detailänderungen im Vergleich zum ersten Entwurf. Der Artikel wurde entsprechend angepasst. In Kürze:</p>
    <ul>
      <li>Für den „Alster-Bille-Elbe“ Grünzug wurde die Kreuzung mit dem <.v bounds="10.032265,53.535744,10.036392,53.538221" lon={10.0337} lat={53.53692} dir="forward" ref={@ref}>Billhorner Mühlenweg</.v> überarbeitet – statt <.ref>Mischverkehr</.ref> soll ein eigener Radweg entlang des Mühlenwegs verlaufen.</li>
      <li>Die beidseitigen <.ref>Schutzstreifen</.ref> ab Zollvereinsstraße wurden gegen eine <.ref>Protected-Bike-Lane</.ref> auf der Nordseite und Mischverkehr auf der Südseite getauscht.</li>
      <li>Einige Schutzstreifen wurden zu Radfahrstreifen, etwa ab <.v bounds="10.04105,53.53303,10.047508,53.53477" lon={10.041918} lat={53.534189} dir="forward" ref={@ref}>Billhorner Deich</.v>. Die Breite blieb gleich.</li>
    </ul>

    <h4>Alter Zustand</h4>
    <p>Entlang des Straßenzugs gibt es keine durchgängigen Radwege. Stellenweise sind enge <.ref>Hochbordradwege</.ref>, enge <.ref>Radfahrstreifen</.ref>, und eine geteilte Busspur vorhanden. Einen langen Abschnitt fährt man auch im <.ref>Mischverkehr</.ref>.</p>

    <p>Die Überleitungen zwischen den Varianten sind oft überraschend oder teilweise gar nicht ersichtlich. Die Oberflächen werden von Ausbesserungen und Schlaglöchern geprägt.</p>

    <p>Weil die Fußwege und Warteflächen für Fahrgäste ebenfalls häufig zu schmal sind, werden die vorhandenen Radwege weiter eingeschränkt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es bleibt bei vielen verschiedenen Varianten. Die Führung wird durchgängig und die Überleitungen geradlinig. An den meisten Bushaltestellen wird der Radverkehr über die Wartefläche der Busse geführt. Wer an einem wartenden Bus vorbei möchte, muss sich in den KFZ-Verkehr einordnen.</p>

    <p>Der <.v bounds="10.032391,53.535492,10.036213,53.537566" lon={10.033643} lat={53.537019} dir="forward" ref={@ref}>Billhorner Mühlenweg</.v> wird künftig bereits vor der Kreuzung zusammengelegt. Dadurch entfällt die Mittelinsel auf beiden Seiten, womit klarer wird wie aus der Nebenstraße links abgebogen werden kann. Auch wird die Kreuzung kompakter, wodurch sich die Ampelschaltzeiten verbessern. Als Vorleistung für den „Alster-Bille-Elbe“ Grünzug wird ein Stück 4,0m breiter Radweg in Nord-Süd-Richtung mitgebaut. Er wird erst mit der Fertigstellung des Grünzugs in beide Richtungen befahrbar.</p>

    <p>Entlang des Straßenzugs wird am <.v bounds="10.032391,53.535492,10.036213,53.537566" lon={10.033643} lat={53.537019} dir="forward" ref={@ref}>Billhorner Mühlenweg</.v> und <.v bounds="10.039209,53.533398,10.043654,53.53517" lon={10.041412} lat={53.534205} dir="forward" ref={@ref}>Billhorner Deich</.v> nur <.ref>indirektes Linksabbiegen</.ref> vorgesehen. Überall sonst kann nur <.ref>direkt</.ref> abgebogen werden.</p>

    <p>An den Einmündungen von kleineren, verkehrsberuhigten Straßen werden die Gehwege durchgängig. Gehwege und Warteflächen für Fahrgäste werden wo möglich breiter und voneinander getrennt. Die Bushaltestellen selbst werden barrierefrei.</p>

    <p>Im Detail:</p>

    <h5>Richtung Tiefstack</h5>
    <ul>
      <li><.v bounds="10.031914,53.53603,10.035291,53.537621" lon={10.034525} lat={53.536465} dir="forward" ref={@ref}>bis Bushalt Billhorner Mühlenstraße</.v>: gepflasterter, 2,5m breiter Hochbordradweg. Höhe des Kiosks ist eine kurze Engstelle mit 2,0m Breite.</li>
      <li><.v bounds="10.035014,53.534643,10.03845,53.536589" lon={10.037715} lat={53.534928} dir="forward" ref={@ref}>bis Höhe Schule Marckmannstraße</.v>: asphaltierter, 2,5m breiter Radweg. Er verläuft rechts der KFZ-Parkplätze mit 1,8m Sicherheitsabstand gegen <.ref>Dooring</.ref>.</li>
      <li><.v bounds="10.038016,53.534036,10.041889,53.534889" lon={10.039521} lat={53.534325} dir="forward" ref={@ref} highlight="Billhorner Deich">bis Billhorner Deich</.v>: asphaltierter Radfahrstreifen. Anfangs mit 2,0m Breite, die sich in mehreren Schritten auf 1,7m verringert. Sicherheitsabstand zu KFZ-Parkplätzen rund 0,65m.</li>
      <li><.v bounds="10.041719,53.533234,10.047093,53.534387" lon={10.046827} lat={53.533434} dir="forward" ref={@ref}>bis Höhe Bushalt Thiedingreihe</.v>: asphaltierter <.ref>Radfahrstreifen</.ref> mit wechselnden Breiten. An der engsten Stelle 1,40m; meist um die 1,60m.</li>
      <li><.v bounds="10.046017,53.532827,10.048579,53.533913" lon={10.047424} lat={53.533305} dir="forward" ref={@ref}>bis Einmündung Vierländer Damm</.v>: asphaltierter, 2,0m breiter Radfahrstreifen.</li>
      <li><.v bounds="10.047614,53.532325,10.050751,53.533458" lon={10.049073} lat={53.532963} dir="forward" ref={@ref} highlight="Freihafenstraße">bis kurz vor Freihafenstraße</.v>: Es besteht die Wahl sich in den Mischverkehr einzuordnen (Spurwechsel), oder diagonal auf einem Hochbordradweg weiterzufahren. Dieser verläuft rechts der Baumreihe und wird 2,0m breit gepflastert.</li>
      <li><.v bounds="10.049854,53.532195,10.05194,53.533001" lon={10.050906} lat={53.532502} dir="forward" ref={@ref} highlight="Zollvereinsstraße">bis kurz vor Zollvereinsstraße</.v>: 1,75m breiter Radfahrstreifen.</li>
      <li><.v bounds="10.050977,53.531554,10.054878,53.532687" lon={10.052821} lat={53.532127} dir="forward" ref={@ref} highlight="Rothenburgstraße">bis kurz vor Rothenburgstraße</.v>: 1,5m breiter Schutzstreifen, der nach dem Bushalt ausläuft. Danach Mischverkehr.</li>
    </ul>

    <h5>Richtung Innenstadt</h5>
    <ul>
      <li><.v bounds="10.049828,53.531573,10.054557,53.532996" lon={10.051961} lat={53.532428} dir="backward" ref={@ref} highlight="Freihafenstraße">bis kurz vor Freihafenstraße</.v>: 1,5m breiter Schutzstreifen. Gegen Ende etwas breiter. Dazwischen ist ein kurzes Stück <.ref>Protected-Bike-Lane</.ref> mit rund 2,0m Breite.</li>
      <li><.v bounds="10.045675,53.532364,10.05102,53.533939" lon={10.045947} lat={53.533777} dir="backward" ref={@ref}>bis Bushalt Thiedingreihe</.v>: Radfahrstreifen mit anfangs 1,6m, später 1,85m. Zu KFZ-Parkplätzen sind 0,6m Sicherheitsabstand geplant.</li>
      <li><.v bounds="10.041276,53.533507,10.046437,53.534445" lon={10.0423} lat={53.534267} dir="backward" ref={@ref} highlight="Billhorner Deich">bis Billhorner Deich</.v>: Radfahrstreifen mit 1,6m Breite.</li>
      <li><.v bounds="10.033035,53.535217,10.037366,53.537491" lon={10.034695} lat={53.536658} dir="backward" ref={@ref} highlight="Billhorner Mühlenweg">bis Billhorner Mühlenweg</.v>: Radfahrstreifen, anfangs 1,85m später 2,0m.</li>
      <li><.v bounds="10.032742,53.536334,10.035383,53.537589" lon={10.034316} lat={53.53692} dir="backward" ref={@ref} highlight="Billhorner Brückenstraße">bis Rampe zur Billhorner Brückenstraße</.v>: 2,5m breiter Hochbordradweg zwischen Gehweg und Wartefläche für Fahrgäste.</li>
    </ul>

    <h4>Meinung</h4>
    <p>Es ist gut, dass es künftig erkennbare, durchgängige Radwege geben soll. Stellenweise erreichen Abschnitte die hohe Radwegqualität der Niederlande. Meist sind es mittelklassige Wege. Es verbleiben auch unangenehme Stellen für den Radverkehr, die aber trotzdem besser sind als der alte Zustand.</p>

    <p>Das ist kein Vorwurf an das Planungsbüro, das sich sichtlich bemüht hat das Beste herauszuholen. Der Raum wird gerechter auf alle Verkehrsarten aufgeteilt und die Straßenbäume bleiben größtenteils erhalten. </p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
