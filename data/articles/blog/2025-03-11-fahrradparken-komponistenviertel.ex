defmodule Data.Article.Blog.FahrradparkenKomponistenviertel do
  use Article.Default

  def title(), do: "Fahrradparken im Komponistenviertel"

  def summary(),
    do:
      "Zahlreiche kleine Maßnahmen sollen Verkehrssicherheit und Fahrrad-Abstellmöglichkeiten verbessern"

  def type(), do: :planned
  def tags(), do: []

  def start(), do: ~d[2025Q3]

  def links(_assigns) do
    [
      {"Erläuterungsbericht und Karten", ~d[2025-03],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1015020"}
    ]
  end

  def map_image do
    {name(), [{"Ingenieurpartnerschaft Diercks Schröder", "https://www.ids-hh.de/kontakt/"}]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind wenige bis gar keine Möglichkeiten im Viertel vorhanden, um Fahrräder auf öffentlichem Raum zu parken. Durch wild abgestellte Fahrräder werden die Gehwege eingeengt.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Über das ganze Viertel verteilt sollen weitere Fahrradbügel aufgestellt werden. Zusätzlich sind an einigen Stellen größere Umbauten vorgesehen, etwa um die Übersicht an Kreuzungen zu verbessern oder neue Querungsstellen herzustellen.</p>

    <p>Bei den größeren Umbauten sollen 289 neue Fahrrad-Parkplätze geschaffen werden. Demgegenüber entfallen nur 32 Parkplätze, die auch von KFZ benutzt werden durften. Noch nicht in der Statistik enthalten sind Fahrradbügel, die sich ohne großen Aufwand installieren lassen. Insgesamt werden also deutlich mehr als die 289 Abstellmöglichkeiten geschaffen.</p>

    <h4>Meinung</h4>
    <p>Prinzipiell ist es eine gute Sache Gehwege von Fahrzeugen freizuhalten – egal ob Auto oder Fahrrad. Die Planung findet oft Lösungen, die auch gleich noch die Verkehrssicherheit verbessern. Super!</p>

    <p>Abseits der Optimierung oder Umverteilung von Parkplätzen, muss sich Hamburg dennoch ein Sanktionskonzept überlegen. Bei E-Scootern hat man lange aktiv weggeschaut, bei LKW, Autos und Fahrrädern tut man es noch immer. Zumindest bei KFZ wäre das Modell Japan denkbar: kein Stellplatz – keine Zulassung.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
