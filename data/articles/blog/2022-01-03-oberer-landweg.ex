defmodule Data.Article.Blog.ObererLandweg do
  use Article.Default

  def created_at(), do: ~D[2022-01-03]
  def updated_at(), do: ~D[2023-10-25]

  def title(), do: "Oberer Landweg (Alltagsroute 9, RSW Geesthacht)"

  def start(), do: ~d[2023-08-07]
  def stop(), do: ~d[2024-04-12]
  def construction_site_id_hh(), do: [444_856]

  def type(), do: :construction

  def summary(),
    do:
      "Beidseitig Zweirichtungsradwege unter der S-Bahn und auf der gesamten Westseite. Fuß- und Radverkehr bekommen mehr Platz als heute. Klarere Querungsmöglichkeiten und meist eigene Radampeln."

  def tags(), do: ["9", "rsw-geesthacht", "rsw"]

  def links(_assigns) do
    [
      {"Lageplan und Erläuterungsbericht", "Oktober 2023",
       "https://fragdenstaat.de/anfrage/oberer-landweg/"},
      {"Zeitungsartikel zum Umbaustart", "Juli 2023",
       "https://www.abendblatt.de/hamburg/bergedorf/article239022931/Oberer-Landweg-Neun-Monate-Baustelle-fuer-die-Veloroute.html"},
      {"Baustellenkoordination", "Januar 2023",
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/to020.asp?TOLFDNR=1025381"},
      {"Haushaltsplan 2022 Bezirk Bergedorf (Entwurf)",
       "https://sitzungsdienst-bergedorf.hamburg.de/bi/vo020.asp?VOLFDNR=1006315"},
      {"Zeitungsartikel zur Umbauplanung", "Oktober 2021",
       "https://www.abendblatt.de/hamburg/bergedorf/article233661837/oberer-landweg-einspurig-auto-verkehr-hamburg-nettelnburg-radfahrer-fussgaenger.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Oktober 2023</h4>
    <p>Lageplan und Erläuterungen seitens der Stadt wurden veröffentlicht. Danke an den hartnäckigen Nachfrager.</p>

    <h4>Alter Zustand</h4>
    <p>Im <.v bounds="10.182936,53.485552,10.187685,53.491083" lon={10.186129} lat={53.488292} dir="forward" ref="9" highlight="Oberer Landweg">Oberen Landweg</.v> gibt es für den Radverkehr <.ref>Hochbordradwege</.ref>. Stellenweise ist der Radverkehr in beide Richtungen vorgesehen, was aber häufig nur schlecht zu erkennen ist. Bei der <.v bounds="10.182936,53.485552,10.187685,53.491083" lon={10.185727} lat={53.487419} dir="forward" ref="rsw-geesthacht">Bahnunterführung</.v> müssen sich Fuß- und Radverkehr irgendwie arrangieren.</p>

    <h4>Planung</h4>
    <h5>Entlang der Veloroute</h5>
    <p>Auf der <.v bounds="10.182936,53.485552,10.187685,53.491083" lon={10.186288} lat={53.489815} dir="backward" ref="9" highlight="Oberer Landweg">Westseite des Oberen Landweg</.v> ist ein Zweirichtungsradweg im Hochbord mit 2,50m bis 3,50m Breite vorgesehen. Wie heute endet die Zweirichtungs-Lösung am <.v bounds="10.182936,53.485552,10.187685,53.491083" lon={10.186964} lat={53.490757} dir="backward" ref="9">Billwerder Billdeich</.v>. Eine Weiterfahrt in Richtung <.v bounds="10.182936,53.485552,10.187685,53.491083" lon={10.187323} lat={53.490534} dir="forward" ref="9">Kurt-A.-Körber-Chaussee</.v> ist nicht vorgesehen, was nicht rechtzeitig ersichtlich gemacht wird.</p>

    <p>Auf der <.v bounds="10.182936,53.485552,10.187685,53.491083" lon={10.186129} lat={53.488292} dir="forward" ref="9" highlight="Oberer Landweg">Ostseite</.v> ist ist die Fahrt nur nach Norden erlaubt. Der Radweg wird als <.ref name="Hochbordradweg">Hochbord</.ref> (2,0m breit), im <.ref name="Kopenhagener Radweg">Kopenhagener Stil</.ref> (2,70m), und als <.ref>Protected-Bike-Lane</.ref> (2,50m) ausgeführt. Wegen der vielen Einfahrten sind nur kurze Abschnitte vom KFZ-Verkehr durch einen Bordstein getrennt.</p>

    <h5>Entlang des Radschnellwegs</h5>
    <p>Auf der <.v bounds="10.182936,53.485552,10.187685,53.491083" lon={10.185511} lat={53.487778} dir="backward" ref="9">Westseite</.v> setzt sich der oben genante Zweirichtungsradweg fort. Allerdings wird er als <.ref>Kopenhagener Radweg</.ref> geführt.</p>

    <p>Auf der <.v bounds="10.182936,53.485552,10.187685,53.491083" lon={10.185727} lat={53.487419} dir="forward" ref="rsw-geesthacht">Ostseite</.v> ist auch ein Zweirichtungsrad im Kopenhagener Stil geplant. Er wird mit 3,0m etwas breiter, weil diese Seite für den Radschnellweg vorgesehen ist. Rad- und Gehweg münden direkt in den <.v bounds="10.176846,53.485552,10.187685,53.491083" lon={10.185554} lat={53.487008} dir="forward" ref="rsw-geesthacht">Wehrdeich</.v>. Dort wird dann im <.ref>Mischverkehr</.ref> gefahren.</p>

    <h5>Querungsmöglichkeiten</h5>
    <p>An der Kreuzung <.m bounds="10.183486,53.485887,10.186654,53.48768">Nettelnburger Landweg</.m> kann man von West nach Ost mittels eigener Ampeln wechseln. In der Gegenrichtung erfolgt dies gemeinsam mit den Autos auf geteilten Spuren.</p>

    <p>Am <.v bounds="10.183509,53.486635,10.187781,53.488753" lon={10.185296} lat={53.487676} dir="forward" ref="9">Karl-Heinz-Rissmann-Weg</.v> darf in beide Richtungen gequert werden. Auf der Westseite ist diese Fahrtrichtung gegenüber dem Nord/Süd Radweg bevorrechtigt. Dies wird durch die in den Niederlanden gebräuchlichen „Haifischzähne“ verdeutlicht. Zu Fuß müssen an dieser Stelle die beiden Zweirichtungsradwege gequert werden, die deswegen rot hervorgehoben werden.</p>

    <p>Nördlich des <.v bounds="10.185049,53.488366,10.187419,53.490041" lon={10.186445} lat={53.489187} dir="forward" ref="9">Ladenbeker Furtweg</.v> gibt es eine Möglichkeit die Straßenseite zu wechseln. Wer direkt aus dem Furtweg kommt, muss also zweimal die Straßenseite wechseln um der Veloroute in Richtung Bergedorf zu folgen.</p>

    <h5>Sonstiges</h5>
    <p>Als Oberflächen sind rotes Betonsteinpflaster und Asphalt vorgesehen. Am <.v bounds="10.183509,53.486635,10.187781,53.488753" lon={10.185296} lat={53.487676} dir="forward" ref="9">Karl-Heinz-Rissmann-Weg</.v> soll ein Fahrrad-Dauergrün in den Nebenzeiten ausprobiert werden. Auch die Fußwege unter der S-Bahn-Brücke werden breiter.</p>

    <h4>Meinung</h4>
    <p>Auf den ersten Blick eine gelungene Planung. Die Radwege sind breit, Seitenwechsel ist leicht möglich, aber je nach Ziel optional. Die erlaubten Fahrtrichtungen sind eindeutig erkennbar. Die Praxis wird zeigen müssen ob die Ampeln brauchbar funktionieren. Gerade die Westseite am Karl-Heinz-Rissmann-Weg ist spannend, da hier zwei Zweirichtungsradwege und der Fußverkehr einander kreuzen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
