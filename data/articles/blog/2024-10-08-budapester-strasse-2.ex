defmodule Data.Article.Blog.BudapesterStrasse2 do
  use Article.Default

  def title(),
    do: "Budapester Straße (Glacischaussee bis Clemens-Schultz-Straße, Radroute 1 und 15)"

  def summary(),
    do:
      "Hochbordradwege werden neu gepflastert und teilweise verbreitert. Die Breiten reichen von 1,2m bis 2,5m, wobei Breiten ab 2,0m überwiegen."

  def type(), do: :construction

  def tags(), do: ["radroute-1", "radroute-15", "bundesstraße-4"]

  def start(), do: ~d[2024-12-09]
  def stop(), do: ~d[2025-03]

  def tracks(), do: Data.Article.Blog.BudapesterStrasse1.tracks()

  def map_image do
    {name(), [{"LSBG Hamburg (B1)", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2024-11],
       "https://lsbg.hamburg.de/resource/blob/993638/50578a9589b239723ec34d8104af5267/budapester-strasse-geh-und-radwege-anliegerinformation-november-2024-data.pdf"},
      {"Lageplan", ~d[2024-10],
       "https://fragdenstaat.de/anfrage/budapester-strasse-millerntorplatz-millerntordamm-glacischaussee/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind beidseitig <.ref>Hochbordradwege</.ref> vorhanden. Sie erreichen Breiten von 1,0m bis 1,25m.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Radweg auf <.v bounds="9.966579,53.550049,9.971266,53.552424" lon={9.967056} lat={53.551929} dir="backward" ref={@ref}>Häuserseite</.v> soll verbreitert werden. Zunächst auf 2,5m, <.v bounds="9.967756,53.549893,9.971195,53.551824" lon={9.968708} lat={53.551106} dir="backward" ref={@ref} highlight="Simon-von-Utrecht-Straße">nach der Simon-von-Utrecht-Straße</.v> noch auf 2,0m. Auch einige der Wege um die Kreuzung am Millerntorplatz werden zu Lasten der Gehwege verbreitert.</p>

    <p>Die <.v bounds="9.966882,53.550157,9.971227,53.552366" lon={9.968303} lat={53.551665} dir="forward" ref={@ref}>Seite des Heiligengeistfeld</.v> wird <em>nicht</em> mit dieser Maßnahme erneuert.</p>

    <h4>Meinung</h4>
    <p>Weil nur geringfügig saniert wird, bleiben gefährliche Verkehrsführungen wie der <.v bounds="9.967588,53.550806,9.969461,53.551827" lon={9.96829} lat={53.551359} dir="backward" ref={@ref} highlight="Simon-von-Utrecht-Straße">ungesicherte Rechtsabbieger in die Simon-von-Utrecht-Straße</.v>. Brauchbarer als jetzt werden die Radwege aber trotzdem, weil man einander überholen kann.</p>

    <p>Langfristig muss der gesamte Bereich städtebaulich neu gedacht werden. Der <.v bounds="9.96879,53.549624,9.972212,53.551564" lon={9.969703} lat={53.55068} dir="backward" ref={@ref}>Millerntorplatz</.v> sollte wieder ein Platz werden und keine reine Kreuzung für den Durchgangsverkehr. Dabei könnten auch gleich die historischen Fehler wie die Zerschneidung der Parks und die isolierte U-Bahn-Station in Kreuzungsmitte behoben werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
