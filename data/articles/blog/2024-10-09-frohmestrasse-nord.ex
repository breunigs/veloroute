defmodule Data.Article.Blog.FrohmestrasseNord do
  use Article.Default

  def title(),
    do: "Frohmestraße – Wählingsallee bis Oldesloer Straße (Bezirksroute Eimsbüttel Nord ↔ Süd)"

  def summary(),
    do:
      "Tempo 20 Zone mit 6,5m breiter Fahrbahn geplant. Hinzu kommen einige Mittelinseln um das Queren zu vereinfachen."

  def type(), do: :planned

  def start(), do: ~d[2025Q3]

  def tags(), do: ["br-eimsbuettel-nord-sued"]

  def links(_assigns) do
    [
      {"Lagepläne und Abwägungen zur Vorzugsvariante", ~d[2024-10],
       "https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1009740"},
      {"Infoseite der (vergangenen) Beteiligungsmöglichkeiten",
       "https://umgestaltung-frohmestrasse.beteiligung.hamburg/#/"}
    ]
  end

  @attrib [
    {"Bezirksamt Eimsbüttel – Fachamt Management des öffentlichen Raumes",
     "https://www.hamburg.de/politik-und-verwaltung/bezirke/bezirksamt-eimsbuettel/ihr-bezirksamt/fachamt-management-des-oeffentlichen-raumes-58482"},
    {"BPR Ingenieure GmbH & Co. KG", "https://www.bpr-ingenieurbuero.de/kontakt/"}
  ]
  def map_image do
    Data.MapImage.new(__MODULE__, @attrib, {
      %{lat: 53.636455791, lon: 9.918358119},
      %{lat: 53.631933786, lon: 9.921765989},
      %{lat: 53.631687401, lon: 9.920836524},
      %{lat: 53.636209406, lon: 9.917428653}
    })
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind 1,0m bis 1,25m breite <.ref>Hochbordradwege</.ref> auf beiden Seiten vorhanden. Ihre wechselnden Oberflächen sind optisch kaum von den Gehwegen abgegrenzt. Die Gehwege sind stellenweise ebenfalls nur 1,0m breit, sodass häufig auch auf den Radwegen gegangen wird.</p>

    <p>An der nördlichen <.v bounds="9.917579,53.63422,9.920134,53.636156" lon={9.918893} lat={53.635097} dir="forward" ref="br-eimsbuettel-nord-sued">Bushaltestelle „Oldesloer Straße“</.v> wird der Radverkehr durch den Einstiegsbereich geführt. An der südlicheren <.v bounds="9.919736,53.631451,9.9228,53.633532" lon={9.920929} lat={53.632613} dir="backward" ref="br-eimsbuettel-nord-sued">„Frohmestraße (Mitte)“</.v> dagegen über die Wartefläche der Busse.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Es soll eine Tempo 20 Zone eingerichtet werden. Der Radverkehr teilt sich dort dann die insgesamt 6,5m breite Fahrbahn mit den KFZ im <.ref>Mischverkehr</.ref>. Vom <.v bounds="9.919962,53.631113,9.924376,53.633363" lon={9.922992} lat={53.631773} dir="forward" ref="br-eimsbuettel-nord-sued">Autobahndeckel kommend</.v> enden die <.ref>Schutzstreifen</.ref> nach der Ampel und die <.ref>Fahrbahn</.ref> verengt sich entsprechend.</p>

    <p>Die alten Radwege werden meist zu Gehwegen. Umgestaltetes KFZ-Parken ermöglicht es neue Bäume zu pflanzen und zwei <.ref name="Mittelinsel">Querungshilfen mit Mittelinsel</.ref> anzubieten.</p>

    <p>Der <.v bounds="9.917418,53.634006,9.920638,53.636014" lon={9.91877} lat={53.635083} dir="backward" ref="br-eimsbuettel-nord-sued">Platz „Glißmanndreieck“</.v> soll umgestaltet werden. Die vorhandenen Bäume sollen durch drei Neue ersetzt werden, die für den Standort besser geeignet sind.</p>

    <h4>Meinung</h4>
    <p>Mit dem Umbau kommen zumindest benutzbare Gehwege.</p>

    <p>Eine Verkehrsberuhigung wird sich wegen der breiten Fahrbahn jedoch kaum einstellen. Die Bevorzugung des Autos merkt man auch an Wahl der Querungshilfen: statt die Fahrbahn mit <.ref>Gehwegnasen</.ref> zu verschmälern, verengt man lieber die Fußwege.</p>

    <p>Radeln in Tempo 20 Zonen kann angenehm sein. Problem sind die schwachsinnigen Überholmanöver mit dem Auto, die trotz des Tempolimits gemacht werden. Der vorliegende Entwurf lässt noch viel Luft um das zu reduzieren. Neben echten Engstellen bieten sich gepflasterte Mittelstreifen zur optischen Verengung an oder (kontrollierte) Überholverbote.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
