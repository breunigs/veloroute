defmodule Data.Article.Blog.SpanischeFurtHeidlohstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-02-01]
  def updated_at(), do: ~D[2022-07-23]

  def title(), do: "Spanische Furt bis Heidlohstraße (Veloroute 14)"

  def summary(),
    do: "Verschiedene Lösungen der Einzelabschnitte. Umbau Spanische Furt ab Oktover 2022."

  def start(), do: ~d[2022-10]
  def stop(), do: ~d[2023-12]
  # Graf-Johann-Weg
  # def construction_site_id_hh(), do: [121136]

  def type(), do: :construction

  def tags(), do: ["14"]

  def links(_assigns) do
    [
      {"Baustelleninfo", "Dezember 2022",
       "https://lsbg.hamburg.de/contentblob/16792718/3ad6670547aa0f97cb1740e5b3aa3d59/data/graf-johann-weg-veloroute-14-aktueller-stand-12-2022.pdf"},
      {"Abschnitt Spanische Furt/Graf-Johann-Weg: Plan", "Oktober 2022",
       "https://lsbg.hamburg.de/contentblob/16564230/49bc87dd323e86ef6d2902e5c7bd1aac/data/veloroute-14-spanische-furt-teilprojekt-graf-johann-weg-abgestimmte-planung-plan.pdf"},
      {"Abschnitt Spanische Furt/Graf-Johann-Weg: Bericht", "Oktober 2022",
       "https://lsbg.hamburg.de/contentblob/16564216/45049cf84272ad1f8da42e902b71cfa7/data/veloroute-14-spanische-furt-teilprojekt-graf-johann-weg-abgestimmte-planung-bericht.pdf"},
      {"Baustelleninfo Abschnitt Spanische Furt/Graf-Johann-Weg", "September 2022",
       "https://lsbg.hamburg.de/contentblob/16501850/e80ab8e2bf481f8904fa617f00834c00/data/graf-johann-weg-veloroute-14-10-22-bis-03-23.pdf"},
      {"Vergabeunterlagen Umbau", "Juli 2022",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/ef58f192-1b19-40b5-94f4-a411a16ee71b/details"},
      {"Pressemitteilung zu Tempo-30 Heidlohstraße",
       "https://www.hamburg.de/bvm/medien/15595988/2021-11-12-bvm-heidlohstrasse/"},
      {"Erläuterungen zum ersten Entwurf", "Februar 2020",
       "https://lsbg.hamburg.de/contentblob/13462690/98e53b0a2d1de123426264d4c696de47/data/veloroute-14-spanische-furt-bis-heidlohstrasse-abstimmungsunterlage-bericht.pdf"},
      {"Lageplan erster Entwurf", "Februar 2020",
       "https://lsbg.hamburg.de/contentblob/13462694/13418947080d815ffe478c2cb0ab8db4/data/veloroute-14-spanische-furt-bis-heidlohstrasse-abstimmungsunterlage-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Juli 2022</h4>
    <p>Für das Teilstück zwischen <.m bounds="9.909562,53.622821,9.916382,53.625442" lon={9.91073} lat={53.62327} dir="forward" ref="14">Lerchenkamp</.m> und <.m bounds="9.91073,53.62293,9.91884,53.626086" lon={9.917075} lat={53.625086} dir="forward" ref="14">Vörn Brook</.m> wurde der Umbau ausgeschrieben. Er ist von Oktober 2022 bis März 2023 angesetzt. Anders als im ersten Entwurf soll die <.m bounds="9.912951,53.622777,9.919445,53.625168" lon={9.91495} lat={53.623563} dir="forward" ref="14">Querungshilfe an der Kita</.m> erhalten bleiben, allerdings ohne Zebrastreifen.</p>

    <h4>Artikel (2020)</h4>
    <p>Die Spanische Furt bzw. der Graf-Johann-Weg sind breite Erschließungsstraßen mit viel Autoverkehr, auf denen Radfahren nur mäßig Spaß macht. Die Heidlohstraße ist noch stärker befahren, wobei der Bau des Autobahndeckels hier sicher zu Verzerrungen in der Verkehrsmenge geführt hat. Eigene Radwege sind bisher nicht vorhanden oder durch ihre Baufälligkeit unbenutzbar.</p>

    <p>Der LSBG plant einige Verbesserungen. Im <.m bounds="9.907657,53.622555,9.922724,53.628618" lon={9.908974} lat={53.622939} dir="forward" ref="14">Abschnitt Spanische Furt / Graf-Johann-Weg</.m>  wird Tempo 30 eingerichtet und die Einmündungen schmaler gefasst. Dies reduziert die Geschwindigkeit der einbiegenden Autos und die bessere Übersicht macht das Rechts-vor-Links für den Radverkehr angenehmer. Die Straßeneinengungen (etwa <.m bounds="9.912951,53.622777,9.919445,53.625168" lon={9.91495} lat={53.623563} dir="forward" ref="14">beim Zebrastreifen</.m>) werden jedoch entfernt um den Busverkehr zu beschleunigen. Jeweils an den Enden dieses Abschnitts dürfen sich Fahrräder künftig vor dem Autoverkehr an den Ampeln aufstellen („<.ref>ARAS</.ref>“).</p>

    <p>An der <.m bounds="9.916551,53.626157,9.922623,53.628884" lon={9.919241} lat={53.627706} dir="forward" ref="14">Kreuzung mit der Heidlohstraße</.m> wird der Fußweg deutlich schmäler um eine Linksabbiegerspur einrichten zu können. Der Radverkehr teilt sich diese mit den KFZ. Es wird aber auch eine Möglichkeit zum indirekten Linksabbiegen mit eigener Ampel gebaut. Aus dem Graf-Johann-Weg gibt es den bereits erwähnten Aufstellbereich.</p>

    <p>Im Verlauf der Heidlohstraße bis etwa nach dem <.m bounds="9.91729,53.626558,9.92335,53.629564" lon={9.921654} lat={53.628193} dir="forward" ref="14">Autobahndeckel</.m> werden Radfahrstreifen aufgemalt. Sie fallen mit rund 1,60m für eine Veloroute schmal aus. Um die <.m bounds="9.921933,53.627306,9.930148,53.63009" lon={9.922854} lat={53.628402} dir="forward" ref="14">Allee im Anschluss</.m> erhalten zu können teilen sich hier Fahrräder und KFZ die Spur. Im ersten Entwurf waren noch Baumfällungen angedacht, jetzt setzt man stattdessen auf Tempo 30 mit verkehrsberuhigenden „Bauelementen“. Diese Änderung ist im Plan noch nicht enthalten.</p>

    <p>Es handelt sich um den ersten Entwurf, es sind also durchaus noch Änderungen zu erwarten. Fragwürdig ist etwa der schmalere Fußweg, wenn mit der Begrünung des Autobahndeckels doch mehr Fußverkehr zu erwarten ist. Auch die Schutzstreifen auf der Heidlohstraße wirken halbgar. Um die Allee zumindest teilweise zu erhalten, werden diese an manchen Stellen einfach weggelassen, obwohl dies aufgrund des hohen Verkehrsaufkommens nicht empfohlen wird. So wie geplant bleibt dieser Abschnitt für den Radverkehr unattraktiv.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
