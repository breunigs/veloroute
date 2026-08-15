defmodule Data.Article.Blog.BudapesterStrasse3 do
  use Article.Default

  def title(), do: "Budapester Straße (direkt am Heiligengeistfeld)"

  def summary(),
    do:
      "Radweg wird verbreitert und der Gehweg erstmals durchgängig. Betonklötze weichen einer Baumreihe."

  def type(), do: :finished

  def tags(), do: ["radroute-15"]

  def start(), do: ~d[2026-04-30]
  def stop(), do: ~d[2026-07-06]
  def construction_site_id_hh(), do: [2_206_364]

  def point_of_interest(), do: %{lat: 53.551083, lon: 9.969623, zoom: 17}

  def map_image do
    {name(),
     [
       {"BPR Ingenieure GmbH & Co. KG", "https://bpr-ingenieurbuero.de/#kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Baustelleninfo", ~d[2026-04],
       "https://lsbg.hamburg.de/resource/blob/993638/5e0cce6ec0a28675d59e217e8f76e8a5/budapester-strasse-geh-und-radwege-anliegerinformation-april-2026-data.pdf"},
      {"Ausschreibung Umbau", ~d[2025-11],
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/supplier/external/deeplink/subproject/43894418-8bb3-4217-8196-47cf37d4550b"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radweg hat zunächst 2,0m Breite, verengt sich im Verlauf aber auf 1,0m. Der Gehweg endet an der <.v bounds="9.965861,53.550548,9.972092,53.552579" lon={9.969023} lat={53.551369} dir="backward" ref={Radroute15} highlight="Simon-von-Utrecht-Straße">Einmündung der Simon-von-Utrecht-Straße</.v>, sodass über das Heiligengeistfeld ausgewichen werden soll.</p>

    <p>Der vorhandene Gehweg ist regelmäßig überlastet, auch außerhalb von DOM-Zeiten. Die Aufstellflächen zum Queren der Budapester Straße reichen weder für den Rad- noch Fußverkehr aus. Es kommt deswegen zu Konflikten.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der vorhandene Radweg soll auf 2,5m verbreitert werden. Zum Abbiegen in die Simon-von-Utrecht-Straße gibt es eine eigene Abbiegespur bzw. Aufstellfläche. Ab <.v bounds="9.964114,53.55104,9.970345,53.55307" lon={9.967157} lat={53.55225} dir="backward" ref={Radroute15}>Höhe der Gebäude</.v> verengt sich der Radweg auf rund 1,9m.</p>

    <p>Erstmals wird ein durchgängiger Gehweg geschaffen. Der Umweg über das Heiligengeistfeld entfällt. Im <.v bounds="9.966705,53.550189,9.972936,53.552219" lon={9.969611} lat={53.551136} dir="backward" ref={Radroute15}>Bereich der Bushaltestelle</.v> bleibt der Einstiegsbereich der Bushaltestelle wie heute. Die Breiten des Gehwegs werden unterschiedlich, etwa 2,0m bis 4,0m.</p>

    <p>Die Betonklötze werden entfernt um den nötigen Platz zu schaffen. Rechts von ihnen entsteht eine Grünfläche mit neuen Bäumen.</p>

    <h4>Meinung</h4>
    <p>Der Ansatz ist richtig. Der durchgängige Gehweg auf der „richtigen“ Seite des Radwegs wird viele Probleme lösen.</p>

    <p>Leider bleibt im Bereich der Bushaltestelle immer noch zu wenig Platz, um die Besucher zu DOM-Zeiten aufnehmen zu können. Selbst ohne großen Umbau könnte der Bus auf der rechten der vier KFZ-Spuren halten und es wäre sogar genug Platz ein Wartehäuschen aufzustellen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
