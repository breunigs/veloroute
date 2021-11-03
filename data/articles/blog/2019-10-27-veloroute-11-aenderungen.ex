defmodule Data.Article.Blog.Veloroute11Aenderungen do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-11-aenderungen"
  def created_at(), do: ~D[2019-10-27]

  def title(), do: "Änderungen Veloroute 11 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["11"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Auf der <.a href="/11">Veloroute 11</.a> hat sich einiges getan. Kurz nach dem Start am Rathaus quert man die nun fertiggestellte <.a href="/11#16.55/53.548405/9.987425/xof30qcm6nYA_wwYGoobOg">Kreuzung am Rödingsmarkt</.a>. Auch die umliegenden Straßen sind fertig umgebaut – vor einem Jahr musste man sich hier noch durch eine Baustelle schlängeln. Die Velorouten schlagen an dieser Kreuzung zwar eine bestimmte Route vor, aber man muss diesen nicht folgen – mit dem Rad gibt es praktisch überall Abbiegemöglichkeiten.</p> <p>Nur ein paar Kilometer weiter gibt's am <.a href="/11#15.35/53.543625/9.965944/V07z7tl1EeiLNW03HjZAxA">alten Elbtunnel</.a> die nächste Verbesserung: die östliche Röhre ist fertig renoviert und bietet einen etwas besseren Fahrbelag. Für den Alltag wichtiger sind jedoch die verlängerten Öffnungszeiten der großen Aufzüge und die Sperrung für PKW. Die zeitweise Schiebestrecke oder lange Wartezeiten vor den Personenaufzügen entfallen somit.</p> <p>Auf Wilhelmsburg wurde die <.a href="/11#16.49/53.517341/9.98286/VX2jEoPDIZJbvmHEUXm9OQ">Fährstraße</.a> erneuert. Der Belag ist jetzt besonders angenehm zu befahren. Vor allem rumpelige Querung der alten Schienen entfällt nun. </p> <p>Mit der Verlegung der <.a href="/11#13.32/53.49521/9.99035/uPTLXr4JoSc4uAYr-1tyvA">Wilhelmsburger Reichsstraße</.a>  sind weite Teile der Strecke nun deutlich ruhiger. Auf den Fotos von Mitte 2019 ist die Altbaustrecke noch in Betrieb.</p> <p>Abgeschlossen wurde auch der Neubau der <.a href="/11#16.6/53.458506/9.9887/EvU75acDBjJqzQe5nH3eEg">Hannoverischen Brücke</.a>, der auf den Bildern sichtbare Slalom entfällt. Stattdessen gibt es hier Radfahrstreifen auf der Fahrbahn.</p> <p>Wenn ich etwas übersehen habe, <.mailto>schreib mir</.mailto> bitte. Die meisten Bilder sind von Ende August 2019.</p>
    """
  end
end
