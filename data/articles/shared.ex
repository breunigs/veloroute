defmodule Data.Article.Shared do
  use Phoenix.Component

  def bezirksroute(bezirk, assigns \\ %{})

  def bezirksroute(:eimsbuettel, assigns) do
    ~H"""
    <h4>Bezirksrouten allgemein</h4>
    <p>Bezirksrouten ergänzen die stadtweiten Velorouten (auch: Radrouten). Sie sollen Lücken im Radnetz schließen und lokale Bedarfe abdecken. In Eimsbüttel wurden dazu Untersuchungen durchgeführt und im Februar 2023 ein mögliches Netz für die Bezirksrouten vorgestellt. Die hier dargestellte Führung kommt aus diesen Plänen, wurde aber an aktuelle Begebenheiten angepasst.</p>

    <p>Alle vorgeschlagenen Eimsbütteler Bezirksrouten sind bereits heute befahrbar, aber nicht für den Radverkehr ausgebaut bzw. optimiert. Dies soll schrittweise nach Fertigstellung der Velorouten passieren und wo möglich mit anderen Maßnahmen zusammengelegt werden.</p>

    <p>Für viele Abschnitte gibt es mehrere Vorschläge. Diese müssen noch politisch abgestimmt und auf ihre Machbarkeit hin genauer geprüft werden. Z.B. können Baumwurzeln ungünstig verlaufen, sodass mehr Bäume gefällt werden müssten, als man von ihrem Standort annehmen würde. All das passiert in den Detailplanungen, die dann häufig als eigener Artikel auf <em>veloroute.hamburg</em> vorgestellt werden.</p>
    """
  end

  def bezirksroute(:wandsbek, assigns) do
    ~H"""
    <h4>Bezirksrouten allgemein</h4>
    <p>Bezirksrouten ergänzen die stadtweiten Velorouten (auch: Radrouten). Sie sollen Lücken im Radnetz schließen und lokale Bedarfe abdecken. In Wandsbek wurden dazu Untersuchungen durchgeführt und Vorschläge für diese Routen gemacht. Im Frühjahr 2023 wurde die Bevölkerung um Hinweise gebeten, die jetzt eingearbeitet werden.</p>

    <p>Alle vorgeschlagenen Wandsbeker Bezirksrouten sind bereits heute befahrbar, aber nicht für den Radverkehr ausgebaut bzw. optimiert. Sofern das Routenkonzept fertig geplant und politisch akzeptiert ist, passiert dies über viele Jahre in Detailplanungen. Diese werden dann häufig als eigener Artikel auf <em>veloroute.hamburg</em> vorgestellt werden.</p>
    """
  end

  def bezirksroute(:nord, assigns) do
    ~H"""
    <h4>Bezirksrouten allgemein</h4>
    <p>Bezirksrouten ergänzen die stadtweiten Velorouten (auch: Radrouten). Sie sollen Lücken im Radnetz schließen und lokale Bedarfe abdecken. In Hamburg-Nord wurde dazu im Oktober 2023 ein Entwurf für ein Routenkonzept veröffentlicht, das mit Hilfe von Beiträgen aus der Bevölkerung entworfen wurde.</p>

    <p>Die vorgeschlagenen Bezirksrouten in Hamburg-Nord sind zu einem großen Teil bereits heute befahrbar, aber nicht für den Radverkehr ausgebaut bzw. optimiert. Gerade an großen Kreuzungen oder kurzen Verbindungsstücken sind Umwege oder Schiebestrecken in Kauf zu nehmen. Die dargestellten Wege orientieren sich an der aktuell möglichen Strecke mit hohem Fahranteil.</p>

    <p>In den nächsten Jahren wird das Routenkonzept fertiggestellt und politisch beschlossen. Erst im Anschluss wird über viele Jahre in Detailplanungen die Abschnitte für den Radverkehr hergerichtet. Diese werden dann häufig als eigener Artikel auf <em>veloroute.hamburg</em> vorgestellt werden.</p>
    """
  end
end
