defmodule Data.Article.Blog.Thadenstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-1-thadenstrasse"
  def created_at(), do: ~D[2018-09-28]

  def title(), do: "Thadenstraße (Veloroute 1)"

  def start(), do: ~d[2021-04-06]
  def stop(), do: ~d[2022-04-01]

  def type(), do: :finished
  def construction_site_id_hh(), do: [14882]
  def tags(), do: ["1"]

  def tracks(), do: []

  def links(_assigns) do
    [
      {"Erläuterungsbericht zur Umgestaltung mit Lageplan",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1010092"},
      {"Baustellen Info",
       "https://www.hamburg.de/altona/pressemitteilung/14996744/ausbau-veloroute-1/"},
      {"Zeitungsartikel",
       "https://www.abendblatt.de/hamburg/article234200157/stadtplanung-abendblatt-serie-altona-hamburg-stadtentwicklung-bauvorhaben-planung-ottensen.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Die <.m bounds="9.950547,53.555879,9.962811,53.557155">Thadenstraße</.m> soll im Sommer 2020 zu einer Fahrradstraße umgebaut werden. Im Vergleich zu jetzt gibt es durchgehend Vorfahrt wenn man der Veloroute folgt, insbesondere auch an der <.m bounds="9.954618,53.557155,9.95512,53.561079">Wohlers Allee</.m> im Westen sowie <.m bounds="9.962447,53.556155,9.963636,53.557669">Beim Grünen Jäger</.m> im Osten. Dort soll auch die Aufleitung durch den Park verbessert und in Asphalt ausgeführt werden.  Durchgangsautoverkehr im östlichen Teil der Thadenstraße wird durch eine Einbahnstraßenregelung reduziert, deren Richtung sich ab <.m bounds="9.959792,53.555596,9.960823,53.556577">Brunnenhofstraße</.m> bzw. <.m bounds="9.877365,53.556563,9.963686,53.635508">Lerchenstraße</.m> umkehrt. Um genügend Platz für den Rad- und Fußverkehr zu erhalten entfällt der südliche Parkstreifen.</p> <p>Insgesamt klingt die Umgestaltung gelungen und bei einem Radaufkommen das selbst in Nebenzeiten den KFZ-Verkehr um das dreifache übersteigt auch notwendig.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
