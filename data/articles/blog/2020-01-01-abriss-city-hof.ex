defmodule Data.Article.Blog.AbrissCityHof do
  use Article.Default

  def updated_at(), do: ~D[2023-10-14]

  def title(), do: "Johann-Kontor am Klosterwall (Veloroute 9)"

  def summary(),
    do: "2,5m breiter Hochbordradweg nach Fertigstellung des neuen Klosterwall Quartiers"

  def type(), do: :construction
  def start(), do: ~d[2019]
  def stop(), do: ~d[2024-08-18]
  # def construction_site_id_hh(), do: [113_099, 379_418]

  def tags(), do: ["9"]

  def links(_assigns) do
    [
      {"Bebauungsplan Quartier Klosterwall",
       "https://www.hamburg.de/mitte/bebauungsplanung/10286520/hamburg-altstadt-klosterwall/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Bedingt durch den Bau auf der Fläche des ehemaligen „City-Hof“ wird die Veloroute 9 stadtauswärts über den <.v bounds="10.003971,53.546838,10.007674,53.550624" lon={10.004989} lat={53.549673} dir="forward" ref="9">Johanniswall</.v> umgeleitet. Im Zuge des Umbaus wird auch der Radweg erneuert.</p>

    <h4>Planung</h4>
    <p>Es soll ein 2,5m breiter, gepflasterter <.ref>Hochbordradweg</.ref> angelegt werden. Ein Stück vor der Kreuzung am <.v bounds="10.003971,53.546838,10.007674,53.550624" lon={10.004717} lat={53.548159} dir="forward" ref="9">Deichtorplatz</.v> wird er zu einem 2,0m breiten <.ref>Kopenhagener Radweg</.ref> und dann kurz darauf zu einem <.ref>Radfahrstreifen</.ref>.</p>

    <p>Im Johanniswall sind keine eigenen Radwege vorgesehen. Der Stummel nach der <.v bounds="10.003971,53.546838,10.007674,53.550624" lon={10.004585} lat={53.548289} dir="forward" ref="9">Burchhardstraße</.v> bleibt jedoch bestehen. In der <.v bounds="10.003971,53.546838,10.007674,53.550624" lon={10.005604} lat={53.54999} dir="forward" ref="9">Steinstraße</.v> ist ein 2,0m breiter Hochbordradweg vorgesehen, der sich um den U-Bahn Eingang schlängelt.</p>

    <p>Um das Gebäude verteilt sind zahlreiche Radanschließbügel.</p>

    <h4>Meinung</h4>
    <p>Die Führung entlang der Veloroute ist gut, auch wenn noch auf hubbeliges Pflaster gesetzt wird statt rot gefärbtem Asphalt. Warum man im Johanniswall an den drei Fahrspuren festhält, statt Rad- und KFZ Verkehr ordentlich zu trennen ist nicht nachvollziehbar.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
