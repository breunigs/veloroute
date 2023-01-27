defmodule Data.Article.Blog.Hoegerdamm do
  use Article.Default

  def created_at(), do: ~D[2021-07-24]

  def title(), do: "Högerdamm (Freizeitroute 6)"

  def type(), do: :planned
  def start(), do: ~d[2023-08]
  def stop(), do: ~d[2024Q4]

  def tags(), do: ["FR6"]

  def links(_assigns) do
    [
      {"Baustelleninfo", "Januar 2023",
       "https://lsbg.hamburg.de/resource/blob/656598/42bf85574b5bb2bc37507d7278ede77e/hoegerdamm-anliegerinformation-januar-2023-data.pdf"},
      {"Pressemitteilung zum Umbau", "Januar 2023",
       "https://www.hamburg.de/bvm/medien/16854704/2023-01-25-bvm-hoegerdamm/"},
      {"Lageplan",
       "https://web.archive.org/web/https://lsbg.hamburg.de/contentblob/15272744/92375049d4a9e8457398ae32e46fffeb/data/hoegerdamm-abgestimmte-planung-plan.pdf"},
      {"Erläuterungsbericht",
       "https://web.archive.org/web/https://lsbg.hamburg.de/contentblob/15272742/005843155bb13b25b0c1901ab81ad338/data/hoegerdamm-abgestimmte-planung-bericht.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Im Högerdamm gibt es nur einen unebenen, rund 1m breiten <.ref>Hochbordradweg</.ref> in Richtung Elbbrücken. In die Gegenrichtung ist Radfahren nicht möglich.</p>
    <h4>Planung</h4> <p><.v bounds="10.006357,53.547231,10.011463,53.5484" ref="FR6" dir="forward" lat={53.54766} lon={10.00847}>Nach der Eisenbahnbrücke</.v> soll der Radverkehr auf einem rund 2,75m breiten Radweg fahren, der mittels Bordsteinen von Fuß- und Autoverkehr getrennt (<.ref>Kopenhagener Lösung</.ref>) verläuft. Die <.v bounds="10.008964,53.547175,10.011425,53.547738" ref="FR6" dir="forward" lat={53.54749} lon={10.00967}>vorhandene Ampel</.v> wird etwas verschoben, erlaubt aber weiterhin ein Linksabbiegen in die Nebenfahrbahn der Amsinckstraße. Anders als heute wird der Radweg hier getrenne Spuren für Links/Geradeaus erhalten.</p> <p>Im Högerdamm selbst ist vorgesehen eine der beiden KFZ-Spuren zu einem <.ref>Radfahrstreifen</.ref> umzuwidmen. Im <.v bounds="10.011855,53.545172,10.016961,53.54634" ref="FR6" dir="forward" lat={53.54637} lon={10.01290}>östlichen Teil</.v> geht die Radspur durch eine Verschwenkung in einer gemeinsamen Bus- und Radspur auf. Im Rahmen der Busbeschleunigung sollen die Busse ab vorrausichtlich 2025 hier jedoch nicht mehr fahren, sodass auch dieser Teil zu einem reinen Radfahrstreifen wird.</p> <p>Es wurde geprüft, ob man mit dem Fahrrad auch Richtung Innenstadt fahren könnte. Man verwarf dies jedoch aus Platzmangel im Högerdamm selbst, aber auch im <.v bounds="10.003354,53.547179,10.010934,53.548915" lat={53.54637} lon={10.01290} ref="FR6" dir="backward">weiteren Verlauf zum Deichtorplatz</.v>. Man überlegt stattdessen die Führung über <.m bounds="10.007108,53.544397,10.013826,53.546435">Banksstraße</.m>/<.m bounds="10.013826,53.544323,10.016729,53.545741">Lippeltstraße</.m> zu verbessern.</p> <p>Gebaut werden soll ab 2022, Leitungsarbeiten könnten aber bereits ab Spätsommer 2021 stattfinden.</p>
    <h4>Meinung</h4> <p>Die Planung ist gelungen. Jammern kann man höchstens darüber, das sich Bus und Rad die Spur für die nächsten Jahre stellenweise teilen. Im Anschluss bestünde die Möglichkeit den Radfahrstreifen als <.ref>Protected-Bike-Lane</.ref> besser vom KFZ-Verkehr zu trennen. Bis dahin gibt es 1m Sicherheitsabstand, was deutlich breiter als die normalen 25cm ist.</p> <p>Insgesamt erhalten Fuß und Rad mehr Platz als bisher, es gibt mehr Grünflächen und Anschließmöglichkeiten für Fahrräder. Dazu geben die Autos eine Spur ab, die sie aber gar nicht brauchten. Die entfallenden KFZ-Parkplätze werden durch die hinzukommenden Fahrrad-Parkplätze mehr als ausgeglichen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
