defmodule Data.Article.Blog.Oberhafenstrasse do
  use Article.Default

  def title(), do: "Oberhafenstraße / Oberhafenbrücke (Radroute 2)"

  def summary(),
    do: "Kreuzung wird übersichtlicher gestaltet. Privater KFZ-Verkehr wird größenteils verlegt."

  def type(), do: :planned
  def tags(), do: ["radroute-2"]

  def start(), do: ~d[2026-03-02]
  def stop(), do: ~d[2026-08-28]
  def construction_site_id_hh(), do: [1_463_841]

  def links(_assigns) do
    [
      {"fertiger Entwurf – Bericht und Karten", ~d[2024-11],
       "https://fragdenstaat.de/anfrage/oberhafenbruecke-oberhafenstrasse/#nachricht-1029576"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Ingenieurpartnerschaft Diercks Schröder", "https://www.ids-hh.de/kontakt/"},
       {"Bezirksamt Hamburg-Mitte, Fachamt Management des öffentlichen Raumes",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/mitte/bezirksamt/bezirksamtsstruktur/dezernat-wirtschaft-bauen-umwelt-66718"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Kreuzung um die Eisenbahnbrücke ist unübsichtlich. Zum einen schränken Hochwasserschutzmauern die Sicht ein. Zum anderen sind gleichzeitig viele Richtungen zu beachten. Deswegen ist die Stelle seit Jahren als Unfallschwerpunkt bekannt, die sich auch durch andere Beschilderung nicht besserte.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die <.m bounds="10.006229,53.544773,10.008157,53.546446">Oberhafenbrücke</.m> wird künftig hauptsächlich dem Bus, Rad- und Fußverkehr gewidmet. Der südliche Teil der <.m bounds="10.006378,53.545171,10.008305,53.546844">Altländer Straße</.m> wird komplett vom KFZ-Verkehr befreit.</p>

    <p>Aus <.v bounds="10.006086,53.545247,10.008591,53.546461" lon={10.006633} lat={53.54582} dir="forward" ref={Radroute2}>Richtung Innenstadt</.v> wird der Radverkehr mit mehr Abstand von der Deichmauer geführt, was bessere Sicht auf Straße der Oberhafenbrücke erlaubt. Verkehrsinseln und Poller verhindern die Befahrung des westlichen Bereich mit KFZ.</p>

    <p><.v bounds="10.006378,53.545171,10.008305,53.546844" lon={10.007101} lat={53.545812} dir="forward" ref={Radroute2}>Östlich der Eisenbahnbrücke</.v> bleibt es wie heute beim Rechts vor Links. Die Einbahnstraße in der <.m bounds="10.006439,53.545025,10.008278,53.546724">Oberhafenstraße</.m> wird in Richtung Süden gedreht. Die Verläufe der Bordsteine werden angepasst, damit Busse weiterhin durchkommen.</p>

    <p>An den Rampen zum Deich werden die Poller bzw. Betonklötze entfernt. Stattdessen sollen Rüttelstreifen den Radverkehr auf die komplexe Situation aufmerksam machen. Zusätzlich kommen noch Fahrradbügel, Sitzbänke und neue Bäume hinzu.</p>

    <h4>Meinung</h4>
    <p>Die unübersichtliche Stelle zu verbessern ist längst überfällig. Zumindest eine Seite tatsächlich autofrei zu machen hilft viel.</p>

    <p>Die Schilder auf der anderen Seite sind jedoch reine Augenwischerei. Spätestens seit dem Debakel um den Jungfernstieg sollte klar sein, dass Schilder nicht beachtet werden. Leider wurden effektivere Maßnahmen als zu teuer abgelehnt.</p>

    <p>Trotz fehlender Vorfahrt entlang der Radroute sollte die Fahrt entlang der Radroute besser werden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
