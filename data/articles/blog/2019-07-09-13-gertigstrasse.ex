defmodule Data.Article.Blog.Gertigstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-13-gertigstrasse"
  def created_at(), do: ~D[2019-07-09]
  def updated_at(), do: ~D[2020-06-12]
  def title(), do: "Gertigstraße (Veloroute 13)"

  def start(), do: ~d[2022-02-28]
  def stop(), do: ~d[2022-09-30]
  def construction_site_id_hh(), do: [23095]

  def type(), do: :construction

  def tags(), do: ["13"]

  def links(_assigns) do
    [
      {"Pressemitteilung Bauankündigung",
       "https://www.hamburg.de/bvm/medien/15878322/2022-02-14-bvm-fahrradstrasse-winterhude/"},
      {"Lageplan",
       "https://lsbg.hamburg.de/contentblob/13910752/feaafed3ea97bc9c3c4e6a30ca789902/data/veloroute-13-gertigstrasse-abgestimmte-planung-plan.pdf"},
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/contentblob/13910740/d9e67d142f0a5eea576915fd36ebea26/data/veloroute-13-gertigstrasse-abgestimmte-planung-bericht.pdf"},
      {"Baustelleninfo (Februar 2022)",
       "https://lsbg.hamburg.de/contentblob/15826250/50af9aaf16747cb9aa295887258d8e94/data/gertigstrasse-umsetzung-veloroute-13-02-22-bis-09-22.pdf"},
      {"Auftragsvergabe (Bauzeitraum)",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/e88e2ab6-cea1-4adf-898e-08f8f7e1ca86/details"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.581953, lon: 10.015636, zoom: 16.5}))}>Gertigstraße</.m> erlaubt dem Radverkehr momentan die Wahl auf den Hochbordradwegen oder der Fahrbahn zu fahren. Die Radwege sind sehr schmal, teils kurvig und häufig auch von Zufußgehenden belegt. Auf der Fahrbahn kommt man deutlich besser voran, muss sich aber mit den Autos bei 50 km/h Höchstgeschwindigkeit arrangieren.</p>
    <p>Die in einer Mitmachveranstaltung  bevorzugte Variante „Fahrradstraße“ wurde in einem ersten Entwurf detaillierter ausgearbeitet und wird auch so kommen. Da die Gertigstraße schon grob die richtige Form hat, sind nur lokale  Umbauten nötig. Die alten Radwege werden entfernt und dem Fußweg zugeschlagen. Auch die Schutzbügel gegen Falschparker entfallen zugunsten ordentlichen Stellbügeln für Fahrräder. Die Einmündungen bleiben gegenüber der Gertigstraße wartepflichtig, werden jedoch neu verfugt um dem Denkmalschutz Rechnung zu tragen. Am Anfang bzw. Ende der Gertigstraße wird ein kurzes Stück gepflastert um den Wechsel zu einer Fahrradstraße zu verdeutlichen. Wie in allen Fahrradstraßen reduziert sich das Höchsttempo auf 30 km/h.  </p>
    <p>Verkehrsführung und Parkplätze bleiben im Wesentlichen gleich – auch Autos dürfen die Straße weiterhin befahren. Man hat jedoch den Mangel an Fahrradstellplätzen erkannt und ergänzt 86 Anlehnbügel. Auch eine StadtRAD Station kommt hinzu, auf <.m bounds="10.010817,53.581176,10.018665,53.582971" lon="10.0147491" lat="53.5819298" dir="forward">Höhe der Hausnummer 22</.m>.</p>
    <p>Die <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.581146, lon: 10.0119887, zoom: 19}))}>Einmündung in den Mühlenkamp</.m> gilt als bereits umgebaut, die in <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.5830856, lon: 10.018938, zoom: 19}))}>die Barmbeker Straße</.m> wird getrennt geplant. Entsprechend endet die Fahrradstraße jeweils vorher.</p>

    <h4>Umleitung während der Bauzeit</h4>
    <p>In Richtung Komponistenviertel (Südosten) erfolgt die Umleitung über den <.m bounds="10.011374,53.578691,10.020555,53.581769">Hans-Henny-Jahnn Weg</.m>. In Ricthung Eppendorf (Nordwesten) über die <.m bounds="10.008709,53.583004,10.018511,53.587327">Semperstraße</.m>.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
