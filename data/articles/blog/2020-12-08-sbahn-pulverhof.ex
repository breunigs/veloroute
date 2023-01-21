defmodule Data.Article.Blog.SbahnPulverhof do
  use Article.Default

  def created_at(), do: ~D[2020-12-08]

  def title(), do: "Unterführung künftige S-Bahn-Station „Pulverhof“ (Veloroute 14)"

  def type(), do: :planned

  def tags(), do: ["14", "s4"]

  def links(assigns) do
    [
      {"Planfeststellungsverfahren 2 S-Bahn Linie 4 Hamburg",
       ~H"""
       Stadt Hamburg. Die relevanten Stellen befinden sich im <abbr title="DL Unterlage_01_Erlaeuterungsbericht → 20191021_S4_PFA2_Unterlage_1_E_Bericht.pdf">Erläuterungsbericht</abbr> Seiten 39ff, 84, 117, 122, 137 und den <abbr title="DL Unterlage_07_Bauwerksplaene → 7_1_7_EU_Pulverhof_041.pdf bzw. 7_1_8_EU_Pulverhof_042.PDF">Bauwerksplänen 7.1.7 und 7.1.8</abbr>.
       """, "https://www.hamburg.de/bwi/np-aktuelle-planfeststellungsverfahren/13609674/s4/"},
      {"Stellungnahme der Behörden zur Planung",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1013886"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr teilt sich die Fahrbahn mit den Autos. Am beschrankten Bahnübergang entstehen mitunter längere Wartezeiten.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen für die geplante S4 nach Bad Oldesloe hier eine weitere S-Bahn-Station „Pulverhof“ zu bauen. Für KFZ würde die Straße jeweils zu einer Sackgasse mit Wendehammer. Für Fuß- und Radverkehr soll östlich der heutigen Straße eine Unterführung gebaut werden, sodass diese weiterhin queren können. Der Zugang zum innenliegenden Bahnsteig erfolgt ebenfalls über diese Unterführung. Wer gut zu Fuß ist erreicht diese über eine kurze Treppe, für alle anderen steht jeweils eine Rampe vor und nach den Bahnschienen zur Verfügung. Die Rampen werden rund 5m breit und haben maximal 6% Steigung. Es sind jeweils drei Kehrtwenden (180°) und eine 90° Kurve notwendig um die Unterführung zu erreichen.</p> <p>Fuß- und Radverkehr teilen sich vermutlich die Rampen. Die Unterführung ist durch regelmäßige Poller in der Mitte grob geteilt. Wahrscheinlich ist die Seite mit Fahrstuhl und Treppe zum Bahnsteig hauptsächlich für den Fußverkehr gedacht, die andere Seite für den Radverkehr. Im Zugangsbereich zum Bahnsteig ist die Pollerdichte viel höher, vermutlich um zu verhindern das Unachtsame auf den Radweg treten.</p> <p>
    Die Bahn zeigt mittels einer Fotomontage, wie die Station künftig etwa aussehen könnte:
    <.a href="https://www.s-bahn-4.de/files/img/08_mediathek/S4_Pulverhof_VIS-1_web.jpg">Blickrichtung stadtauswärts</.a> und <.a href="https://www.s-bahn-4.de/files/img/08_mediathek/S4_Pulverhof_VIS-2_web.jpg">diagonale Draufsicht</.a>.
    </p>

    <p>Während der Bauarbeiten soll der Rad- und Fußverkehr entweder die Bahnunterführung am <.m bounds="10.12054,53.58641,10.127837,53.589453">Sonnenweg</.m> oder am <.m bounds="10.136171,53.594817,10.143348,53.59781">Tonndorfer Weg</.m> benutzen.</p>
    <h4>Meinung</h4>

    <p>Die Rampen und Unterführung werden zwar großzügig angelegt, bedeuten aber immer noch sechs Kehrtwenden und zwei 90° Winkel um der Veloroute zu folgen. Einerseits ist dies gut, da die niedrige Geschwindigkeit brenzligen Situationen vorbeugt, die durch die gemischte Fuß- und Radführung hervorgerufen werden. Andererseits ist eine geradlinige und zügige Fahrt für eine Veloroute unabdingbar.</p>

    <p>Die gesamte Straße zu unterführen wurde zwar untersucht, aber wegen des Platzbedarfs abgelehnt. Auch wäre hier eine weitere Zufahrt für die anliegenden Grundstücke notwendig gewesen. Es ist schade, das keine geradlinige Unterführung nur für den Fuß- und Radverkehr untersucht wurde, da diese deutlich schmaler ausfiele und daher ggf. passen könnte.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
