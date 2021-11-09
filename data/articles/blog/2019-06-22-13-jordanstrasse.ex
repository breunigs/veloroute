defmodule Data.Article.Blog.Jordanstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-13-jordanstrasse"
  def created_at(), do: ~D[2019-06-22]

  def title(), do: "Jordanstraße (Veloroute 13)"

  def start(), do: ~d[2020-09-01]
  def stop(), do: ~d[2021-01]

  def type(), do: :finished

  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Bei der <.m bounds="10.040784,53.558087,10.042043,53.560322">Jordanstraße</.m> handelt es sich um eine reine Wohnstraße, die im markierten Abschnitt für KFZ eine Sackgasse darstellt. Entsprechend verkehrsarm ist dieser Abschnitt und daher auch heute gut zu befahren – mit Ausnahme des Kopfsteinpflasters. Daher soll dieses im Frühjahr 2020 durch eine Asphaltdecke ersetzt werden. An der Kreuzung mit der <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.55873, lon: 10.041161, zoom: 18}))}>Carl-Petersen-Straße</.m> werden die Einmündungen etwas enger gefasst um Falschparkern vorzubeugen. Die Rechts-vor-Links Regelung bleibt. Die <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.5607141, lon: 10.0422783, zoom: 18.5}))}>Querung der Sievekingsallee</.m> ist nicht Teil dieser Baumaßnahme.</p> <p>Es ist etwas schade, das man nicht den gesamten Straßenzug zwischen Burgstraße und Sievekingsallee zu einer Fahrradstraße macht. Vermutlich stünde der Umbauaufwand dann aber in keinem Verhältnis zur erlebten Verbesserung. Durch die bessere Einsicht an der Kreuzung dürfte in Zukunft dennoch zügiges Vorankommen möglich sein. Weitere Infos:</p> <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/12717676/2f8747b4f31fcc9d7fa1f30027ee96c4/data/veloroute-13-jordanstrasse-abstimmungsunterlage-plan.pdf">vorläufiger Lageplan</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/12717674/67814bbaa0a2298793a22a49dcb95de7/data/veloroute-13-jordanstrasse-abstimmungsunterlage-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a>
    </li>
    </ul>
    """
  end
end
