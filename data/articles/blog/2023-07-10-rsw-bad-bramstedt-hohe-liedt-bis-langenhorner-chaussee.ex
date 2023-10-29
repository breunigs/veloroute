defmodule Data.Article.Blog.RswBadBramstedtHoheLiedtBisLangenhornerChaussee do
  use Article.Default

  def title(), do: "Langenhorner Chaussee – Hohe Liedt (Radschnellweg Bad Bramstedt, Veloroute 4)"

  def summary(),
    do:
      "3m – 4m breite Zweirichtungsradwege in Langenhorner Chaussee und Neubergerweg. Fibingerstraße wird Fahrradstraße mit Vorfahrt und engerer Fahrbahn."

  def type(), do: :planned

  def tags(), do: ["rsw-bad-bramstedt", "rsw", "n24", "4", "br-nord-n1"]

  def links(_assigns) do
    [
      {"1. Entwurf", "Juli 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013034"},
      {"Detailbetrachtung Routenverlauf", "Juli 2023",
       "https://www.hamburg.de/hamburg-nord/planen-bauen-wohnen/17015804/vorzugstrasse-radschnellweg/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Vorstellung</h4>
    <p>Die Planung soll am 17. Juli 2023, 18 Uhr im <.m bounds="9.996444,53.671403,9.99823,53.672369">ella Kulturhaus</.m> öffentlich vorgestellt werden. <.a href="https://www.hamburg.de/hamburg-nord/pressemitteilungen/17222690/radschnellweg-vorstellung-planung/">Weitere Informationen</.a>.</p>

    <h4>Alter Zustand</h4>
    <p>Die <.ref>Hochbordradwege</.ref> im <.v bounds="10.015687,53.668256,10.021982,53.670465" lon={10.018514} lat={53.669128} dir="backward" ref="4">Neubergerweg</.v> sind schmal, heruntergekommen und damit kaum befahrbar. In der <.v bounds="9.999254,53.668028,10.021792,53.67794" lon={10.012415} lat={53.675545} dir="backward" ref="4">Fibigerstraße</.v> fährt man im <.ref>Mischverkehr</.ref> mit den Autos. Am Straßenrand abgestellte Autos verhindern bei Gegenverkehr ein flüssiges Vorankommen. In der <.v bounds="9.998495,53.676334,10.004074,53.681774" lon={10.000533} lat={53.678482} dir="backward" ref="4">Langenhorner Chaussee</.v> gibt es eigene Radwege im Hochbord oder als <.ref>Radfahrstreifen</.ref>. Vorfahrt entlang des Radschnellweges gibt es bisher nicht.</p>

    <h4>Planung (1. Entwurf, 2023)</h4>
    <p>Im <.v bounds="10.015963,53.668257,10.020883,53.669871" lon={10.01845} lat={53.669132} dir="backward" ref="4">Neubergerweg</.v> wird auf der Südseite ein eigener Zweirichtungsradweg gebaut. Wegen Bäumen und der U-Bahn-Brücke wird er meist nur 3,0m breit. Zwischen den Engstellen sind 4,0m geplant. Zur Fahrt in Richtung <.v bounds="10.018369,53.668722,10.023289,53.670337" lon={10.019456} lat={53.669263} dir="backward" ref="4">Hohe Liedt</.v> ist eine längere Einfädelungsmöglchkeit vorgesehen. Aus der Gegenrichtung ist nur eine schmale Auffahrt geplant.</p>

    <p>Die <.v bounds="9.99973,53.667505,10.018366,53.678003" lon={10.013185} lat={53.675166} dir="backward" ref="4">Fibigerstraße</.v> soll Fahrradstraße werden und durchgängig Vorfahrt erhalten. Die Fahrbahn wird enger gestaltet. Im <.v bounds="10.014386,53.667839,10.018946,53.675062" lon={10.016148} lat={53.67318} dir="backward" ref="4">bereits umgebauten, südlichen Teil</.v> durch Markierungen; im <.v bounds="9.999567,53.672914,10.016873,53.678152" lon={10.007892} lat={53.676699} dir="backward" ref="4">nördlichen Teil</.v> werden die Randsteine versetzt. Teilweise werden bauliche Parkplätze für KFZ errichtet, da auf der Fahrbahn nicht mehr geparkt werden kann.</p>

    <p>In der <.v bounds="9.998013,53.675697,10.006061,53.68208" lon={10.000362} lat={53.679032} dir="backward" ref="4">Langenhorner Chaussee</.v> ist auf der Westseite ein 4,0m breiter Zweirichtungsradweg geplant. An der <.v bounds="9.998013,53.675697,10.006061,53.68208" lon={10.000807} lat={53.681303} dir="backward" ref="rsw-bad-bramstedt">Landesgrenze zu Norderstedt</.v> und im Bereich der <.v bounds="9.998013,53.675697,10.006061,53.68208" lon={10.000597} lat={53.678134} dir="backward" ref="4">Haltestelle Ochsenzoll</.v> sind nur 3,0m vorgesehen. Ein Zaun zwischen Bushaltestelle und Radweg soll den Personenstrom lenken und die Konfliktstellen reduzieren. Die Ampeln entlang des Abschnitts entfallen für den Radverkehr.</p>

    <p>Zwischen der <.v bounds="10.00005,53.676586,10.002521,53.678305" lon={10.001014} lat={53.677494} dir="backward" ref="4">Haltestelle und der Fibigerstraße</.v> soll nicht umgebaut werden. Dieser Abschnitt ist in einem <.a name="2020-06-16-ampel-ochsenzoll">älteren Artikel</.a> näher beschrieben.</p>

    <h4>Machbarkeitsstudie (2021)</h4>
    <p>Ursprünglich war vorgesehen, den Radschnellweg länger entlang der U-Bahn verlaufen zu lassen und ihn am <.v bounds="9.998635,53.674269,10.017451,53.680618" lon={10.012309} lat={53.6777} dir="backward" ref="rsw-bad-bramstedt">Foßberger Moor</.v> in den Straßenverkehr zu überführen. In der Detailbetrachtung entschied man sich für die oben beschriebene Führung, weil diese kürzer, billiger und mit weniger KFZ belastet ist.</p>

    <h4>Meinung</h4>
    <p>Die Planung ist gut, bietet aber nicht die gleiche Qualität wie die in der Machbarkeitsstudie vorgeschlagene Strecke. Dies ließe sich auch mit der neuen Führung erreichen, sofern man weitere Maßnahmen trifft um den KFZ-Verkehr zu reduzieren. In der Fibigerstraße bieten sich z.B. KFZ-Einbahnstraßen oder Diagonaltrenner an.</p>

    <p>Die Anschlüsse der Fibigerstraße sollten ebenfalls noch optimiert werden. In Richtung Neubergerweg soll man <.v bounds="10.01565,53.667856,10.019543,53.670043" lon={10.016726} lat={53.668964} dir="backward" ref="4">hinter einem Baum herumkurven</.v>, statt in „Ideallinie“ links abbiegen zu können. In Richtung Langenhorner Chaussee wäre eine direkte Querung statt zwei Mal 90°-Kurve am Besten. Zumindest sollte aber das <.v bounds="9.999144,53.667856,10.019543,53.679092" lon={10.001424} lat={53.677049} dir="forward" ref="4">Stop-Schild</.v> für den Radverkehr weg.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
