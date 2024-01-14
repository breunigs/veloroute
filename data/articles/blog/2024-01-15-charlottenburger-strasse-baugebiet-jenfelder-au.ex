defmodule Data.Article.Blog.CharlottenburgerStrasseBaugebietJenfelderAu do
  use Article.Default

  def title(), do: "Charlottenburger Straße am Baugebiet Jenfelder Au (Radroute 14)"

  def summary(),
    do:
      "Auf der Westseite (beim Neubaugebiet) wird ein 2,0m breiter Hochbordradweg gebaut rechts eines Baum/Parkplatz/Bushalt-Streifens. Radweg wird für einmündende Straßen unterbrochen."

  def start(), do: ~d[2023Q4]
  def stop(), do: ~d[2024Q1]

  def type(), do: :construction
  def tags(), do: ["14"]

  def links(_assigns) do
    [
      {"Baustelleninfo", "August 2023",
       "https://www.hamburg.de/wandsbek/strassenbaustellen/17081818/jenfelder-au/"},
      {"Bauplanung Neubaugebiet; S. 16ff, S. 262", "Juni 2023",
       "https://suche.transparenz.hamburg.de/dataset/jenfelder-au-tu-4-innere-erschliessung-jenfelder-au-tu-4-innere-erschliessung-strassenbau"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf der <.v bounds="10.13346,53.576503,10.141326,53.582205" lon={10.137238} lat={53.579716} dir="forward" ref="14">Seite des Baugebiets (Westseite)</.v> ist ein rund 1,60m breiter Hochbordradweg mit vielen Flickstellen vorhanden. Illegal abgestellte Autos beschneiden die sicher nutzbare Breite regelmäßig.</p>

    <h4>Planung</h4>
    <p>Der Hochbordradweg soll neu gepflastert und 2,0m breit werden. Er verläuft rechts einer Baumreihe mit 19 neuen Bäumen. Dazwischen werden KFZ-Parkbuchten gebaut. Es sind 1,0m Sicherheitsabstand gegen <.ref>Dooring</.ref> vorgesehen. In der Baumreihe befindet sich auch der Wartebereich für Busfahrgäste an der <.v bounds="10.13346,53.576503,10.141326,53.582205" lon={10.13754} lat={53.580171} dir="forward" ref="14">Bushaltestelle Liegnitzer Straße</.v>, sodass der Radweg auch hier rechts vorbei führt.</p>

    <p>An einmündenden Straßen <.v bounds="10.13346,53.576503,10.141326,53.582205" lon={10.138332} lat={53.581363} dir="forward" ref="14">Kurt-Oldenburg-Straße</.v>, <.v bounds="10.13346,53.576503,10.141326,53.582205" lon={10.137713} lat={53.580605} dir="forward" ref="14">Kaskadenpark</.v> und <.v bounds="10.13346,53.576503,10.141326,53.582205" lon={10.136593} lat={53.578362} dir="forward" ref="14">Zur Jenfelder Au</.v> wird der Radweg jeweils unterbrochen, hat aber trotzdem Vorfahrt.</p>

    <h4>Meinung</h4>
    <p>Man setzt leider immer noch auf Pflaster, statt auf ebeneren Asphalt. Auch dass man den Radweg für die untergeordneten Nebenstraßen unterbricht ist schade. Eine Gehwegüberfahrt würde die Vorfahrtsregelung verdeutlichen und Rad- und Fußverkehr mehr Komfort bieten.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
