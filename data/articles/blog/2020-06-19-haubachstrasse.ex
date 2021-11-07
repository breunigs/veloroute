defmodule Data.Article.Blog.Haubachstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-06-19]
  def updated_at(), do: ~D[2020-08-10]
  def title(), do: "Haubachstraße (Veloroute 13)"

  def start(), do: ~d[2022]

  def type(), do: :planned

  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Stand August 2020</h4> <p>Mittlerweile sind die ersten Entwürfe für die gesamte Haubachstraße öffentlich. Der Artikel wurde angepasst.</p>
    <h4>Bestand</h4> <p>Im Ausbaugebiet ab der <.m bounds="9.940188,53.558988,9.942246,53.559916">Theodor-Haubach-Schule</.m> wird der Radverkehr zusammen mit den KFZ über unebenes Kopfsteinpflaster geführt. Das KFZ-Aufkommen ist gering, da die Haubachstraße für diese praktisch eine Sackgasse ist.</p>
    <h4>Pläne</h4> <p>Die gepflastere Durchfahrt vor der <.m bounds="9.940188,53.558988,9.942246,53.559916">Theodor-Haubach-Schule</.m> wird für KFZ gesperrt und bleibt dem Fuß- und Radverkehr vorbehalten. Im Anschluss folgt eine asphaltierte Fahrradstraße. Diese wird auch für KFZ zugänglich sein, damit diese in den baulichen Parkplätzen abgestellt werden können. Immerhin soll diese Fahrradstraße nur „Anlieger frei“ sein, statt „KFZ frei“ – also nur für direkte Anwohner und deren Besucher, statt für alle KFZ.</p> <p>Um den Sackgassenstummel der <.m bounds="9.942373,53.559927,9.944542,53.56043">Walther-Kunze-Straße</.m> wird dagegen Pflaster verwendet um die Grünanlegen besser zu verbinden. Die Fahrradstraße behält hier ihre Breite und wird im Anschluss wieder in Asphalt ausgebaut.</p> <p>Die Fahrradstraße endet an einem Kreisel. Dieser befindet sich <.m bounds="9.944625,53.560715,9.946338,53.561112">auf Höhe der Eggerstedtstraße</.m> und wird das neue <.m bounds="9.94002,53.55965,9.945931,53.562879">Wohnviertel „Holstenhof“</.m> auf dem ehemaligen Brauereigelände anbinden. Der Kreisverkehr wird eine überfahrbare Mittelinsel haben um auch LKW oder Bussen abbiegen zu ermöglichen. Die Eggerstedtstraße wird nicht angeschlossen und verliert auch die bisherige KFZ-Durchfahrt zur Holstenstraße. Die vorhandene Stützmauer zwischen der Haubachstraße und Eggerstedtstraße soll durch eine Sitzanlage ersetzt werden, die Bänke, Treppen und Stützmauer miteinander kombiniert – von der Idee her vergleichbar mit den Sitzbänken am Jungfernstieg.</p> <p>Der Abschnitt vom Kreisel bis zur Einmündung in die Holstenstraße wird keine Fahrradstraße sondern bleibt wie heute Mischverkehr. Bei geradeeinmal 90m Länge dürfte die Führungsform aber wenig Unterschied machen.</p> <p>Baubeginn für die Straßen im Wohnquartier soll gegen Ende 2021 sein. Der Umbau der Haubachstraße soll erst im Anschluss erfolgen, wenn auch die Hochbauarbeiten im neuen Quartier fertig sind.</p> <h4>Meinung</h4> <p>Die vorliegende Planung ist für den Radverkehr sehr gut, auch abseits eines komfortablen Straßenbelags. Die Sperrung der Durchfahrt für KFZ an der <.m bounds="9.940188,53.558988,9.942246,53.559916">Theodor-Haubach-Schule</.m> verhindert das KFZ den Radverkehr ausbremsen. Auch die Aufwertung des <.m bounds="9.94555,53.560907,9.947263,53.561303">Aufenthaltsraum Nahe des Holstenplatz</.m> für Anwohner und zu Fuß Gehende  ist zu begrüßen. Schade ist lediglich, das der Umbau noch Jahre brauchen wird und die Haubachstraße bis dahin für den Radverkehr unangenehm bleibt. Durch die vielen Baustellen-LKW wird es wahrscheinlich sogar nochmal etwas schlimmer bevor es gut wird.</p> <h4>Quelle</h4> <ul>
    <li><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1010111">Pläne und Erläuterungen zur Erschließung Holsten-Quartier</.a></li>
    <li><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1010226">Pläne und Erläuterungen zum Umbau Haubachstraße</.a></li>
    </ul>
    """
  end
end
