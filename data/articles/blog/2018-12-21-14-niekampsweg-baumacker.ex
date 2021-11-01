defmodule Data.Article.Blog.NiekampswegBaumacker do
  use Article.Default

  def name(), do: "#{created_at()}-14-niekampsweg-baumacker"
  def created_at(), do: ~D[2018-12-21]

  def title(),
    do:
      "Niekampsweg bis Baumacker (Veloroute 14, Kreuzungen Lohkampstraße und Pinneberger Chaussee)"

  def start(), do: ~d[2021-07-18]
  def stop(), do: ~d[2022-04-30]

  def type(), do: :construction
  def construction_site_id_hh(), do: [16327]
  def tags(), do: ["14"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Wer im Teilabschnitt vom <.m bounds="9.872589,53.605706,9.898859,53.650166">Niekampsweg</.m> bis zum <.m bounds="9.895019,53.611992,9.898712,53.622481">Baumacker</.m> versucht der Veloroute zu folgen, wird sich ohne Navi verfahren. Selbst mit sind die eigenständig geführten Radwege nur schwer zu finden, da sie nicht gekennzeichnet sind und unscheinbar an den Fußweg angrenzen. Die Planung, die ab 2021 umgesetzt werden soll löst diese Probleme. Da es sich um eine bunte Mischung an verschiedenen Maßnahmen handelt, werden diese einzeln betrachtet.</p> <p><.a href="/#18/53.609645/9.896414">Niekampsweg zum Radweg</.a>: Der Fußweg erhält auf der Seite des Radweges eine „Nase“, sodass der Radverkehr eine gute Einsicht in den Niekampsweg erhält und umgekehrt. Die Nase wird dabei so lang ausgeführt, das davor bzw. danach parkende KFZ die Sicht nicht behindern. Die Breite der Nase sorgt für eine zusätzliche Verlangsamung des Verkehrs und soll auch Falschparker aus dem Kreuzungsbereich fernhalten. Die Drängelgitter kommen selbstverständlich weg und werden durch einen Poller ersetzt.</p> <p><.a href="/#18/53.610022/9.898396">Querung Lohkampstraße</.a>: Die Querung soll begradigt werden, sodass die Führung der Veloroute klarer erkennbar ist. Zusätzlich soll im Querungsbereich etwas verschmälert werden um die Sichtbeziehungen Autos und Radverkehr zu verbessern. Der Zebrastreifen bleibt erhalten, eine Vorfahrt des Radverkehrs ist leider nicht vorgesehen. Immerhin wird der Kreuzungsbereich angehoben, sodass man bei freier Strecke rumpelfrei queren kann. Die in der <.m bounds="9.873612,53.608537,9.903792,53.616528">Lohkampstraße</.m> verlaufenden Hochbordradwege werden vor der Kreuzung jeweils zurückgebaut und auf die Fahrbahn geleitet um die Situation simpel zu halten. Im eigenenständigen Radweg zur <.m bounds="9.885036,53.608624,9.904906,53.621971">Pinneberger Chaussee</.m> soll der gute Teer leider durch Pflastersteine ersetzt werden.</p> <p><.a href="/#18/53.610911/9.89962">Radweg in die Pinneberger Chaussee</.a>: Der Radweg soll ordentlich bis an die Fahrbahn herangeführt werden, sodass man bequem von oder zu den neuen Radfahrstreifen auf der <.m bounds="9.885036,53.608624,9.904906,53.621971">Pinneberger Chaussee</.m> kommt. Für Linksabbieger, die der Veloroute folgen wollen wird eine 3,0m breite Mittelinsel eingerichtet, die die Querung in zwei Schritten ermöglicht. Die Insel wird dabei vergleichsweise lang ausgeführt um ein „Umfahren“ zu verhindern – man will also all zu direktes Abbiegen des Radverkehrs verhindern. Die Radfahrstreifen fallen mit 1,85m (wobei 0,25m Markierung sind) eher schmal aus.</p> <p><.a href="/#18/53.611888/9.898482">Pinneberger Chaussee zum Baumacker</.a>: Das Kreuzungsdesign bleibt im Wesentlichen beim Alten. Die Radfahrstreifen werden bis kurz nach der Ampel fortgesetzt, wonach sie auf die vorhandenen Hochbordradwege aufgeleitet werden. Beim Rechtsabbieger in den <.m bounds="9.895019,53.611992,9.898712,53.622481">Baumacker</.m> wird der Fußweg jedoch weiter in die Kreuzung hineingezogen, sodass die Geschwindigkeit reduziert werden muss. Aktuell kann man aus der Pinneberger Chaussee praktisch geradeausfahren – und übersieht so ggf. leichter Radfahrende.</p> <p>Unterm Strich wirkt die Planung ausgewogen und verbessert sowohl Komfort als auch Sicherheit für den Radverkehr.</p> <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11989958/95c1ac8d392c018f2db021fcd920a517/data/veloroute-14-pinneberger-chaussee-von-johann-schmidt-strasse-bis-pflugacker-abgestimmte-planung-plan.pdf">vorläufiger Lageplan</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11989956/22f6a3cbbaa66202e26ea5f22973cdb3/data/veloroute-14-pinneberger-chaussee-von-johann-schmidt-strasse-bis-pflugacker-abgestimmte-planung-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a>
    </li>
    <li><.a href="https://lsbg.hamburg.de/contentblob/15261316/b88f42d1b95f459900f9e2fa26186017/data/pinneberger-chaussee-veloroute-14-07-2021-bis-12-2021.pdf">Baustelleninfo Juli 2021</.a></li>
    </ul>
    """
  end
end
