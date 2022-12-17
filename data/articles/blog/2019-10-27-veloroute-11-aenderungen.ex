defmodule Data.Article.Blog.Veloroute11Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-10-27]

  def title(), do: "Änderungen Veloroute 11 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["11"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Auf der <.a name="alltagsroute-11">Veloroute 11</.a> hat sich einiges getan. Kurz nach dem Start am Rathaus quert man die nun fertiggestellte <.m bounds="9.983681,53.546176,9.991169,53.550634" ref="11">Kreuzung am Rödingsmarkt</.m>. Auch die umliegenden Straßen sind fertig umgebaut – vor einem Jahr musste man sich hier noch durch eine Baustelle schlängeln. Die Velorouten schlagen an dieser Kreuzung zwar eine bestimmte Route vor, aber man muss diesen nicht folgen – mit dem Rad gibt es praktisch überall Abbiegemöglichkeiten.</p> <p>Nur ein paar Kilometer weiter gibt's am <.m bounds="9.957343,53.538503,9.974545,53.548747" ref="11">alten Elbtunnel</.m> die nächste Verbesserung: die östliche Röhre ist fertig renoviert und bietet einen etwas besseren Fahrbelag. Für den Alltag wichtiger sind jedoch die verlängerten Öffnungszeiten der großen Aufzüge und die Sperrung für PKW. Die zeitweise Schiebestrecke oder lange Wartezeiten vor den Personenaufzügen entfallen somit.</p> <p>Auf Wilhelmsburg wurde die <.m bounds="9.978957,53.515017,9.986763,53.519665" ref="11">Fährstraße</.m> erneuert. Der Belag ist jetzt besonders angenehm zu befahren. Vor allem rumpelige Querung der alten Schienen entfällt nun. </p> <p>Mit der Verlegung der <.m bounds="9.955224,53.474291,10.025476,53.516129" ref="11">Wilhelmsburger Reichsstraße</.m>  sind weite Teile der Strecke nun deutlich ruhiger. Auf den Fotos von Mitte 2019 ist die Altbaustrecke noch in Betrieb.</p> <p>Abgeschlossen wurde auch der Neubau der <.m bounds="9.985084,53.456352,9.992316,53.46066" ref="11">Hannoverischen Brücke</.m>, der auf den Bildern sichtbare Slalom entfällt. Stattdessen gibt es hier Radfahrstreifen auf der Fahrbahn.</p> <p>Wenn ich etwas übersehen habe, <.mailto>schreib mir</.mailto> bitte. Die meisten Bilder sind von Ende August 2019.</p>
    """
  end
end
