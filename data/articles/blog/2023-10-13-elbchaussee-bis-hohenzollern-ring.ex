defmodule Data.Article.Blog.ElbchausseeBisHohenzollernRing do
  use Article.Default

  def title(), do: "Elbchaussee (Rathaus Altona bis Hohenzollernring)"
  def updated_at(), do: ~D[2025-03-07]

  def summary(),
    do:
      "Meist asphaltierte „Kopenhagener Radwege“ mit 2,0m Breite. An Bushaltestellen wird der Radweg unterbrochen."

  def type(), do: :construction

  def tags(), do: ["radroute-concept-a"]
  def start(), do: ~d[2025-04]
  def stop(), do: ~d[2030-03]

  # Vorarbeiten HH Wasser
  # def construction_site_id_hh(), do: [1374090]

  def tracks(), do: []

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2026-02],
       "https://web.archive.org/web/20260306211304/https://lsbg.hamburg.de/resource/blob/1144768/498a0c631b5a836add1b3fe7c084b52c/elbchaussee-anliegerinformation-erweiterte-vollsperrung-hohenzollernring-ab-16-02-26-data.pdf"},
      # {"Baustelleninfo", ~d[2025-06],
      #  "https://lsbg.hamburg.de/resource/blob/1068158/e565ee2419d500bf79d89bf9691e5551/elbchaussee-anliegerinformation-sperrung-ab-10-juni-juni-2025-data.pdf"},
      # {"Baustelleninfo", ~d[2025-03],
      #  "https://lsbg.hamburg.de/resource/blob/1037750/881a3f198316f1100fae51103a753d09/elbchaussee-betty-levi-passage-bis-hohenzollernring-anliegerinformation-maerz-2025-data.pdf"},
      {"Erläuterungsbericht – fertiger Entwurf", ~d[2025-03],
       "https://lsbg.hamburg.de/resource/blob/1030424/73709d5a4f76e14dc46476592913bfa4/elbchaussee-hohenzollernring-bis-betty-levi-passage-abgestimmte-planung-bericht-data.pdf"},
      {"Karte – fertiger Entwurf", ~d[2025-03],
       "https://lsbg.hamburg.de/resource/blob/1030430/629eb58d7db57ab7ad73deff4e556cc1/elbchaussee-hohenzollernring-bis-betty-levi-passage-abgestimmte-planung-plan-data.pdf"},
      {"Erläuterungsbericht – 1. Entwurf", "September 2023",
       "https://lsbg.hamburg.de/resource/blob/782918/615d07d98be290ccbbd910bc44b79dae/elbchaussee-hohenzollernring-bis-betty-levi-passage-abstimmungsunterlage-bericht-data.pdf"},
      {"Karte – 1. Entwurf", "September 2023",
       "https://lsbg.hamburg.de/resource/blob/782920/0ee01f3d0b127c55c3230f82f0517b18/elbchaussee-hohenzollernring-bis-betty-levi-passage-abstimmungsunterlage-plan-data.pdf"},
      {"Infoseite der Stadt", "https://lsbg.hamburg.de/elbchaussee"}
    ]
  end

  def map_image do
    {name(), [{"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt keine Radwege. Es muss auf überbreiten Fahrspuren im <.ref>Mischverkehr</.ref> gefahren werden.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es sollen meist 2,0m breite <.ref>Kopenhagener Radwege</.ref> gebaut werden. Sie werden asphaltiert.</p>

    <p>An Bushaltestellen wird der Radweg jeweils unterbrochen und mittels kurzer Rampe auf Fahrbahnniveau abgesenkt. An einmündenden Nebenstraßen ist der Radweg dagegen durchgängig. An wartenden Bussen kann vorbeigefahren werden, ohne auf die Gegenfahrbahn ausweichen zu müssen.</p>

    <p>Wo KFZ-Parkplätze rechts des Radwegs sind wird nur ein <.ref>Radfahrstreifen</.ref> aufgemalt.</p>

    <p>In den <.v bounds="9.91395,53.544147,9.922393,53.549613" lon={9.916718} lat={53.545874} dir="forward" ref={@ref}>Hohenzollernring</.v> darf künftig auch <.ref ref={LexikonDirektesUndIndirektesAbbiegen}>indirekt links abgebogen</.ref> werden.</p>

    <h4>Änderungen zum 1. Entwurf</h4>
    <p>Die Wesentlichen Kritikpunkte wurden behoben:</p>

    <ul>
      <li> Die Radwege werden asphaltiert</li>
      <li>An reinen Fußgängerampeln entfallen die Rampen und der Radweg wird durchgängig</li>
    </ul>

    <p>Die Bushaltestellen wurden leicht anders gestaltet, sodass ein wartender Bus auch leicht auf die Fahrbahn ragt. Eine Vorbeifahrt mit dem Fahrrad ohne Ausweichen in den Gegenverkehr bleibt weiter möglich. LKW und KFZ müssen dagegen aufmerksamer fahren. Außerdem wird an der <.v bounds="9.919044,53.54488,9.925103,53.547508" lon={9.920292} lat={53.545931} dir="backward" ref={@ref}>Elbtreppe</.v> ein neuer Halt eingerichtet.</p>

    <h4>Meinung</h4>
    <p>Der Radweg ist gut und am gefundenen Kompromiss gibt es nichts auszusetzen. Klar wäre ein komplett durchgängiger Radweg noch schöner. Aber die kurzen Unterbrechungen sind akzeptabel, wofür man dafür eine gute Buslinie bekommt.</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
