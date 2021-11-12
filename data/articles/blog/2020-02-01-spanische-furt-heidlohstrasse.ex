defmodule Data.Article.Blog.SpanischeFurtHeidlohstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-02-01]

  def title(), do: "Spanische Furt bis Heidlohstraße (Veloroute 14)"

  def start(), do: ~d[2022-07]
  def stop(), do: ~d[2022]

  def type(), do: :planned

  def tags(), do: ["14"]

  def links(_assigns) do
    [
      {"Pressemitteilung zu Tempo-30 Heidlohstraße",
       "https://www.hamburg.de/bvm/medien/15595988/2021-11-12-bvm-heidlohstrasse/"},
      {"Erläuterungen zum ersten Entwurf",
       "https://lsbg.hamburg.de/contentblob/13462690/98e53b0a2d1de123426264d4c696de47/data/veloroute-14-spanische-furt-bis-heidlohstrasse-abstimmungsunterlage-bericht.pdf"},
      {"Vorläufiger Lageplan",
       "https://lsbg.hamburg.de/contentblob/13462694/13418947080d815ffe478c2cb0ab8db4/data/veloroute-14-spanische-furt-bis-heidlohstrasse-abstimmungsunterlage-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Spanische Furt bzw. der Graf-Johann-Weg sind breite Erschließungsstraßen mit viel Autoverkehr, auf denen Radfahren nur mäßig Spaß macht. Die Heidlohstraße ist noch stärker befahren, wobei der Bau des Autobahndeckels hier sicher zu Verzerrungen in der Verkehrsmenge geführt hat. Eigene Radwege sind bisher nicht vorhanden oder durch ihre Baufälligkeit unbenutzbar.</p>

    <p>Der LSBG plant einige Verbesserungen. Im <.m bounds={to_string(Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.625407, lon: 9.914595, zoom: 16}))}>Abschnitt Spanische Furt / Graf-Johann-Weg</.m>  wird Tempo 30 eingerichtet und die Einmündungen schmaler gefasst. Dies reduziert die Geschwindigkeit der einbiegenden Autos und die bessere Übersicht macht das Rechts-vor-Links für den Radverkehr angenehmer. Die Straßeneinengungen (etwa <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.623741, lon: 9.913944, zoom: 17})} ref="14">beim Zebrastreifen</.m>) werden jedoch entfernt um den Busverkehr zu beschleunigen. Jeweils an den Enden dieses Abschnitts dürfen sich Fahrräder künftig vor dem Autoverkehr an den Ampeln aufstellen („<abbr title="Aufgeweiteter Radaufstellstreifen">ARAS</abbr>“).</p>

    <p>An der <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.627305, lon: 9.919038, zoom: 17})} ref="14">Kreuzung mit der Heidlohstraße</.m> wird der Fußweg deutlich schmäler um eine Linksabbiegerspur einrichten zu können. Der Radverkehr teilt sich diese mit den KFZ. Es wird aber auch eine Möglichkeit zum indirekten Linksabbiegen mit eigener Ampel gebaut. Aus dem Graf-Johann-Weg gibt es den bereits erwähnten Aufstellbereich.</p>

    <p>Im Verlauf der Heidlohstraße bis etwa nach dem <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.628097, lon: 9.92029, zoom: 17})} ref="14">Autobahndeckel</.m> werden Radfahrstreifen aufgemalt. Sie fallen mit rund 1,60m für eine Veloroute schmal aus. Um die <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.628593, lon: 9.92243, zoom: 17})} ref="14">Allee im Anschluss</.m> erhalten zu können teilen sich hier Fahrräder und KFZ die Spur. Im ersten Entwurf waren noch Baumfällungen angedacht, jetzt setzt man stattdessen auf Tempo 30 mit verkehrsberuhigenden „Bauelementen“. Diese Änderung ist im Plan noch nicht enthalten.</p>

    <p>Es handelt sich um den ersten Entwurf, es sind also durchaus noch Änderungen zu erwarten. Fragwürdig ist etwa der schmalere Fußweg, wenn mit der Begrünung des Autobahndeckels doch mehr Fußverkehr zu erwarten ist. Auch die Schutzstreifen auf der Heidlohstraße wirken halbgar. Um die Allee zumindest teilweise zu erhalten, werden diese an manchen Stellen einfach weggelassen, obwohl dies aufgrund des hohen Verkehrsaufkommens nicht empfohlen wird. So wie geplant bleibt dieser Abschnitt für den Radverkehr unattraktiv.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
