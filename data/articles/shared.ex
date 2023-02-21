defmodule Data.Article.Shared do
  use Phoenix.Component

  def bezirksroute(bezirk, assigns \\ %{})

  def bezirksroute(:eimsbuettel, assigns) do
    ~H"""
    <h4>Bezirksrouten allgemein</h4>
    <p>Bezirksrouten ergänzen die stadtweiten Velorouten. Sie sollen Lücken im Veloroutennetz schließen und lokale Bedarfe abdecken. In Eimsbüttel wurden dazu Untersuchungen durchgeführt und im Februar 2023 ein mögliches Netz für die Bezirksrouten vorgestellt. Die hier dargestellte Führung kommt aus diesen Plänen, wurde aber an aktuelle Begebenheiten angepasst.</p>

    <p>Alle vorgeschlagenen Eimsbütteler Bezirksrouten sind bereits heute befahrbar, aber nicht für den Radverkehr ausgebaut bzw. optimiert. Dies soll schrittweise nach Fertigstellung der Velorouten passieren und wo möglich mit anderen Maßnahmen zusammengelegt werden.</p>

    <p>Für viele Abschnitte gibt es mehrere Vorschläge. Diese müssen noch politisch abgestimmt und auf ihre Machbarkeit hin genauer geprüft werden. Z.B. können Baumwurzeln ungünstig verlaufen, sodass mehr Bäume gefällt werden müssten, als man von ihrem Standort annehmen würde. All das passiert in den Detailplanungen, die dann häufig als eigener Artikel auf <em>veloroute.hamburg</em> vorgestellt werden.</p>
    """
  end
end
