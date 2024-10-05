defmodule Data.Article.Blog.EppendorferMarktplatz do
  use Article.Default

  def title(), do: "Eppendorfer Marktplatz (Bezirksrouten Nord N2, N6, N7)"

  def summary(),
    do:
      "Breitere Rad- und Gehwege. Neue, direktere Verbindungen und Querungsmöglichkeiten für Fuß und Rad. "

  def start(), do: ~d[2025-07]
  def stop(), do: ~d[2026-12]

  def type(), do: :planned

  def tags(), do: ["br-nord-n2", "br-nord-n6", "br-nord-n7"]

  def map_image do
    Data.MapImage.new(__MODULE__, {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}, {
      %{lat: 53.594705882, lon: 9.986387817},
      %{lat: 53.594654870, lon: 9.992339386},
      %{lat: 53.591646344, lon: 9.992264983},
      %{lat: 53.591697356, lon: 9.986313414}
    })
  end

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "Oktober 2023",
       "https://lsbg.hamburg.de/resource/blob/784150/c55912d7a77bd6bcda86665d1d308865/eppendorfer-marktplatz-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan", "Oktober  2023",
       "https://lsbg.hamburg.de/resource/blob/784152/d0a03b758111229c80e06c3ec23dbc42/eppendorfer-marktplatz-abgestimmte-planung-plan-data.pdf"},
      # {"Lagepläne und Erläuterungsbericht", "2023",
      #  "https://suche.transparenz.hamburg.de/dataset/busbeschleunigung-eppendorfer-marktplatz"},
      {"Auswertung Beteiligungsprozess und veraltete Pläne", "2018",
       "https://web.archive.org/web/20231026172652/http://www.via-bus.de/beteiligungsprozess-eppendorfer-marktplatz/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird meist auf schmalen <.ref>Hochbordradwegen</.ref> geführt. Diese verlaufen ohne ordentliche Trennung neben ebenfalls schmalen Gehwegen. Die Querungsmöglichkeiten sind selten und teilweise unklar. Je nach Start und Ziel müssen Umwege gefahren werden, weil die Straßen entweder Einbahnstraßen sind, oder das Linksabbiegen nur von der <.ref>Fahrbahn</.ref> aus möglich ist. Nur mit tiefgehender Ortskenntnis ist der Bereich brauchbar zu befahren.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Im Planungsgebiet wird jede Straße in beide Richtungen befahrbar. Ausnahme bleibt ein Stück der <.v bounds="9.9856,53.591849,9.991747,53.595365" lon={9.988222} lat={53.593589} dir="backward" ref="br-nord-n6">Eppendorfer Landstraße</.v>, das nicht umgebaut wird. Dort ist weiterhin nur die Fahrt nach Süden erlaubt.</p>

    <p>Neue Querungsmöglichkeiten:</p>
    <ul>
      <li>von <.v bounds="9.987277,53.591858,9.99015,53.593514" lon={9.988734} lat={53.592448} dir="backward" ref="br-nord-n6">südlich der Bushaltestelle</.v> in Richtung der nördlichen <.v bounds="9.987277,53.591858,9.99015,53.593514" lon={9.988288} lat={53.592737} dir="backward" ref="br-nord-n6">Eppendorfer Landstraße</.v></li>
      <li>von <.v bounds="9.987987,53.592762,9.989939,53.593614" lon={9.989244} lat={53.592974} dir="backward" ref="br-nord-n2">nördlich der Bushaltestelle</.v> direkt in den nördlichen <.v bounds="9.987987,53.592762,9.989939,53.593614" lon={9.989207} lat={53.593297} dir="backward" ref="br-nord-n2">Eppendorfer Marktplatz</.v></li>
      <li>von der <.v bounds="9.988614,53.592294,9.992432,53.593405" lon={9.991617} lat={53.592992} dir="backward" ref="br-nord-n6">Ludolfstraße</.v> in die <.m bounds="9.988763,53.592548,9.99118,53.593541">Heinickestraße</.m></li>
      <li>über die <.m bounds="9.988763,53.592548,9.99118,53.593541">Heinickestraße</.m> um der Ludolfstraße von <.m bounds="9.989494,53.592942,9.991305,53.594249" highlight="Ludolfstraße">West</.m> nach <.v bounds="9.990284,53.59209,9.99274,53.593797" lon={9.991221} lat={53.592878} dir="forward" ref="br-nord-n6" highlight="Ludolfstraße">Ost</.v> folgen zu können</li>
    </ul>

    <p>Die Radwege werden meist rund 2,0m breit, wobei die genaue Breite je nach Führungsform und Ort etwas anders ausfällt. Ausnahme ist der <em>neue</em> Radweg in der <.m bounds="9.987408,53.591785,9.993149,53.594934">Ludolfstraße</.m> in Richtung Winterhude – er wird nur 1,62m breit. Überwiegend werden die alten Radwege zu Fußwegen. Der nötige Platz für die Radspuren wird aus KFZ- und Busspuren gewonnen.</p>

    <p>Zu den Führungsformen zählen von häufig nach selten: <.ref>Radfahrstreifen</.ref>, <.ref>Hochbordradwege</.ref>, <.ref>Protected-Bike-Lanes</.ref>, <.ref>Mischverkehr</.ref>, Busspur mit Radfreigabe, und ein <.ref>Radfahrstreifen in Mittellage</.ref> im Bereich der <.m bounds="9.987787,53.592195,9.990099,53.593397">Bushaltestelle</.m> nach Süden.</p>

    <h4>Meinung</h4>
    <p>Die Planung ist gut. Die Radwege sind klar erkennbar und deutlich vom Fuß- sowie KFZ-Verkehr getrennt. Die Breiten reichen zum Plaudern oder Überholen (aber nicht beidem gleichzeitig). Neue Querungsmöglichkeiten ersetzen die vorher völlig unklare Führung. Radverkehr wird nach dem Umbau komfortabler, schneller und sicherer.</p>

    <p>Leider sind die Radwege nur selten vor den KFZ geschützt, was den Parkplätzen und Ladezonen rechts des Radwegs geschuldet ist. Sofern dieser im Gegenzug nicht illegal zugeparkt wird, aber zu verschmerzen.</p>

    <p>Es ist schade, dass die Planung manche Bereiche ausspart. Die knapp 100m in der <.v bounds="9.9856,53.591849,9.991747,53.595365" lon={9.988222} lat={53.593589} dir="backward" ref="br-nord-n6">Eppendorfer Landstraße</.v> hätte man auch noch herrichten können. Da die Kreuzung mit dem <.v bounds="9.986741,53.593527,9.990232,53.595284" lon={9.987963} lat={53.594374} dir="forward" ref="br-nord-n7">Lokstedter Weg</.v> nur soweit wie nötig angepasst wird, bleibt die Fahrt entlang der <.a name="br-nord-n7">Bezirksroute Nord N7</.a> auch nach diesem Umbau umständlich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
