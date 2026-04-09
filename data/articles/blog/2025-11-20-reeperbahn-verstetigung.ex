defmodule Data.Article.Blog.ReeperbahnVerstetigung do
  use Article.Default

  def title(), do: "Reeperbahn (Radroute 1)"

  def summary(),
    do:
      "Erprobte Radfahrstreifen bleiben und werden dauerhaft so eingerichtet. Es gibt nur kleinere Anpassungen."

  def type(), do: :finished

  def tags(), do: ["radroute-1"]

  def start(), do: ~d[2026-03-02]
  def stop(), do: ~d[2026-03-30]
  def construction_site_id_hh(), do: [2_428_445]

  def map_image do
    {name(),
     [
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2026-02],
       "https://web.archive.org/web/20260213193620/https://lsbg.hamburg.de/resource/blob/1145536/051eb25d4c9760dd2736118c7b97128a/reeperbahn-verstetigung-radfahrstreifen-anliegerinformation-februar-2026-data.pdf"},
      {"Erläuterungen", ~d[2025-11],
       "https://lsbg.hamburg.de/resource/blob/1119512/ccf28254f7fb8e78d7afa063c7b5ed9a/reeperbahn-stadtauswaerts-verstetigung-verkehrsversuch-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan", ~d[2025-11],
       "https://lsbg.hamburg.de/resource/blob/1119514/7d9db387c20f53061e58c96365a45ec7/reeperbahn-stadtauswaerts-verstetigung-verkehrsversuch-abgestimmte-planung-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Bevor die Versuche mit den <.ref>Radfahrstreifen</.ref> begannen, gab es auf der Reeperbahn keine Radwege. 2022 wurde in Richtung Innenstadt eine Fahrspur dem Rad- und Busverkehr gewidmet. 2023 folgte die Gegenrichtung.</p>

    <p>Seitdem gibt es beidseitig rund 3,25m breite Radfahrstreifen. In Richtung Innenstadt fährt man zunächst über eine Nebenfahrbahn („Parkplatz“). In Richtung Altona zunächst auf einem Stück <.ref>Hochbordradweg</.ref>.</p>

    <p>In beiden Fällen stellen Poller sicher, dass unaufmerksame Autofahrer nicht einfach auf dem Radfahrstreifen weiterfahren.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die Radfahrstreifen bleiben wie heute, erhalten aber weiße statt gelbe Markierungen. Jeweils am Anfang der Radfahrstreifen stellen Verkehrsinseln sicher, dass KFZ nicht einfach geradeaus auf dem Radfahrstreifen weiterfahren.</p>

    <p>Das Stück Hochbordradweg wird etwas verbreitert und erhält weiße Noppensteine zur deutlicheren Abgrenzung zum Gehweg.</p>

    <h4>Meinung</h4>
    <p>Probieren. Prüfen. Behalten. Das sollte Hamburg gerne häufiger tun.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
