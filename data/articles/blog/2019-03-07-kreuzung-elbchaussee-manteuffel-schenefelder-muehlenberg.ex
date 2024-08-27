defmodule Data.Article.Blog.KreuzungElbchausseeManteuffelSchenefelderMuehlenberg do
  use Article.Default

  def updated_at(), do: ~D[2023-01-09]
  def title(), do: "Kreuzung Elbchaussee / Manteuffelstraße / Mühlenberg (Radroute 1)"

  def summary(),
    do:
      "Veloroute 1 wird im südlichen Blankenese meist Fahrradstraße; die Kreuzungen an Eichendorffstraße und Elbchaussee deutlich fahrradfreundlicher."

  def type(), do: :planned

  def tags(), do: ["1", "A22", "A022.2", "A22.2"]

  def start(), do: ~d[2027Q2]

  def links(_assigns) do
    [
      {"geplante Änderungen für vierten Entwurf", ~d[2024-08],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1015530"},
      {"Bauzeiträume", "Oktober 2023",
       "https://fragdenstaat.de/anfrage/planungsstand-zu-einem-teilstueck-der-veloroute-1-a22-vr-1-blankenese-sued/"},
      {"Dritter Entwurf (veraltet)", "Januar 2023",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1013546"},
      {"Zweiter Entwurf (veraltet)", "Oktober 2021",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1011851"},
      {"Erster Entwurf (veraltet)", "Februar 2020",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1009667"},
      {"Dokumentation zur 1. Infoveranstaltung (veraltet)",
       "https://www.steg-hamburg.de/files/Projekte/Veloroute%201%20Altona/2019-01_Veloroute-Altona_A22_Gesamtdokumentation_mit%20Anlagen.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand August 2024</h4>
    <p>Die Planung wird in einem vierten Entwurf nochmals angepasst, was bis Ende 2024 passieren soll. Der Artikel wurde entsprechend angepasst. Die wesentlichen geplanten Änderungen sind:</p>
    <ul>
      <li>KFZ-Durchfahrtsperre zum <.m bounds="9.822702,53.559949,9.825069,53.561442">Mühlenberg</.m></li>
      <li>Entfall der direkten Abbiegemöglichkeit vom Radweg in der <.m bounds="9.822702,53.559949,9.825069,53.561442">Schenefelder Landstraße</.m> in die <.m bounds="9.822702,53.559949,9.825069,53.561442">Manteuffelstraße</.m></li>
    </ul>

    <h4>Alter Zustand</h4>
    <p>Um die <.v bounds="9.822446,53.559947,9.824702,53.561281" lon={9.824048} lat={53.560619} dir="forward" ref="1">Kreuzung mit der Elbchaussee</.v> zu queren muss man Richtung Blankenese über zwei Verkehrsinseln bzw. Ampeln fahren. In der Gegenrichtung ist (normalerweise) eine Fahrt geradeaus problemlos möglich. Die Ampelschaltzeiten favorisieren klar die KFZ-Hauptstraßen.</p>

    <h4>Planung</h4>
    <p>Die <.v bounds="9.822446,53.559947,9.824702,53.561281" lon={9.824048} lat={53.560619} dir="forward" ref="1">Kreuzung mit der Elbchaussee</.v> erhält ein für Hamburg neues Konzept:</p>
    <ul>
      <li><strong>Entlang der Veloroute:</strong> Die Querung der Elbchaussee erfolgt geradlinig. Die Durchfahrt zum Mühlenberg wird für KFZ gesperrt. Die Ausnahme für Busse in Manteuffelstraße bleibt bestehen.</li>
      <li><strong>Entlang der Elbchaussee:</strong> Es gibt Hochbordradwege, die zum Abbiegen bzw. Queren der Kreuzung gedacht sind. Wer nur geradeaus möchte, hat auf der Fahrbahn weiterhin die einfachste Anbindung.</li>
      <li><strong>Schenefelder Landstraße:</strong> Der Radweg in Richtung Norden erhält eine langgezogene Absenkung, damit man sich im Mischverkehr einordnen kann. Er endet kurz nach der Kreuzung. In Richtung Süden kann man auf Radwegen um die Kreuzung herumfahren. Eine direkte Abbiegemöglichkeit in die Manteuffelstraße besteht nur, wenn man die <.ref>Fahrbahn</.ref> nutzt.</li>
      <li><strong>Fußverkehr:</strong> Die Einmündungen der Veloroute werden zu einer Gehwegüberfahrt, sodass die Ampeln hier entfallen. Die Querungen der anderen Straßen verlaufen über eine Mittelinsel in Straßenmitte. Sie liegt so, dass immer „Zick-Zack“ notwendig ist, um geradeaus zu kommen.</li>
      <li><strong>Ampelschaltung:</strong> Fuß-, Rad- und KFZ-Wege erhalten jeweils eigene Ampeln, Phasen und Furten. Die Grünzeiten sollen zwar kurz sein, dafür aber häufig schalten. Je nach Ziel und Ampelphase muss der Fußverkehr auf der Mittelinsel warten.</li>
    </ul>

    <h4>Meinung</h4>
    <p>Der dritte Entwurf macht die Querung der Elbchaussee zwischen Manteuffelstraße und Mühlenberg geradlinig. Auch alle anderen Fahrtrichtungen erhalten jetzt eine klare und sichere Querungsmöglichkeit, auch wenn diese teils umständlich sind. Wer erfahren genug ist, kann zum Glück einfach im Mischverkehr bleiben. Außerhalb der Fahrbahn muss die Frage nach Vorrang vor allem durch Rücksicht und Absprache geregelt werden – die Konstellationen aus Gehwegüberfahrten, Zweirichtungsradwegen und Querungsstellen ist komplex.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
