defmodule Data.Article.Blog.KreuzungBarmbekerStrasseMariaLouisenStrasse do
  use Article.Default

  def title(), do: "Kreuzung Barmbeker Straße / Maria-Louisen-Straße (Bezirksroute N6)"

  def summary(),
    do:
      "Rad- und Gehwege werden beim Ausbau der Bushaltestelle neu gepflastert, bleiben aber wie bisher zu eng."

  def type(), do: :construction
  def start(), do: ~d[2024-07-29]
  def stop(), do: ~d[2024-10-18]

  def tags(), do: ["br-nord-n6"]

  def map_image do
    Data.MapImage.new(__MODULE__, {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}, {
      %{lat: 53.591930253, lon: 10.006314062},
      %{lat: 53.591433160, lon: 10.008371167},
      %{lat: 53.591025840, lon: 10.008091760},
      %{lat: 53.591523035, lon: 10.006034718}
    })
  end

  def links(_assigns) do
    [
      {"Baustelleninfo", "Juli 2024",
       "https://lsbg.hamburg.de/resource/blob/945586/2832e88d2884dc5ed3e9e3bbd8f7fd3d/barmbeker-strasse-anliegerinformation-juli-2024-data.pdf"},
      {"Ausschreibung Umbau", "Mai 2024",
       "https://web.archive.org/web/20240504115053/https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/external/deeplink/subproject/006b4e40-f4d0-4535-945c-01996f0222c6"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang der Barmbeker Straße sind rund 1,25m bis 1,5m breite <.ref>Hochbordradwege</.ref> vorhanden. <.v bounds="10.005231,53.590353,10.00919,53.592162" lon={10.007815} lat={53.591393} dir="backward" ref="br-nord-n6">Falschparker</.v> reduzieren die nutzbare Breite weiter.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Bushaltestellen sollen barrierefrei ausgebaut werden. Im Zuge dessen werden die Rad- und Gehwege im Kreuzungsbereich und um die Haltestellen neu gepflastert. Die Warteflächen für Fahrgäste werden etwas breiter, Fuß- und Radweg behalten aber in etwa ihre heutigen Maße.</p>

    <p>Es werden zahlreiche Radanschließbügel ergänzt, vor allem wo heute die Falschparker stehen.</p>

    <p>Anmerkung: Die <.ref>Fahrbahn</.ref> wird von der <.v bounds="9.998992,53.590986,10.006602,53.594558" lon={10.000166} lat={53.593603} dir="forward" ref="br-nord-n6">Buchenstraße</.v> bis zur <.m bounds="10.013138,53.586091,10.019013,53.590773">Barmbeker Straßenbrücke</.m> durchgängig saniert. Wegen der <.ref>Benutzungspflicht</.ref> ist dies für den Radverkehr jedoch zweitrangig.</p>

    <h4>Meinung</h4>
    <p>Rad- und Fußverkehr sollen sich auf enge und holprige Wege quetschen, während für den Autoverkehr eine noch gut erhaltene Fahrbahn neu gemacht wird. Da auch keine Busspur eingerichtet wird, meint Hamburg es wohl nicht so ernst mit der Verbesserung des Nahverkehrs.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
