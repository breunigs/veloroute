defmodule Data.Article.Blog.HohenfelderBucht do
  use Article.Default

  def name(), do: "#{created_at()}-5-6-hohenfelder-bucht"
  def created_at(), do: ~D[2018-10-10]
  def updated_at(), do: ~D[2023-10-27]

  def title(), do: "Hohenfelder Bucht (Veloroute 5 und 6)"

  def summary(),
    do:
      "Breitere und direktere Radwege im gesamten Baugebiet. Im Oktober 2023 wurde die Planung leicht angepasst, bleibt im Kern aber wie die ursprüngliche Version von 2018."

  def start(), do: ~d[2020-03-09]
  def stop(), do: ~d[2025-07-31]

  def type(), do: :construction
  # def construction_site_id_hh(), do: [6381]
  def tags(), do: ["5", "6", "FR2", "FR3", "br-nord-n1"]

  def links(_assigns) do
    [
      {"Pressemitteilung zum Baufortschritt", ~d[2024-08],
       "https://www.hamburg.de/politik-und-verwaltung/behoerden/bvm/aktuelles/pressemeldungen/alsterbruecken-sind-fertiggestellt-treppenanlage-am-ostufer-im-bau-960066"},
      {"Baustelleninfo", "Juli 2024",
       "https://lsbg.hamburg.de/resource/blob/902444/de19bdc94297b6150e156feda9d9b37f/hohenfelder-bucht-anliegerinformation-juli-2024-data.pdf"},
      {"Projektseite des LBSG", "https://lsbg.hamburg.de/hohenfelder-bucht"},
      {"Änderungen", "Oktober 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013307"},
      {"abgestimmter Lageplan", "2018",
       "https://lsbg.hamburg.de/resource/blob/783358/39544f704bacd68eee1df389c96b2e19/hohenfelder-bucht-abgestimmte-planung-plan-data.pdf"},
      {"Erläuterungsbericht zur Umgestaltung", "2018",
       "https://lsbg.hamburg.de/resource/blob/783356/291b78555f5327b00b81bae99ce3e8c7/hohenfelder-bucht-abgestimmte-planung-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Oktober 2023</h4>
    <p>Die Planung wurde an neue Gegebenheiten angepasst, bleibt der ursprünglichen Planung von 2018 aber treu. Im Wesentlichen setzt man häufiger auf roten Asphalt oder rot eingefärbte Fahrradfurten. Außerdem wird die Baustellenampel an der <.v bounds="10.012139,53.562077,10.022896,53.566994" lon={10.017168} lat={53.565184} dir="backward" ref="5" highlight="Schwanenwik,Armgartstraße">Armgartstraße über den Schwanenwik</.v> beibehalten. Dafür entfällt die direkte Querung des <.v bounds="10.014213,53.563338,10.019583,53.565025" lon={10.017772} lat={53.564161} dir="forward" ref="5">Mundsburger Damm</.v> nördlich der Kreuzung. Die Anpassungen sind für den Radverkehr positiv zu sehen.</p>

    <h4>Beschreibung</h4>
    <p>Im Vergleich zur aktuellen Situation rund um die <.m bounds="10.012989,53.560813,10.019895,53.565039">Hohenfelder Bucht</.m> verbessert die Planung an praktisch allen Wegen und Knotenpunkten die Situation für den Radverkehr. Auch wird die Aufenthaltsqualität um die Bucht durch mehr Grünflächen erhöht. Genauer umfasst die Planung die Straßen <.v bounds="10.010955,53.559175,10.019793,53.564957" lon={10.0132} lat={53.560872} dir="forward" ref="5">An der Alster</.v>, <.v bounds="10.010955,53.559175,10.019793,53.564957" lon={10.017507} lat={53.561648} dir="forward" ref="br-nord-n1">Sechslingspforte</.v>, <.v bounds="10.010955,53.559175,10.019793,53.564957" lon={10.017353} lat={53.562411} dir="forward" ref="br-nord-n1">Barcastraße</.v>, <.v bounds="10.010955,53.559175,10.019793,53.564957" lon={10.017577} lat={53.563142} dir="forward" ref="br-nord-n1">Buchtstraße</.v>, <.v bounds="10.013216,53.562013,10.019311,53.566995" lon={10.016741} lat={53.565512} dir="forward" ref="FR3">Schwanenwik</.v> und den <.v bounds="10.013216,53.562013,10.019311,53.566995" lon={10.01811} lat={53.564418} dir="forward" ref="5">Mundsburger Damm</.v>. Da die Planung für dieses Gebiet sehr umfangreich sind, gehe ich im Folgenden nur auf die für die Veloroute relevanten Änderungen ein. Für alle anderen Kreuzungen finden sich die Details in den PDFs.</p>

    <h5>Stadtauswärts, entlang der Straße:</h5>
    <p>Die bisherigen Fahrtmöglichkeiten bleiben erhalten. D.h. man wird auch weiterhin durch die Unterführung (Fußweg mit <.ref>Fahrrad frei</.ref>) und an der Oberfläche über die <.v bounds="10.010955,53.559175,10.019793,53.564957" lon={10.017353} lat={53.562411} dir="forward" ref="br-nord-n1">Barcastraße</.v> Richtung <.v bounds="10.013216,53.562013,10.019311,53.566995" lon={10.01811} lat={53.564418} dir="forward" ref="5">Mundsburger Damm</.v> fahren können. Neu hinzu kommt eine echte geradeaus Möglichkeit. Abgesehen von einer kleinen Verschwenkung an der Einmündung der <.v bounds="10.012316,53.560392,10.020485,53.56544" lon={10.015419} lat={53.562475} dir="forward" ref="br-nord-n1">Sechslingspforte</.v> fährt man zukünftig kerzengerade bis zum Altbestand im <.v bounds="10.013216,53.562013,10.019311,53.566995" lon={10.01811} lat={53.564418} dir="forward" ref="5">Mundsburger Damm</.v>.</p>

    <h5>Stadtauswärts, entlang der Alster:</h5>
    <p>Bislang ist es nicht leicht vom <.v bounds="10.012899,53.560451,10.02315,53.566472" lon={10.016171} lat={53.5637} dir="forward" ref="FR3">Radweg an der Alster</.v> Richtung <.v bounds="10.013216,53.562013,10.019311,53.566995" lon={10.01811} lat={53.564418} dir="forward" ref="5">Mundsburger Damm</.v> zu fahren. Die Planung sieht eine direktere Querungsmöglichkeit über die <.v bounds="10.012787,53.561928,10.023246,53.567522" lon={10.017832} lat={53.565199} dir="backward" ref="5">Armgartstraße</.v> vor. Die Ampel über den Mundsburger Damm bleibt, und die Baustellenampel am <.v bounds="10.012139,53.562077,10.022896,53.566994" lon={10.017168} lat={53.565184} dir="backward" ref="5">Schwanenwik</.v> wird ordentlich hergerichtet. Auch die Fahrt in die <.v bounds="10.010955,53.559175,10.019793,53.564957" lon={10.017577} lat={53.563142} dir="forward" ref="br-nord-n1">Buchtstraße</.v> ist möglich.</p>

    <h5>Stadteinwärts:</h5>
    <p>Diese Fahrtrichtung war auch bisher vergleichsweise unproblematisch, entsprechend wenig ändert sich. Die Querung des <.m bounds="10.01509,53.562342,10.01777,53.568488">Schwanenwik</.m> wird begradigt und die Einmündung zum Radweg an der Alster erhält einen besseren Winkel, sodass man leichter links abbiegen kann um der Veloroute zu folgen.</p>

    <h5>Breiten:</h5>
    <p>Der Radweg an der Alster soll mit 4,0m deutlich breiter werden als bisher, sodass 2,0m je Richtung zur Verfügung stehen. Protected-Bike-Lanes und Furten haben meist 2,25m. Lediglich in der <.v bounds="10.010955,53.559175,10.019793,53.564957" lon={10.017353} lat={53.562411} dir="forward" ref="br-nord-n1">Barcastraße</.v> gibt es nur <.ref>Schutzstreifen</.ref> mit 1,50m Breite.</p>

    <h5>Fazit:</h5>
    <p>Insgesamt wirkt die Planung gelungen: die Hohenfelder Bucht wird nicht nur grüner, sondern auch für den Radverkehr erheblich aufgewertet.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
