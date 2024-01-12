defmodule Data.Article.Blog.KreuzungKuehnstrasseJenfelderAllee do
  use Article.Default

  def title(),
    do: "Kreuzung Jenfelder Allee/Kuehnstraße (Radroute 7, Bezirksroute W8)"

  def summary(),
    do:
      "2,5m breite Radfahrstreifen entlang der Radroute, die an Bushalten unterbrochen sind. Entlang der Bezirksroute 2,0m breite Hochbordradwege. In der Kreuzung indirektes Linksabbiegen und Rotfärbung."

  def type(), do: :planned
  def tags(), do: ["7", "br-wandsbek-w8"]

  def links(_assigns) do
    [
      {"1. Entwurf; Lageplan und Erläuterung", "Januar 2024",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1020094"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr wird meist auf 1,0m bis 1,5m breiten <.ref>Hochbordradwegen</.ref> zur Kreuzung hingeführt. Die Furten über die Kreuzung liegen dabei leicht versetzt, sodass sich jeweils S-Kurven ergeben.</p>

    <h4>Planung</h4>
    <p>Entlang der Radroute 7 sollen 2,5m breite Radfahrstreifen aufgemalt werden. Sie führen geradlinig über die Kreuzung.</p>

    <p>Die Bushaltestellen verschieben sich jeweils hinter die Kreuzung. Der Radfahrstreifen wird für die Aufstellfläche der Busse unterbrochen. Man muss dann entweder hinter dem Bus warten, oder sich in den KFZ-Verkehr einordnen um vorbeizufahren.</p>

    <p>Entlang der Bezirksroute W8 werden die Hochbordradwege jeweils kurz vor bzw. nach der Kreuzung mittels Rampe auf Fahrbahnhöhe angeglichen. Die Breite fällt mit 2,0m geringer aus und die <.v bounds="10.125098,53.580875,10.128564,53.583225" lon={10.126675} lat={53.581907} dir="backward" ref="br-wandsbek-w8">Engstelle am Baum</.v> verbleibt.</p>

    <p>In der Kreuzung werden die Radfurten rot gefärbt. Linksabbiegen ist nur <.ref>indirekt</.ref> vorgesehen.</p>

    <p>Radverkehr darf an der Ampel ca. 5 Sekunden früher starten um Abbiegeunfällen vorzubeugen. Dennoch haben Rad und Fuß gemeinsam mit KFZ/LKW-Rechtsabbiegern Grün.</p>

    <h4>Meinung</h4>
    <p>Die durchgängige Führung und breiteren Wege verbessern die Situation merklich. Leider hat man keine Lösung gefunden, damit sich Busse und Radverkehr nicht in die Quere kommen.</p>

    <p>Dass man die gefährliche Ampelschaltung beibehält, damit der KFZ-Verkehr nicht zu lange warten muss ist unverständlich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
