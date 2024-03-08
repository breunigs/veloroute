defmodule Data.Article.Blog.GodeffroystrasseUndGaetgensstrasse do
  use Article.Default

  def updated_at(), do: ~D[2023-01-09]
  def title(), do: "Godeffroystraße und Gätgensstrasse (Radroute 1)"

  def summary(),
    do:
      "Die Straßen werden fahrradfreundlicher und die Elbchaussee durch die Temporeduktion einfacher zu queren."

  def type(), do: :planned
  def start(), do: ~d[2026]

  def tags(), do: ["1", "A22", "A022.3", "A22.3"]

  def links(_assigns) do
    [
      {"Bauzeiträume", "Oktober 2023",
       "https://fragdenstaat.de/anfrage/planungsstand-zu-einem-teilstueck-der-veloroute-1-a22-vr-1-blankenese-sued/"},
      {"Zweiter Entwurf (Bericht und Lagepläne)", "Oktober 2021",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1011851"},
      {"Erster Entwurf (veraltet)", "Februar 2020",
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1009667"},
      {"Dokumentation zur 1. Infoveranstaltung (veraltet)",
       "https://www.steg-hamburg.de/files/Projekte/Veloroute%201%20Altona/2019-01_Veloroute-Altona_A22_Gesamtdokumentation_mit%20Anlagen.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der <.v bounds="9.818031,53.559368,9.822659,53.561265" lon={9.82163} lat={53.559837} dir="forward" ref="1">Gätgensstraße</.v> liegt Kopfsteinpflaster. Der Knick über die <.v bounds="9.818031,53.559368,9.822659,53.561265" lon={9.819714} lat={53.560519} dir="forward" ref="1">Elbchaussee</.v> um die Godeffroystraße zu erreichen ist etwas unübersichtlich, wurde zwischenzeitlich durch die Führung links des Baums aber bereits verbessert.</p>

    <p>Die weitläufigen Kurven an der <.v bounds="9.813847,53.561991,9.815432,53.562727" lon={9.814981} lat={53.562352} dir="forward" ref="1" highlight="Ole Hoop">Kreuzung mit Ole Hoop</.v> machen es notwendig sich vorsichtig vorzutasten, da jederzeit mit schnellen KFZ zu rechnen ist.</p>

    <h4>Planung</h4>
    <p>Die <.v bounds="9.818031,53.559368,9.822659,53.561265" lon={9.82163} lat={53.559837} dir="forward" ref="1">Gätgensstraße</.v> wird asphaltiert und zu einer KFZ-Einbahnstraße in Richtung Westen umgebaut. Die KFZ-Parkplätze werden als Schrägparkplätze auf die Nordseite der Straße verlegt. Am <.v bounds="9.819253,53.560144,9.820265,53.560924" lon={9.819871} lat={53.560455} dir="forward" ref="1">Pepers Diek</.v> fährt der KFZ-Verkehr in Richtung Elbchaussee rechts am Baum vorbei. Der Radverkehr soll dagegen geradeaus über ein kurzes Stück Radweg links am Baum vorbeifahren. Die Einfahrt von der Elbchaussee ist für KFZ verboten.</p>

    <p>Die <.v bounds="9.81711,53.559698,9.820286,53.561334" lon={9.819349} lat={53.560578} dir="forward" ref="1">Elbchaussee</.v> wird im Abschnitt der Veloroute zur Tempo-30-Zone, was durch eine Aufpflasterung statt Asphalt auch visuell unterstützt wird. Diese Aufpflasterung zieht sich bis zum Pepers Diek fort. Da das kurze Stück Radweg über einen Bordstein abgetrennt wird muss man hier trotzdem in beide Richtungen Vorfahrt geben. Durch das geringe Verkehrsaufkommen im Pepers Diek ist dies jedoch nur zur Elbchausee relevant.</p>

    <p>Die <.v bounds="9.811894,53.560215,9.819493,53.562666" lon={9.81858} lat={53.560864} dir="forward" ref="1">Godeffroystraße</.v> Straße soll Fahrradstraße werden. Die <.v bounds="9.813847,53.561991,9.815432,53.562727" lon={9.814981} lat={53.562352} dir="forward" ref="1" highlight="Ole Hoop">Kreuzung mit Ole Hoop</.v> wird entsprechend umgebaut und deutlich kompakter als bisher.</p>

    <h4>Meinung</h4>
    <p>Die Vorfahrt am <.v bounds="9.819336,53.559579,9.820672,53.560889" lon={9.819915} lat={53.560449} dir="forward" ref="1">Pepers Diek</.v> hätte man entlang der Veloroute gewähren können, z.B. indem man die Gätgensstraße zu einer Fahrradstraße macht. Immerhin sortiert man hier die Parkplätze, was in der Godeffroystraße unterbleibt – die Straße wird also auch in Zukunft eher unordentlich aussehen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
