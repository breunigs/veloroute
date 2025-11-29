defmodule Data.Article.Blog.Ferdinandstor do
  use Article.Default

  def updated_at(), do: ~D[2025-08-15]

  def title(), do: "Ferdinandstor (Radrouten 2 und 6, Freizeitrouten 2 und 3)"

  def summary(),
    do:
      "Alsterseite: 4,0m breite Protected-Bike-Lane unter der Brücke. Seite Kunsthalle: 2,5m Hochbordradweg. Anschlüsse bleiben wie bisher."

  def start(), do: ~d[2021-06-14]
  def stop(), do: ~d[2026Q3]
  # def construction_site_id_hh(), do: [16775, 718_592]

  def type(), do: :construction

  def tags(), do: ["radroute-6", "radroute-2", "5", "6", "FR2", "FR3"]

  def tracks(), do: []

  def map_image do
    {name(), [{"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def links(_assigns) do
    [
      {"Straßenplanung: Karte und Bericht", ~d[2025-08],
       "https://fragdenstaat.de/anfrage/ferdinandstor-und-an-der-alster-anckelmannsplatz/#nachricht-1027031"},
      {"Baustelleninfo der Bahn",
       "https://www.eisenbahnbruecken-ehm.de/ferdinandstor-an-der-alster.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Beidseitig waren <.ref>Hochbordradwege</.ref> vorhanden. Seit Sommer 2021 erneuert die Deutsche Bahn die Brücke, sodass sich die genaue Führung immer mal wieder ändert.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Auf der <.v bounds="10.000008,53.555662,10.003289,53.557319" lon={10.001107} lat={53.555802} dir="backward" ref={Radroute2}>Seite der Kunsthalle</.v> wird ein 2,5m breiter Hochbordradweg neben einem 2,5m breiten Gehweg angelegt. Zum Schutz vor KFZ werden Metallbügel aufgestellt.</p>

    <p>Auf <.v bounds="10.000008,53.555662,10.003289,53.557319" lon={10.002083} lat={53.557174} dir="forward" ref={Radroute2}>der Alsterseite</.v> weitet sich der schmale Hochbordradweg zu einer 4,0m breiten <.ref>Protected-Bike-Lane</.ref> unter der Brücke auf. Der Radweg verläuft rechts der Brückenpfeiler. Die <.v bounds="9.999839,53.555578,10.002548,53.55692" lon={10.000689} lat={53.556429} dir="forward" ref={Radroute2}>Fahrradweiche über den KFZ-Rechtsabbieger</.v> bleibt in etwa wie heute. Der Gehweg wird hier rund 3,25m breit.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
