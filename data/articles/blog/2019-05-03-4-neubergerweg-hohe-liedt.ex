defmodule Data.Article.Blog.NeubergerwegHoheLiedt do
  use Article.Default

  def name(), do: "#{created_at()}-4-neubergerweg-hohe-liedt"
  def created_at(), do: ~D[2019-05-03]
  def updated_at(), do: ~D[2020-06-18]
  def title(), do: "Neubergerweg und Hohe Liedt (Veloroute 4)"

  def type(), do: :intent

  def tags(), do: ["4"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Mitte 2020:</strong> Eine <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1009454">weitere Diskussion</.a> um die Verkehrsführung an diesem Teilstück blieb ebenfalls weitgehend ergebnislos. Die Interessen des Rad- und Fußverkehrs lassen sich schlecht mit dem ebenfalls gewünschten „Hamburg Takt“ (salopp: besserer Nahverkehr) vereinen. Die gesetzliche Lage erschwert die Einrichtung von Tempo 30 offenbar zusätzlich. Das Zeitfenster für einen Umbau wäre Herbst 2020, den man aber ggf. verstreichen lassen würde. Der nächstmögliche Termin wäre dann erst 2023.</p> <p>Stand Dezember 2019: Der <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008877">Regionalausschuss</.a> lehnt die vorliegende Planung einstimmig ab und bittet den Bezirksamtleiter diese zu überarbeiten.</p> <p>Der Streckenabschnitt auf dem <.m bounds="10.00206,53.66678,10.019556,53.669298">Neubergerweg</.m> bzw. <.m bounds="10.019556,53.668364,10.034971,53.67015">Hohe Liedt</.m> leidet an unebenen und baufälligen Radwegen. Diese sind teils nur über den Grünstreifen zu erreichen und werden häufig von Falschparkern „mitbenutzt“. Die 50 km/h machen das Fahren auf der Fahrbahn unangenehm, die dafür aber mit guter Oberfläche punktet.</p> <p>Die im ersten Entwurf vorliegende Umplanung sieht vor die alten Radwege komplett zu entfernen. Stattdessen soll der Radverkehr künftig hauptsächlich im Mischverkehr auf der Fahrbahn fahren oder in Schrittgeschwindigkeit auf dem Gehweg („Fahrrad frei“, auch bekannt als „Service-Lösung“).</p> <p>Einzige Ausnahme bildet ein einseitiger Radfahrstreifen ab der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.669085, lon: 10.018145, zoom: 17.5}))}>U-Bahn Brücke bis kurz nach Einmündung Fibingerstraße</.m>. Dieser ist mit rund 2m aber ordentlich breit. Um diesen frei von Falschparkern zu halten werden weitere legale Parkplätze eingerichtet.</p> <p>Die beschriebene Lösung wurde aus zwei Gründen gewählt: man möchte den Baumbestand erhalten und glaubt die „Gehweg Fahrrad frei“ wäre für die Schülerinnen und Schüler der nahgelegenen Schulen eine sicherere Alternative zum Mischverkehr.</p> <p>Die Lösung überzeugt nicht. Gemischte Rad- und Gehwege sind ein Feigenblatt um dem KFZ-Verkehr den Vorrang einzuräumen. Die Straße alternativ zu beruhigen und auf 30 km/h zu reduzieren wurde nicht untersucht. </p> <p>
    <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008284">Erläuterung
    und Lagepläne des ersten Entwurfs</.a><br>
    Siehe auch: <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008877">Regionalausschuss lehnt diese Planung ab</.a></p>
    """
  end
end
