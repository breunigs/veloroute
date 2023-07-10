defmodule Data.Article.Blog.NeubergerwegHoheLiedt do
  use Article.Default

  def name(), do: "#{created_at()}-4-neubergerweg-hohe-liedt"
  def created_at(), do: ~D[2019-05-03]
  def updated_at(), do: ~D[2020-06-18]
  def title(), do: "Hohe Liedt (Veloroute 4)"

  def type(), do: :intent

  def tags(), do: ["4"]

  def links(_assigns) do
    [
      {"Regionalausschuss lehnt 1. Entwurf ab", "November 2019",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008877"},
      {"1. Entwurf", "August 2019",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008284"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Juli 2023</h4>
    <p>Im Zuge der <.a name="2023-07-10-rsw-bad-bramstedt-hohe-liedt-bis-langenhorner-chaussee">Planung zum Radschnellweg Bad Bramstedt</.a> soll der Neubergerweg umgebaut werden. Bitte siehe dort für Details.</p>

    <h4>Stand Mitte 2020</h4>
    <p>Eine <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1009454">weitere Diskussion</.a> um die Verkehrsführung an diesem Teilstück blieb ebenfalls weitgehend ergebnislos. Die Interessen des Rad- und Fußverkehrs lassen sich schlecht mit dem ebenfalls gewünschten „Hamburg Takt“ (salopp: besserer Nahverkehr) vereinen. Die gesetzliche Lage erschwert die Einrichtung von Tempo 30 offenbar zusätzlich. Das Zeitfenster für einen Umbau wäre Herbst 2020, den man aber ggf. verstreichen lassen würde. Der nächstmögliche Termin wäre dann erst 2023.</p>

    <h4>Stand Dezember 2019</h4>
    <p>Der <.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008877">Regionalausschuss</.a> lehnt die vorliegende Planung einstimmig ab und bittet den Bezirksamtleiter diese zu überarbeiten.</p>

    <p>Der Streckenabschnitt auf dem <.m bounds="10.00206,53.66678,10.019556,53.669298">Neubergerweg</.m> bzw. <.m bounds="10.019556,53.668364,10.034971,53.67015">Hohe Liedt</.m> leidet an unebenen und baufälligen Radwegen. Diese sind teils nur über den Grünstreifen zu erreichen und werden häufig von Falschparkern „mitbenutzt“. Die 50 km/h machen das Fahren auf der Fahrbahn unangenehm, die dafür aber mit guter Oberfläche punktet.</p>

    <p>Die im ersten Entwurf vorliegende Umplanung sieht vor die alten Radwege komplett zu entfernen. Stattdessen soll der Radverkehr künftig hauptsächlich im Mischverkehr auf der Fahrbahn fahren oder in Schrittgeschwindigkeit auf dem Gehweg („Fahrrad frei“, auch bekannt als „Service-Lösung“).</p>

    <p>Einzige Ausnahme bildet ein einseitiger Radfahrstreifen ab der <.m bounds="10.016207,53.667931,10.020083,53.670239">U-Bahn Brücke bis kurz nach Einmündung Fibingerstraße</.m>. Dieser ist mit rund 2m aber ordentlich breit. Um diesen frei von Falschparkern zu halten werden weitere legale Parkplätze eingerichtet.</p>

    <p>Die beschriebene Lösung wurde aus zwei Gründen gewählt: man möchte den Baumbestand erhalten und glaubt die „Gehweg Fahrrad frei“ wäre für die Schülerinnen und Schüler der nahgelegenen Schulen eine sicherere Alternative zum Mischverkehr.</p>

    <p>Die Lösung überzeugt nicht. Gemischte Rad- und Gehwege sind ein Feigenblatt um dem KFZ-Verkehr den Vorrang einzuräumen. Die Straße alternativ zu beruhigen und auf 30 km/h zu reduzieren wurde nicht untersucht. </p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
