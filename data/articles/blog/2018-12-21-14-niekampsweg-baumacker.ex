defmodule Data.Article.Blog.NiekampswegBaumacker do
  use Article.Default

  def name(), do: "#{created_at()}-14-niekampsweg-baumacker"
  def created_at(), do: ~D[2018-12-21]

  def title(),
    do:
      "Niekampsweg bis Baumacker (Veloroute 14, Kreuzungen Lohkampstraße und Pinneberger Chaussee)"

  def start(), do: ~d[2021-07-18]
  def stop(), do: ~d[2022-04-30]

  def type(), do: :finished
  def construction_site_id_hh(), do: [16327]
  def tags(), do: ["14"]

  def links(_assigns) do
    [
      {"Baustelleninfo Juli 2021",
       "https://lsbg.hamburg.de/contentblob/15261316/14e9ba27ad9cdef6957c2d4a0eb32948/data/pinneberger-chaussee-veloroute-14-07-2021-bis-03-2022.pdf"},
      {"vorläufiger Lageplan",
       "https://lsbg.hamburg.de/contentblob/11989958/95c1ac8d392c018f2db021fcd920a517/data/veloroute-14-pinneberger-chaussee-von-johann-schmidt-strasse-bis-pflugacker-abgestimmte-planung-plan.pdf"},
      {"Erläuterungsbericht zur Umgestaltung",
       "https://lsbg.hamburg.de/contentblob/11989956/22f6a3cbbaa66202e26ea5f22973cdb3/data/veloroute-14-pinneberger-chaussee-von-johann-schmidt-strasse-bis-pflugacker-abgestimmte-planung-bericht.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Wer im Teilabschnitt vom <.m bounds="9.872589,53.605706,9.898859,53.650166">Niekampsweg</.m> bis zum <.m bounds="9.895019,53.611992,9.898712,53.622481">Baumacker</.m> versucht der Veloroute zu folgen, wird sich ohne Navi verfahren. Selbst mit sind die eigenständig geführten Radwege nur schwer zu finden, da sie nicht gekennzeichnet sind und unscheinbar an den Fußweg angrenzen. Die Planung, die ab 2021 umgesetzt werden soll löst diese Probleme. Da es sich um eine bunte Mischung an verschiedenen Maßnahmen handelt, werden diese einzeln betrachtet.</p> <p><.m bounds="9.895044,53.608829,9.897784,53.610461">Niekampsweg zum Radweg</.m>: Der Fußweg erhält auf der Seite des Radweges eine „Nase“, sodass der Radverkehr eine gute Einsicht in den Niekampsweg erhält und umgekehrt. Die Nase wird dabei so lang ausgeführt, das davor bzw. danach parkende KFZ die Sicht nicht behindern. Die Breite der Nase sorgt für eine zusätzliche Verlangsamung des Verkehrs und soll auch Falschparker aus dem Kreuzungsbereich fernhalten. Die Drängelgitter kommen selbstverständlich weg und werden durch einen Poller ersetzt.</p> <p><.m bounds="9.897026,53.609206,9.899766,53.610838">Querung Lohkampstraße</.m>: Die Querung soll begradigt werden, sodass die Führung der Veloroute klarer erkennbar ist. Zusätzlich soll im Querungsbereich etwas verschmälert werden um die Sichtbeziehungen Autos und Radverkehr zu verbessern. Der Zebrastreifen bleibt erhalten, eine Vorfahrt des Radverkehrs ist leider nicht vorgesehen. Immerhin wird der Kreuzungsbereich angehoben, sodass man bei freier Strecke rumpelfrei queren kann. Die in der <.m bounds="9.873612,53.608537,9.903792,53.616528">Lohkampstraße</.m> verlaufenden Hochbordradwege werden vor der Kreuzung jeweils zurückgebaut und auf die Fahrbahn geleitet um die Situation simpel zu halten. Im eigenenständigen Radweg zur <.m bounds="9.885036,53.608624,9.904906,53.621971">Pinneberger Chaussee</.m> soll der gute Teer leider durch Pflastersteine ersetzt werden.</p> <p><.m bounds="9.89825,53.610095,9.90099,53.611727">Radweg in die Pinneberger Chaussee</.m>: Der Radweg soll ordentlich bis an die Fahrbahn herangeführt werden, sodass man bequem von oder zu den neuen Radfahrstreifen auf der <.m bounds="9.885036,53.608624,9.904906,53.621971">Pinneberger Chaussee</.m> kommt. Für Linksabbieger, die der Veloroute folgen wollen wird eine 3,0m breite Mittelinsel eingerichtet, die die Querung in zwei Schritten ermöglicht. Die Insel wird dabei vergleichsweise lang ausgeführt um ein „Umfahren“ zu verhindern – man will also all zu direktes Abbiegen des Radverkehrs verhindern. Die Radfahrstreifen fallen mit 1,85m (wobei 0,25m Markierung sind) eher schmal aus.</p> <p><.m bounds="9.897112,53.611072,9.899852,53.612704">Pinneberger Chaussee zum Baumacker</.m>: Das Kreuzungsdesign bleibt im Wesentlichen beim Alten. Die Radfahrstreifen werden bis kurz nach der Ampel fortgesetzt, wonach sie auf die vorhandenen Hochbordradwege aufgeleitet werden. Beim Rechtsabbieger in den <.m bounds="9.895019,53.611992,9.898712,53.622481">Baumacker</.m> wird der Fußweg jedoch weiter in die Kreuzung hineingezogen, sodass die Geschwindigkeit reduziert werden muss. Aktuell kann man aus der Pinneberger Chaussee praktisch geradeausfahren – und übersieht so ggf. leichter Radfahrende.</p> <p>Unterm Strich wirkt die Planung ausgewogen und verbessert sowohl Komfort als auch Sicherheit für den Radverkehr.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
