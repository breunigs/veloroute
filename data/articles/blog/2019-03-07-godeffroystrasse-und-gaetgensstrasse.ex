defmodule Data.Article.Blog.GodeffroystrasseUndGaetgensstrasse do
  use Article.Default

  def updated_at(), do: ~D[2026-05-23]
  def title(), do: "Godeffroystraße und Gätgensstrasse (Radroute 1)"

  def summary(),
    do:
      "Die Straßen werden fahrradfreundlicher und die Elbchaussee durch die Temporeduktion einfacher zu queren."

  def type(), do: :planned
  def start(), do: ~d[2027Q3]

  def tags(), do: ["radroute-1", "1", "A22", "A022.3", "A22.3"]

  def map_image do
    {name(),
     [
       {"Bezirksamt Altona – Fachamt öffentlicher Raum",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/altona/bezirksamt/dezernat-wirtschaft-bauen-umwelt-50986"},
       {"IPO Hamburg GmbH", "https://www.ipogmbh.de/"}
     ]}
  end

  def links(_assigns) do
    [
      {"3. Entwurf, Karten und Erläuterungen", ~d[2026-05],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1018244"},
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
    <h4>Stand Mai 2026</h4>
    <p>Beim Umbau der Elbchaussee entschied man sich, die Zufahrt zum Mühlenkamp nur noch für Rad- und Fußverkehr zu nutzen. Die Gätgensstraße wurde deswegen umgeplant. Der Artikel beschreibt den neuen Plan (3. Entwurf).</p>

    <h4>Alter Zustand</h4>
    <p>In der <.v bounds="9.818031,53.559368,9.822659,53.561265" lon={9.82163} lat={53.559837} dir="backward" ref={Radroute1}>Gätgensstraße</.v> liegt Kopfsteinpflaster. Der Knick über die <.v bounds="9.818031,53.559368,9.822659,53.561265" lon={9.819714} lat={53.560519} dir="backward" ref={Radroute1}>Elbchaussee</.v> um die Godeffroystraße zu erreichen ist etwas unübersichtlich, wurde zwischenzeitlich durch die Führung links des Baums aber bereits verbessert.</p>

    <p>Die weitläufigen Kurven an der <.v bounds="9.813847,53.561991,9.815432,53.562727" lon={9.814981} lat={53.562352} dir="backward" ref={Radroute1} highlight="Ole Hoop">Kreuzung mit Ole Hoop</.v> machen es notwendig sich vorsichtig vorzutasten, da jederzeit mit schnellen KFZ zu rechnen ist.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die <.v bounds="9.818031,53.559368,9.822659,53.561265" lon={9.82163} lat={53.559837} dir="backward" ref={Radroute1}>Gätgensstraße</.v> wird asphaltiert zusammen mit dem Mühlenberg zu einer Fahrradstraße (KFZ frei). Die KFZ-Parkplätze werden in Haltebuchten auf der Süd/Ostseite verlegt der Straße verlegt. Der <.v bounds="9.819253,53.560144,9.820265,53.560924" lon={9.819871} lat={53.560455} dir="backward" ref={Radroute1}>Pepers Diek</.v> wird mittels Gehwegüberfahrt wartepflichtig.</p>

    <p>Die <.v bounds="9.81711,53.559698,9.820286,53.561334" lon={9.819349} lat={53.560578} dir="backward" ref={Radroute1}>Elbchaussee</.v> wird im Abschnitt der Radroute zur Tempo-30-Zone, was durch Mittelinseln mit neuen Bäumen auch visuell unterstützt wird. Mit dem Fahrrad kann man dadurch in zwei Zügen links abbiegen. Durch die Umgestaltung gilt künftig Rechts-vor-Links.</p>

    <p>Die <.v bounds="9.811894,53.560215,9.819493,53.562666" lon={9.81858} lat={53.560864} dir="backward" ref={Radroute1}>Godeffroystraße</.v> Straße soll ebenfalls Fahrradstraße  werden (Anlieger frei). Die <.v bounds="9.813847,53.561991,9.815432,53.562727" lon={9.814981} lat={53.562352} dir="backward" ref={Radroute1} highlight="Ole Hoop">Kreuzung mit Ole Hoop</.v> wird entsprechend umgebaut und deutlich kompakter als bisher.</p>

    <h4>Meinung</h4>
    <p>Mit dem 3. Entwurf entsteht nun eine durchgängige Radverbindung.</p>

    <p>Anders als im 2. Entwurf ist die Radroute an der Ecke <.v bounds="9.820464,53.55928,9.823516,53.560588" lon={9.822014} lat={53.559785} dir="backward" ref={Radroute1}>Gätgensstraße/Mühlenberg</.v> bevorrechtigt. Auch das schwierige Einfädeln oder Queren der Elbchaussee wird dank der Mittelinsel einfacher.</p>

    <p>Wenn in der Godeffroystraße dann noch das wilde Parken aufhört, lohnt sich nach dem Umbau erstmals der Umweg über die Radroute. Bisher war man auf der <.m bounds="9.811381,53.559065,9.824356,53.564247">Dockenhudener Straße</.m> besser bedient, sofern einem der Autoverkehr nichts ausmacht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
