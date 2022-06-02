defmodule Data.Article.Blog.TilsiterStrasseEckerkoppelW16 do
  use Article.Default

  def name(), do: "#{created_at()}-6-tilsiter-strasse-eckerkoppel-w16"
  def created_at(), do: ~D[2019-10-24]

  def title(), do: "Eckerkoppel und Tilsiter Straße (Veloroute 6)"

  def type(), do: :planned

  def start(), do: ~d[2023]
  def stop(), do: ~d[2024]

  def tags(), do: ["6", "w16.1", "w16.3", "w16.4", "w16"]

  def links(_assigns) do
    [
      {"Möglicher Bautermin", "Stand 2022",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1016643"},
      {"Vorläufige Lagepläne und Erläuterungsbericht",
       "Hinweis: der Erläuterungsbericht ist teilweise nicht mehr aktuell. Siehe auch Abwägungsvermerk.",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1011013"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p><strong>Kurzversion:</strong> in <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.590268, lon: 10.075602, zoom: 16})} ref="6">Tilsiter und Allensteiner Straße</.m> gute Radfahrstreifen, in der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.597824, lon: 10.104462, zoom: 15.47})} ref="6">Eckerkoppel</.m> nur schmale Radfahrstreifen. Alles dazwischen wird nochmal umgeplant und die Veloroute wahrscheinlich verlegt.</p>
    <p><strong>Verlegung Veloroute</strong> Aktuell teilt sich die Veloroute hier auf – stadtauswärts über die Tilsiter Straße, stadteinwärts über die Pillauer Straße. Bei der Umplanung stellte man fest, das sich aufgrund der geringen Breite der Pillauer Straße keine attraktive Route für den Radverkehr herstellen lässt. Stattdessen wird nun erwogen die Führung der Veloroute zu ändern und beide Richtungen über die Tilsiter Straße abzuwickeln. Diese gravierende Umstellung wird nochmal im Detail geplant und dann separat vorgestellt. Im Folgenden werden die von dieser Änderung nicht betroffenen Teile beschrieben. <.a name="2021-04-23-tilsiter-strasse">Detaillierter Artikel</.a>.</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.590268, lon: 10.075602, zoom: 16})} ref="6">Tilsiter und Allensteiner Straße</.m></strong> In der Tilsiter Straße sind Radfahrstreifen vorgesehen, die an <.a name="2019-01-07-6-eulenkamp">Umplanung Eulenkamp</.a> anschließen. Sie sind mindestens 1,5m breit, stellenweise etwas mehr. Nach <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.589732, lon: 10.077091, zoom: 16})} ref="6">der Kreuzung mit der Lesserstraße</.m> läuft der Radfahrstreifen aus, wobei hier noch die o.g. weitere Planung Änderungen bringen dürfte. Neu ist die Freigabe der Allensteiner Straße in beide Richtungen. Der Radfahrstreifen „gegen die Einbahnstraße“ wird durch einen Doppelstreifen abgetrennt und hat mit mehr als 2m eine üppige Breite. In normaler Richtung teilen sich Rad- und KFZ eine Spur. Im Kreuzungsbereich mit der Tilsiter Straße wird eine Linksabbiegerspur ausschließlich für den Radverkehr angelegt.</p>
    <p><strong><.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.597824, lon: 10.104462, zoom: 15.47})} ref="6">Eckerkoppel</.m></strong> Hier sind beidseitig Schutzstreifen von höchstens 1,5m vorgesehen, oftmals nur 1,25m. Teilweise verlaufen diese auch direkt neben Parkplätzen und gefährden den Radverkehr durch unachtsam geöffnete Autotüren, was vom ADFC auch bemängelt wurde. In der Straßenmitte verbleiben 4,5m, was genug Platz für 2 PKW sein sollte. Da der LKW Anteil in der Straße gering ist, die Mindestmaße eingehalten werden und man die Veloroute hier nicht verlegen kann, bleibt man dennoch bei dieser Führungsform.</p>
    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
