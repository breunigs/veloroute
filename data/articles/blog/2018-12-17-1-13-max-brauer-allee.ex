defmodule Data.Article.Blog.MaxBrauerAllee do
  use Article.Default

  def name(), do: "#{created_at()}-1-13-max-brauer-allee"
  def created_at(), do: ~D[2018-12-17]

  def title(), do: "Max-Brauer-Allee (Busbahnhof bis Holstenstraße, Veloroute 1 und 13)"

  def type(), do: :planned

  def tags(), do: [1, 13]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Aktuell ist die <.m bounds="9.935822,53.546191,9.960124,53.563733">Max-Brauer-Allee</.m> für den Radverkehr untauglich: Radweg, Mitbenutzung der Busspur oder Mischverkehr wechseln sich je nach genauer Stelle und Tageszeit ab. Für den Radverkehr wichtige Strecken sind nicht erkennbar – etwa Richtung <.m bounds="9.925712,53.551572,9.933741,53.552223">Ottenser Hauptstraße</.m> oder wie man links aus der <.m bounds="9.851052,53.555214,9.950356,53.609761">Chemnitzstraße</.m> abbiegen soll, um der Veloroute 1 zu folgen. Zusammen mit den in die Jahre gekommenen Belägen lässt sich also zusammenfassen, das die <.m bounds="9.935822,53.546191,9.960124,53.563733">Max-Brauer-Allee</.m> eher abstoßend auf den Radverkehr wirkt.</p> <p>Die Umplanung verbessert die Situation erheblich, obwohl platzbedingt an einigen Stellen Kompromisse eingegangen werden mussten. Meistens werden Radfahrstreifen gebaut, die alle mindestens 1,80m breit sind. In Richtung Elbe gibt ab der <.m bounds="9.812025,53.549667,9.955886,53.655544">Holstenstraße</.m> bis zur <.m bounds="9.937809,53.55351,9.939379,53.556657">Goetheallee</.m> und auf der Höhe des <.m bounds="9.933242,53.55144,9.937021,53.552459">Paul-Nevermann-Platz</.m>es (vorm Bahnhof) dagegen eine überbreite Busspur: hier teilen sich Radverkehr und Bus eine 4,70m breite Spur. Im Vergleich zu jetzt soll diese Spur ausschließlich dem Rad- und Busverkehr dienen.</p> <p>Die provisorische Radverkehrsführung auf dem Fußweg vorm Bahnhof Altona wird auf die Zufahrt zum Busbahnhof verlegt. Im weiteren Verlauf biegt man dann wieder auf die Nebenstraße mit den Parkplätzen für Polizei und Taxen ein. In vielen Fällen kann man hier auch direkt abbiegen. Nur wenn man kommt von Süden kommt und Richtung Bahnhof abbiegen möchte, funktioniert es anders. Entweder nutzt man den Überweg Höhe <.m bounds="9.936218,53.551473,9.940102,53.551759">Neue Große Bergstraße</.m> zum Wenden und biegt anschließend Richtung Busbahnhof ein. Alternativ fährt man ein Stückchen Richtung <.m bounds="9.937021,53.551141,9.948589,53.552419">Große Bergstraße</.m> weiter und biegt hier indirekt in den <.m bounds="9.933242,53.55144,9.937021,53.552459">Paul-Nevermann-Platz</.m> ein.</p> <p>Die Kreuzung an der <.m bounds="9.936069,53.555227,9.942441,53.555826">Julius-Leber-Straße</.m> bedenkt jetzt alle gängigen Radrelationen. Die nah am Gebäude verlaufende Führung aus der <.m bounds="9.851052,53.555214,9.950356,53.609761">Chemnitzstraße</.m> (Veloroute 1) wird als 3,0m breiter Zweirichtungsradweg gestaltet und verbindet geradlinig mit der <.m bounds="9.939676,53.555385,9.943379,53.559793">Gerichtstraße</.m> (Veloroute 13). Über diesen Überweg werden auch die Linksabbieger aus der <.m bounds="9.935822,53.546191,9.960124,53.563733">Max-Brauer-Allee</.m> von Süden abgewickelt. Aus der <.m bounds="9.851052,53.555214,9.950356,53.609761">Chemnitzstraße</.m> der Veloroute 1 folgen bleibt im Wesentlichen so wie jetzt – allerdings gibt es künftig helfende Piktogramme und eine eigene Ampel für den kreuzenden Verkehr aus der <.m bounds="9.936069,53.555227,9.942441,53.555826">Julius-Leber-Straße</.m>. Letztere erhält Schutzstreifen von 1,50m Breite. Die <.m bounds="9.939676,53.555385,9.943379,53.559793">Gerichtstraße</.m> wird für den KFZ-Verkehr eine Sackgasse und erhält keinen Anschluss an die <.m bounds="9.935822,53.546191,9.960124,53.563733">Max-Brauer-Allee</.m> mehr. Geübte Radfahrende aus Richtung Süden mit Ziel <.m bounds="9.934273,53.555587,9.936073,53.555831">Lessingtunnel</.m> können künftig auch direkt über die KFZ-Spuren und die <.m bounds="9.937809,53.55351,9.939379,53.556657">Goetheallee</.m> abbiegen.</p> <p>Die Umsetzung soll in mehreren Abschnitten erfolgen: Ab Sommer 2019 vom Busbahnhof Altona bis ca. <.m bounds="9.937809,53.55351,9.939379,53.556657">Goetheallee</.m>. Dies schließt auch die notwendigen Umbaumaßnahmen an der Kreuzung der <.m bounds="9.937809,53.55351,9.939379,53.556657">Goetheallee</.m> mit der <.m bounds="9.936069,53.555227,9.942441,53.555826">Julius-Leber-Straße</.m> mit ein. Danach ruhen die Arbeiten auf dieser Strecke, da zuerst die <.m bounds="9.812025,53.549667,9.955886,53.655544">Holstenstraße</.m> umgebaut werden soll (siehe „<.a href="/article/2018-08-29-13-holstenplatz">Kreuzungen um den Holstenplatz</.a>“). Erst 2021 soll der Lückenschluss von <.m bounds="9.937809,53.55351,9.939379,53.556657">Goetheallee</.m> zur <.m bounds="9.812025,53.549667,9.955886,53.655544">Holstenstraße</.m> folgen. Der Knotenpunkt <.m bounds="9.936069,53.555227,9.942441,53.555826">Julius-Leber-Straße</.m> mit der <.m bounds="9.935822,53.546191,9.960124,53.563733">Max-Brauer-Allee</.m> wird auch erst zu diesem Zeitpunkt umgebaut.</p> <p><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1008162">Erläuterungsbericht mit Lageplänen</.a> (unter Anlagen). Übersicht Seite 22, Pläne ab Seite 88.</p>
    """
  end
end
