defmodule Data.Article.Blog.AnDerAlster do
  use Article.Default

  def name(), do: "#{created_at()}-an-der-alster"
  def created_at(), do: ~D[2021-02-19]

  def title(), do: "An der Alster (Veloroute 5 und 6)"

  def type(), do: :intent

  def tags(), do: ["fahrradstraße", "5", "6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Nebenstraße wurde Ende 2018 etwas fahrradfreundlicher umgebaut, sodass der Radverkehr vornehmlich auf dem Asphalt, statt einem schmäleren Radweg daneben fährt. Im gleichen Zug wurden die Fuß- bzw. Radampeln abgeschalten, sodass man hier größtenteils unterbrechungsfrei fahren kann. Leider nutzen viele Autofahrende die Strecke zum Ausweichen, sollte sich auf der Hauptstraße Stau gebildet haben. </p>

    <h4>Vorhaben</h4>
    <p>Der Bezirk hat beschlossen, das in der Nebenstraße eine Fahrradstraße geplant werden soll. Der Stadtteilbeirat St. Georg hatte dies bereits seit langer Zeit gefordert. Der <abbr title="Landesbetrieb Straßen, Brücken und Gewässer">LSBG</abbr> soll nun die Umsetzung planen.</p>

    <h4>Meinung</h4>
    <p>Der Auftrag das Teilstück umzuplanen ist längst überfällig. Es ist zu hoffen, das der LSBG eine gute Lösung findet, die den KFZ-Durchgangsverkehr aus der Straße fernhält. Bisher müssen Rad- und Fußverkehr mit rasenden oder drängelnden Autofahrenden rechnen.</p>

    <h4>Quelle</h4>
    <ul>
    <li>
    <.a href="https://sitzungsdienst-hamburg-mitte.hamburg.de/bi/vo020.asp?VOLFDNR=1013998">Beschluss des Bezirks</.a>
    </li>
    <li>
    <.a href="https://www.ndr.de/nachrichten/hamburg/Bezirk-Hamburg-Mitte-beschliesst-neue-Fahrradstrasse,fahrradstrasse152.html">Artikel des NDR</.a>
    </li>
    </ul>
    """
  end
end
