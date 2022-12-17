defmodule Data.Article.Blog.SuelldorferKirchenweg do
  use Article.Default

  def name(), do: "#{created_at()}-1-suelldorfer-kirchenweg"
  def created_at(), do: ~D[2019-03-17]

  def title(), do: "Sülldorfer Kirchenweg (Veloroute 1, Abschnitt A13)"

  def start(), do: ~d[2020-07-06]
  def stop(), do: ~d[2021-02-25]

  def type(), do: :finished
  def construction_site_id_hh(), do: [9449]
  def tags(), do: ["1", "a13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Der <.m bounds="9.799389,53.56046,9.821313,53.573516">Sülldorfer Kirchenweg</.m> wird fast auf gesamter Länge im Mischverkehr mit den Autos befahren. Nur für ein kurzes Stück gibt es bergab einen kleinen Radweg, der viel zu schmal ist und zudem in der Türzone der parkenden Autos liegt. Zudem sind die Fußwege stellenweise freigegeben, aber ebenfalls viel zu schmal um sicheres Vorankommen zu gewährleisten.</p> <p>Die Vorplanung sieht vor die Straße um Schutzstreifen (gestrichelte Linie) zu ergänzen, die aber nur rund 1,50m breit sind. Im Bereich von Bushaltestellen muss der Radverkehr auf die normale Fahrbahn ausweichen. Die Kanalrinne soll zwischen Fahrbahn und Schutzstreifen verlaufen um das Sicherheitsgefühl zu verbessern.</p> <p>Die im markierten Bereich liegenden Einmündungen werden bis auf eine Ausnahme als „Gehwegüberfahrt“ ausgeführt, d.h. der in den <.m bounds="9.799389,53.56046,9.821313,53.573516">Sülldorfer Kirchenweg</.m> einbiegende Verkehr bleibt wartepflichtig. Teilweise werden die Sichtlinien verbessert, sodass Radfahrende hoffentlicher weniger übersehen werden.</p> <p>Beim <.m bounds="9.80628,53.567587,9.811762,53.570851">Abknicken der Veloroute in die Babendiekstraße</.m> soll dagegen ein Kreisel entstehen. Das reduziert nicht nur die Geschwindigkeit der KFZ, sondern erleichtert auch erheblich das Linksabbiegen. Die Nebenstraße <.m bounds="9.808445,53.568755,9.819809,53.569836">Wulfsdal</.m> bleibt eine Sackgasse.</p> <p>Die erlaubte Höchstgeschwindigkeit bleibt unverändert bei 50 km/h. Im Bergabschnitt werden die KFZ-Parkplätze allerdings auf die Bergseite verlegt, um bei einem „Dooring-Unfall“ (KFZ-Insasse öffnet Tür ohne auf Verkehr zu achten) die Unfallfolgen zu reduzieren. Man geht davon aus, das der Radverkehr bergauf im Schnitt langsamer ist und die Verletzungen daher weniger schlimm ausfallen.</p> <p>Die Planung ist durchwachsen. Schutzstreifen führen häufig zu knapperem Überholen, da viele AutofahrerInnen die Regeln nicht kennen und sich an den „Spuren“ orientieren. Die Kanalrinne erschwert Radfahren mit ausreichendem Sicherheitsabstand von parkenden Fahrzeugen, sodass die Umplanung keine sicheren Radwege herstellt. Das die Radwege eine leicht andere Farbe haben sollen als der normale Asphalt ist eher Spielerei als echter Nutzen. Gut hingegen ist ganz klar der Kreisel zur Babendiekstraße, mit der der Veloroute deutlich bequemer zu folgen ist als bisher.</p> <p><.a href="https://www.steg-hamburg.de/files/Projekte/Veloroute%201%20Altona/2018-06_Veloroute-Altona_A13_Gesamtdokumentation.pdf">Dokumentation zur Infoveranstaltung/Vorentwurf</.a><br><.a href="https://www.hamburg.de/pressemeldungen-bezirke/14822072/veloroute-1-sperrung-suelldorfer-kirchenweg/">Baustelleninfo Januar 2021</.a></p>
    """
  end
end
