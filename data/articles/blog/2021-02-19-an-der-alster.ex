defmodule Data.Article.Blog.AnDerAlster do
  use Article.Default

  def created_at(), do: ~D[2021-02-19]
  def updated_at(), do: ~D[2022-03-23]

  def title(), do: "An der Alster (Veloroute 5 und 6)"

  def summary(),
    do:
      "Fahrradstraße als Vorabmaßnahme. Protected-Bike-Lane im Anschluss bis zur Hohenfelder Bucht."

  def type(), do: :planned
  def start(), do: ~d[2022-07]
  def stop(), do: ~d[2022-09]

  def tags(), do: ["fahrradstraße", "5", "6"]

  def links(_assigns) do
    [
      {"Vorabmaßnahme – Plan", "2022",
       "https://lsbg.hamburg.de/contentblob/16014672/f407e06e85ec58433086e86234740e8c/data/alster-fahrradachsen-an-der-alster-vorwegmassnahme-abgestimmte-planung-plan.pdf"},
      {"Vorabmaßnahme – Erläuterungsbericht", "2022",
       "https://lsbg.hamburg.de/contentblob/16014652/97449df8fa9863e5995fba7e5ef2f9a3/data/alster-fahrradachsen-an-der-alster-vorwegmassnahme-abgestimmte-planung-bericht.pdf"},
      {"Bezirksamtsbeschluss zur Fahrradstraße", "2021",
       "https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1013998"},
      {"NDR Artikel zum Beschluss zur Fahrradstraße", "Archiv, 2021",
       "https://web.archive.org/web/20210227183505/https://www.ndr.de/nachrichten/hamburg/Bezirk-Hamburg-Mitte-beschliesst-neue-Fahrradstrasse,fahrradstrasse152.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand März 2022</h4>
    <p>Pläne zur Vorabmaßnahme „Fahrradstraße“ wurden veröffentlicht. Der Artikel wurde angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>Die Nebenstraße wurde Ende 2018 etwas fahrradfreundlicher umgebaut, sodass der Radverkehr vornehmlich auf dem Asphalt, statt einem schmäleren Radweg daneben fährt. Im gleichen Zug wurden die Fuß- bzw. Radampeln abgeschalten, sodass man hier größtenteils unterbrechungsfrei fahren kann. Leider nutzen viele Autofahrende die Strecke zum Ausweichen, sollte sich auf der Hauptstraße Stau gebildet haben. </p>

    <h4>Planung</h4>
    <p>Die <.m bounds="10.00243,53.556592,10.004928,53.557646" lon="10.003373" lat="53.556885" dir="forward" ref="5">Nebenfahrbahn auf der man heute fährt</.m>, soll in einer Vorabmaßnahme zu einer Fahrradstraße umgestaltet werden. Dazu soll die Führung auf <.m bounds="10.004046,53.557173,10.005693,53.557921" lon="10.004996" lat="53.557563" dir="forward" ref="5">Höhe der Alstertwiete</.m> so angepasst werden, das KFZ eher auf die Hauptfahrbahn gelenkt werden. Zudem soll die Fahrradstraße auf gesamter Länge rot eingefärbt werden – erstmalig in Hamburg durch Einfärbung des Asphalts, statt mit aufgetragenem Plastik. Die <.ref>Dooring-Zone</.ref> soll dabei klassisch schwarz bleiben, um den Gefahrenbereich zu verdeutlichen.</p>

    <p>Nach der <.m bounds="10.010244,53.559391,10.01199,53.560316" lon="10.010903" lat="53.559896" dir="forward" ref="5">Schmilinskystraße</.m> soll eine KFZ-Spur in eine <.ref>Protected-Bike-Lane</.ref> umgewandelt werden. Diese geht nach der <.m bounds="10.012213,53.560333,10.014309,53.561839" lon="10.013308" lat="53.560923" dir="forward" ref="5">Lohmühlenstraße</.m> in die <.a href="/article/2018-10-10-5-6-hohenfelder-bucht">Planung der Hohenfelder Bucht</.a> über.</p>

    <p>Die Einmündung der <.m bounds="10.012213,53.560333,10.014309,53.561839" lon="10.013308" lat="53.560923" dir="forward" ref="5">Lohmühlenstraße</.m> wird leicht angepasst. Auf der Alsterseite sollen zu Lasten der KFZ Aufstellflächen für den Fuß- und Radverkehr geschaffen werden, damit diese nicht mehr <em>auf</em> dem Radweg auf Grün warten müssen. Auf der Häuserseite soll die Führung in Richtung <.m bounds="10.014369,53.558068,10.01886,53.560157">Lohmühlenpark</.m> verdeutlicht werden, damit der Radverkehr nicht mehr unabsichtlich geisterradelt.</p>

    <p>Die Vorabmaßnahme kommt ohne große Eingriffe in die Raumaufteilung aus. Die vollständige Umplanung soll erst in späteren Jahren stattfinden.</p>

    <h4>Meinung</h4>
    <p>Eine tolle Sache: Mitte 2021 angeregt, bis Frühjahr 2022 geplant und umgesetzt werden soll ab Sommer 2022. Die Vorabmaßnahme wird die Situation für den Radverkehr in Fahrtrichtung stadtauswärts bereits verbessern. Detailprobleme sollen erst mit der vollständigen Umplanung angegangen werden, weswegen sich die Kritik dazu aktuell nicht lohnt. Leider bedeutet dies auch, das der Radverkehr auf Alsterseite weiterhin ausharren muss.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
