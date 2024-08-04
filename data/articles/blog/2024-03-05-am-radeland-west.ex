defmodule Data.Article.Blog.AmRadelandWest do
  use Article.Default

  def title(), do: "Am Radeland (ab Bostelbeker Damm, Radroute 10 und Freizeitroute 14)"

  def summary(),
    do:
      "Die Straße wird saniert, bleibt aber beim aktuellen Ansatz. D.h. Mischverkehr und wechselseitige KFZ-Parkplätze. Bushalte werden barrierefrei."

  def type(), do: :construction
  def start(), do: ~d[2024-06-17]
  def stop(), do: ~d[2025-07-30]
  def construction_site_id_hh(), do: [862_308]

  def tags(), do: ["10", "FR6", "H13", "H.13"]

  def links(_assigns) do
    [
      {"Infoseite der Stadt zum Umbau",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/harburg/themen/verkehr/ausbau-veloroute-10-in-bostelbek-872178"},
      {"Ausschreibung Umbau", "März 2024",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/99679463-915e-4505-bd83-cf90b44c71ff"},
      {"fertiger Entwurf", "August 2021",
       "https://fragdenstaat.de/anfrage/lageplaene-und-erlaeuterungsbericht-fuer-am-radeland-west-h13/#nachricht-881831"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird im <.ref>Mischverkehr</.ref> geführt. Der Abschnitt ist größtenteils Tempo-30-Zone.</p>

    <h4>Planung</h4>
    <p>Es bleibt beim Mischverkehr. Die Fahrbahn wird saniert und 6,0m bis 6,5m breit – sofern KFZ-Parkplätze links bzw. rechts vorgesehen sind nur 4,5m. Die Tempo-30-Zone beginnt künftig bereits ab dem <.v bounds="9.931828,53.470403,9.940886,53.472962" lon={9.935474} lat={53.471703} dir="forward" ref="10">Bostelbeker Damm</.v>.</p>

    <p>Die Aufleitung zur <.v bounds="9.917219,53.470542,9.929704,53.473296" lon={9.921957} lat={53.47188} dir="forward" ref="10" highlight="Moorstieg">Unterführung Moorstieg</.v> wird etwas deutlicher. Die <.v bounds="9.928784,53.470221,9.936683,53.47296" lon={9.933116} lat={53.471729} dir="forward" ref="10" highlight="Zum Fürstenmoor">Unterführung zum Fürstenmoor</.v> bleibt unverändert.</p>

    <p>Die Bushaltestellen werden barrierefrei. Der Gehweg auf Seite der Eisenbahn entfällt, sofern keine Wartefläche für Busfahrgäste benötigt wird.</p>

    <h4>Meinung</h4>
    <p>Die Planung holt nur wenig für den Radverkehr heraus. Es bleibt beim Slalom um die KFZ-Parkplätze – das bremst Auto- und Radverkehr gleichermaßen aus. Allerdings ist das Verkehrsaufkommen in der Straße meistens gering, sodass dies kaum ins Gewicht fällt.</p>

    <p>Das man sich die <.v bounds="9.928784,53.470221,9.936683,53.47296" lon={9.933116} lat={53.471729} dir="forward" ref="10" highlight="Zum Fürstenmoor">Unterführung zum Fürstenmoor</.v> gar nicht angeschaut hat ist frech. Statt KFZ-Parkplätzen wäre auch eine befahrbare Rampe denkbar gewesen. Das löst zwar nicht das Treppenproblem <.v bounds="9.928784,53.470221,9.936683,53.47296" lon={9.932734} lat={53.471413} dir="forward" ref="FR14">auf der anderen Seite</.v>, halbiert aber schonmal den Aufwand.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
