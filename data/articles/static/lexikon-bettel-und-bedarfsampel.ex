defmodule Data.Article.Static.LexikonBettelUndBedarfsampel do
  use Article.Static

  def name(), do: "lexikon/bettel-Und-bedarfs-ampel"
  def title(), do: "Lexikon · Bettel- und Bedarfsampel"

  def summary(),
    do:
      "Bedarfsampel: schaltet alle Verkehrsarten in die gleiche Richtung gemeinsam. Bettelampel: untergeordnete Verkehrsarten müssen extra anfordern."

  def tags(), do: ~w(lexikon bettelampel bedarfsampel)

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "kaiser-friedrich-ufer",
        direction: :forward,
        from: "Grindelberg",
        to: "Weidenstieg",
        parent_ref: __MODULE__,
        text: "entlang des Isebekkanals zum Weidenstieg",
        videos: [
          {"2023-10-29-lenhart/GX016643", "00:00:11.211", :end},
          {"2023-10-29-lenhart/GX016644", :start, "00:00:36.904"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "kaiser-friedrich-ufer",
        direction: :backward,
        from: "Weidenstieg",
        to: "Grindelberg",
        parent_ref: __MODULE__,
        text: "entlang des Isebekkanals zum Grindelberg",
        videos: [
          {"2023-10-29-lenhart/GX016630", "00:00:16.683", :end},
          {"2023-10-29-lenhart/GX016631", :start, :end},
          {"2023-10-29-lenhart/GX016632", :start, :end},
          {"2023-10-29-lenhart/GX016633", :start, "00:00:02.469"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Verkehrssenator Anjes Tjarks zur Reduzierung von Bettelampeln", "Mai 2022",
       "https://twitter.com/anjes_tjarks/status/1523535318988824576"},
      {"Artikel zur Historie der Bettelamplen in Hamburg", "Mai 2022",
       "https://www.abendblatt.de/hamburg/article235294915/verkehr-hamburg-so-viele-bettelampeln-werden-bis-2025-umgeruestet.html"},
      {"ADFC e.V. zu Bettelnampeln",
       "https://hamburg.adfc.de/artikel/adfc-position-ampeln#:~:text=die%20Lichtsignale%20akzeptieren.-,Bettelampeln,-Seit%202005%20gibt"},
      {"FUSS e.V. zu Bettelampeln", "https://www.hamburg-zu-fuss.de/bettelampeln.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Begriffe „Bedarfsampel“ und „Bettelampel“ werden häufig gleichbedeutend verwendet. Das ist jedoch falsch. </p>

    <h4>Gemeinsamkeiten</h4>
    <p>Bei beiden bekommt die Nebenrichtung oder untergeordnete Verkehrsart nur auf Anforderung Grün. Das passiert in der Regel mittels Taster, Induktionsschleifen im Boden oder Wärmebildsensoren am Ampelmast.</p>

    <h4>Bedarfsampel</h4>
    <p>Wenn die Nebenrichtung Grün bekommt, dann für alle Verkehrsarten in die gleiche Richtung. Wenn z.B. ein Fußgänger queren möchte und den Taster betätigt, werden auch die Fahrrad- und KFZ-Ampel Grün. Kommt man etwas später an als der Fußgänger, kann man bei Grün durchrollen, ohne dass man selbst das Grün angefordert hat.</p>

    <p>Andersrum funktioniert das genauso. Es ist egal ob man zuerst mit dem Auto, dem Fahrrad oder zu Fuß ankommt – Grün bekommen alle.</p>

    <p>Entlang des <.v bounds="9.96165,53.572203,9.975328,53.57774" lon={9.967996} lat={53.574891} dir="forward" ref={@ref}>Kaiser-Friedrich-Ufer</.v> gibt es zwei Bedarfsampeln. An der <.v bounds="9.96165,53.572203,9.975328,53.57774" lon={9.970897} lat={53.576143} dir="forward" ref={@ref}>Bogenstraße</.v> muss das Kaiser-Friedrich-Ufer den Bedarf anmelden. An der <.v bounds="9.96165,53.572203,9.975328,53.57774" lon={9.964552} lat={53.573409} dir="forward" ref={@ref}>Bundesstraße</.v> ist es andersherum – die Bundesstraße muss Bedarf anmelden. Die Regelung an der Bundesstraße ist erst seit 2022 so. Es war Hamburgs erste Ampel, an der der Autoverkehr Bedarf gegenüber Rad- und Fußverkehr anmelden musste.</p>

    <h4>Bettelampel</h4>
    <p>Hier muss jede Verkehrsart selbst Grün anfordern. Wenn z.B. eine Autofahrerin den Sensor auslöst, wird nur ihre KFZ-Ampel grün. Ein kurz später ankommender Fußgänger muss zusätzlich seinen Taster betätigen. Trotzdem erhält er dann oft nicht gemeinsam mit der Autofahrerin Grün, sondern erst im nächsten Ampelumlauf.</p>

    <p>Wenn andersherum der Fußgänger zuerst ankommt und die Autofahrerin später, erhält das Auto <em>trotzdem</em> Grün. Bei Hamburger Bettelampeln hatten Fuß- und Radverkehr <em>immer</em> das Nachsehen.</p>

    <p>Bis 2025 sollen nur noch rund 20 Bettelampeln in Hamburg verbleiben.</p>

    <h4>Meinung</h4>
    <p>Bettelampeln sind eine Frechheit. Bedarfsampeln sind besser, aber auch ein Zeichen einer Auto zentrierten Planung. Kreisverkehre oder Zebrastreifen sind für alle Verkehrsarten häufig besser, weil man nicht Anhalten muss auch wenn sonst frei wäre.</p>

    <h4>Siehe auch</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
