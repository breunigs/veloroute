defmodule Data.Article.Blog.Veloroute10Aenderungen do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-10-aenderungen"
  def created_at(), do: ~D[2019-10-20]

  def title(), do: "Änderungen Veloroute 10 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["10"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Auf der <.a href="/10">Veloroute 10</.a> nicht sich nicht so viel getan. Klar, <.a href="/10#16/53.533384/10.025915/gxjuie5aA2XiRQdf3YGgqg">die Baustelle um die neuen Bahnhalte Elbbrücken</.a> hat sich etwas geändert, aber sie ist leider noch nicht so weit fortgeschritten, dass man mit dem Fahrrad schon die Früchte der Arbeit ernten könnte.</p>
    <p>Eine kleine Verbesserung gab es dennoch: Am <.a href="/10#18/53.529767/10.022436/h1jhVEzk6W4xc48Sk7QOkQ">Veddeler Marktplatz</.a> wurde die Ampel aufgerüstet, sodass jetzt automatisch Grün für den Radverkehr angefordert wird. Dazu sollte man der Radspur genau folgen und ggf. das Aufleuchten des Handtasters prüfen. Wenn die Anmeldung geklappt hat, kommt man aber gut in einem Schwung über beide Furten – eine deutliche Verbesserung zu früher.</p>
    <p>Wenn ich etwas übersehen habe, <.mailto>schreib mir</.mailto> bitte. Die meisten Bilder sind von Anfang August 2019.</p>
    """
  end
end
