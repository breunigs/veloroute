defmodule Data.Article.Blog.Manshardtstrasse do
  use Article.Default

  def title(), do: "Manshardtstraße (Radroute 1)"

  def summary(),
    do:
      "Hochbordradwege oder Kopenhagener Radwege, meist 2,75m breit. Dazu viel Fahrradparken, Bäume, breite Gehwege, die an Nebenstraßen durchgängig sind."

  def start(), do: ~d[2020-04-01]
  def stop(), do: ~d[2026-12-31]
  def construction_site_id_hh(), do: [7145]

  def type(), do: :construction

  def tags(), do: ["radroute-1"]

  def map_image do
    {name(), [{"Hochbahn", "https://www.hochbahn.de/de/kontakt"}]}
  end

  def links(_assigns) do
    [
      {"Lageplan und Erläuterungen", ~d[2024-04],
       "https://fragdenstaat.de/anfrage/lageplaene-erlaeuterungsbericht-strassenebene-manshardtstrasse/#nachricht-986224"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Beidseitig waren <.ref>Hochbordradwege</.ref> unterschiedlicher Breiten und Qualität vorhanden. Seit einigen Jahren läuft der offene Bau der U4, sodass häufig gar keine Wege vorhanden sind.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Beidseitig sind meist asphaltierte <.ref>Hochbordradwege</.ref> mit rund 2,75m Breite geplant. Sie verlaufen zwischen dem Gehweg und dem Grünstreifen. Zwischen den Bäumen werden teilweise auch KFZ-Parkplätze eingerichtet.</p>

    <p>Ab <.v bounds="10.093578,53.553437,10.103655,53.560129" lon={10.096903} lat={53.556466} dir="forward" ref="radroute-1">Stoltenstraße</.v> bis <.v bounds="10.098199,53.554917,10.10763,53.560805" lon={10.101407} lat={53.557836} dir="forward" ref="radroute-1">Rudolf-Roß-Allee</.v> ist ein 2,75m breiter Kopenhagener Radweg vorgesehen. Er wird ebenfalls asphaltiert, kann an den U-Bahn Eingängen aber etwas schmaler ausfallen. Mindestens stehen jedoch 2,4m zur Verfügung.</p>

    <p>Ausnahme ist die <.v bounds="10.097126,53.555831,10.101003,53.558461" lon={10.098721} lat={53.556961} dir="forward" ref="radroute-1">Bushaltestelle Stoltenstraße</.v> auf südlicher Seite. Hier wird der Radweg unterbrochen und über die Haltefläche des Busses geführt. Wer an einem wartenden Bus vorbeifahren möchte, muss sich in den <.ref>Mischverkehr</.ref> mit den Autos begeben.</p>

    <p>An einmündenden Nebenstraßen ist der Radweg durchgängig und wird nicht abgesenkt. Ausnahme: der <.v bounds="10.100759,53.556947,10.110962,53.560661" lon={10.102253} lat={53.558096} dir="forward" ref="radroute-1">Querkamp</.v> wird ebenerdig angebunden und daher eine Rampe auf dem Radweg notwendig.</p>

    <p>Die Kreuzungen mit <.v bounds="10.1044,53.557565,10.107462,53.559959" lon={10.105764} lat={53.558911} dir="forward" ref="radroute-1">Legienstraße / Graßmannweg</.v> und <.v bounds="10.10541,53.55814,10.110962,53.560661" lon={10.108409} lat={53.559016} dir="forward" ref="radroute-1">Dannerallee</.v> werden zu Kreisverkehren umgebaut. Dazwischen gibt es keine eigenen Radwege und es muss im <.ref>Mischverkehr</.ref> mit den KFZ gefahren werden. Erst danach gibt es auf der Südseite eine Rampe zum vorhandenen Hochbordradweg. In der Gegenrichtung soll dagegen ab Höhe <.v bounds="10.108491,53.555766,10.11763,53.561136" lon={10.112235} lat={53.558437} dir="backward" ref="radroute-1">Silberberg</.v> ein Kopenhagener Radweg beginnen und hinter der Bushaltestelle vorbeiführen.</p>

    <p>Hinzu kommen zahlreiche Möglichkeiten Fahrräder abzustellen.</p>

    <h4>Meinung</h4>
    <p>Die Stadt sollte eine Planung wie diese als neuen Standard anstreben. Ordentliche, abgetrennte Radwege. Angenehm breite Gehwege und dazu ausreichend Bäume. An unwichtigen Nebenstraßen erhalten Fuß- und Radverkehr klar Vorrang. Lediglich ein paar Sitzbänke fehlen, die gerade für ältere Leute wichtig sind.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
