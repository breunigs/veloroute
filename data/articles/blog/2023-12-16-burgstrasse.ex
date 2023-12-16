defmodule Data.Article.Blog.Burgstrasse do
  use Article.Default

  def title(), do: "Burgstraße (Radroute 13)"

  def summary(),
    do:
      "Kreuzung Bethesdastraße erhält vollständige Ampel, kurzes Stück Protected-Bike-Lane vor Kreuzung Sievekingsallee"

  def start(), do: ~d[2024-03]
  def stop(), do: ~d[2024-08]

  def type(), do: :planned

  def tags(), do: ["13"]

  def links(_assigns) do
    [
      {"Ausschreibung Umbau", "Dezember 2023",
       "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/3d8d8576-675d-49ec-b71c-54942fde9762/details"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In <.v bounds="10.038178,53.555074,10.041867,53.559624" lon={10.039422} lat={53.557504} dir="forward" ref="13">Richtung Süden</.v> steht ein <.ref>Hochbordradweg</.ref> zur Verfügung. In <.v bounds="10.038178,53.555074,10.041867,53.559624" lon={10.040254} lat={53.556187} dir="backward" ref="13">Richtung Norden</.v> gibt es im Bereich der <.a name="13">Radroute 13</.a> einen <.ref>Radfahrstreifen</.ref>. Dieser wird kurz vor der Kreuzung mit der <.v bounds="10.038178,53.555074,10.041867,53.559624" lon={10.039669} lat={53.557566} dir="backward" ref="13">Bethesdastraße</.v> auf einen Hochbordradweg aufgeleitet.</p>

    <h4>Planung</h4>
    <p>Im Bereich der Radroute wird der Asphalt erneuert und der Radfahrstreifen auf 2,0m verbreitert. Die Kreuzung mit der <.v bounds="10.038178,53.555074,10.041867,53.559624" lon={10.039669} lat={53.557566} dir="backward" ref="13">Bethesdastraße</.v> erhält eine vollständige Ampel, was das Linksabbiegen vereinfacht.</p>

    <p>In Richtung <.m bounds="10.03824,53.557451,10.040757,53.560364">Sievekingsallee</.m> wird der Radverkehr über die Haltefläche der verlegten Bushaltestelle geführt. Danach schließt sich eine 2,0m breite <.ref>Protected-Bike-Lane</.ref> an. In der Gegenrichtung wird der vorhandene Hochbordradweg leicht angepasst, bleibt aber mit 1,62m so breit wie heute. Er wird zwischen Wartefläche für Fahrgäste und dem Fußweg geführt.</p>

    <p>In der Kreuzung mit der Sievekingsallee werden die Radwege so angepasst, dass <.ref>indirektes Linksabbiegen</.ref> eine klarere Aufstellfläche erhält. Zusätzlich werden weiße Noppenplatten zur besseren Trennung von Rad- und Fußweg ergänzt.</p>

    <h4>Meinung</h4>
    <p>Die Ampel an der Bethesdastraße und das kurze Stück Protected-Bike-Lane sind gut.</p>

    <p>Ansonsten entspricht die Planung nicht mehr den mittlerweile eingeführten Qualitätsstandards. 1,62m sind zu eng. Betonpflastersteine nach wenigen Jahren hubbeliger als Asphalt. Der <.v bounds="10.038178,53.555074,10.041867,53.559624" lon={10.039422} lat={53.557504} dir="forward" ref="13">südliche Hochbordradweg</.v> wird nichtmal saniert. An der Sievekingsallee wird der Radverkehr weiterhin mit dem Fußverkehr geschaltet. An der Bushaltestelle nach Norden wäre auch ein Bypass wie an der <.v bounds="9.992246,53.582256,9.998645,53.585235" lon={9.995232} lat={53.583653} dir="backward" ref="br-eimsbuettel-isebek">St. Benedictstraße</.v> möglich gewesen, statt den Radverkehr über weite Strecken ungeschützt in den KFZ-Verkehr zu werfen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
