defmodule Data.Article.Blog.BerlinerTorDammbruecke do
  use Article.Default

  def created_at(), do: ~D[2019-12-18]

  def title(), do: "Berlinertordammbrücke (Veloroute 8)"

  def start(), do: ~d[2023]
  def stop(), do: ~d[2028]

  # def construction_site_id_hh(), do: [577_833]

  def type(), do: :construction

  def tags(), do: ["8", "FR4"]

  def links(_assigns) do
    [
      {"Baustelleninfo", "Juli 2024",
       "https://lsbg.hamburg.de/resource/blob/934028/f6f512412612c8bdabb05e1af6712959/berlinertordammbruecke-anliegerinformation-juli-2024-data.pdf"},
      {"Pressemitteilung zum Baustart", "März 2024",
       "https://web.archive.org/web/20240501114605/https://www.hamburg.de/bvm/medien/18353678/2024-03-13-bvm-berlinertordammbruecke/"},
      {"Pressemitteilung zu vorbereitenden Arbeiten", "Januar 2024",
       "https://www.hamburg.de/bvm/medien/18050494/2024-01-09-bvm-berlinertordammbruecke/"},
      {"Lageplan",
       "https://lsbg.hamburg.de/resource/blob/784106/4d7a5af7cf36968263a9a4e0efde3af3/berlinertordammbruecke-abstimmungsunterlage-plan-data.pdf"},
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/resource/blob/784104/7695df6881faf3decef4bbf4783ad040/berlinertordammbruecke-abstimmungsunterlage-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die Brücke hat ihre Lebenszeit erreicht und muss neugebaut werden. Diese soll dabei ihre aktuelle Breite behalten, d.h. nur die Spurenaufteilung verändert sich. Der Radverkehr kommt dabei gut weg – die beiden Fahrtrichtungen der Veloroute erhalten jeweils 2m Breite (statt aktuell 1,50m), ebenso wie der Radweg auf der Südseite der Brücke. Zwischen Fußweg und Radwegen auf der Nordseite soll auch ein knapp vier Meter breiter Grünstreifen angelegt werden.</p> <p>Diesen Platz holt man sich hauptsächlich durch die Halbierung des nicht befahrbaren Mittelstreifen auf 1,50m und die annähernde Halbierung des Fußwegs auf der Südseite auf 2,65m. Auch die Poller gegen Falschparker entfallen und tragen zum Platzgewinn bei.</p> <p>Zusätzlich wird an der <.m bounds="10.025252,53.552947,10.027992,53.554579">Klaus-Groth-Straße</.m> eine Ampel aufgestellt. Diese ermöglicht das sichere Queren des Berlinertordamms, soll aber auch den Rad- und Fußverkehr über die Klaus-Groth-Straße regeln. Bisher stellen aus der Nebenstraße kommende KFZ einen Unfallschwerpunkt für den Radverkehr auf der Veloroute dar, v.a. in Fahrtrichtung stadtauswärts. Es ist geplant KFZ nur auf Anforderung grün zu geben und ansonsten Rad/Fuß zu bevorrechtigen – wie eine Bettelampel, nur für KFZ.</p> <p>Da es sich um den ersten Entwurf handelt ist noch mit Änderungen zu rechnen. Neben offensichtlichen Planungsfehlern (keine Ampel für den Radverkehr am <.m bounds="10.022758,53.552824,10.025498,53.554456">Berliner Tor</.m>), stellt sich auch die Frage warum man den südlichen Fußweg so stark verschmälert, wenn für den Mittelstreifen noch 1,50m vorgesehen sind. Leier wurde nicht untersucht ob die Klaus-Groth-Straße für KFZ gesperrt werden kann, damit der Radverkehr nicht durch eine Ampel ausgebremst wird und ggf. auch die Schikanen am Park entfallen könnten.</p> <p>Geplant ist mit Vorarbeiten 2023 zu starten und die Brücke ab 2024 bis 2028 komplett neuzubauen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
