defmodule Data.Article.Blog.VersuchsradwegBeimSchlump do
  use Article.Default

  def created_at(), do: ~D[2022-01-27]
  def title(), do: "Versuchsradweg Beim Schlump"

  def start(), do: ~d[2022Q3]
  def stop(), do: ~d[2022Q3]

  def type(), do: :finished

  def summary(),
    do: "Pop-Up-Bikelane wird in dauerhafte Radfahrstreifen umgewandelt. Änderungen gibt es kaum."

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 2,
        group: "Beim Schlump",
        direction: :forward,
        from: "Gustav-Falke-Straße",
        to: "Bogenstraße",
        parent_ref: __MODULE__,
        text: "Beim Schlump Richtung Harvestehude",
        videos: [
          {"2022-01-08-rothenbaumchaussee/GX013101", "00:00:03.937", :end},
          {"2022-01-08-rothenbaumchaussee/GX013102", "00:00:02.269", "00:00:12.279"}
        ]
      },
      %Video.Track{
        renderer: 2,
        group: "Beim Schlump",
        direction: :backward,
        from: "Bogenstraße",
        to: "Gustav-Falke-Straße",
        parent_ref: __MODULE__,
        text: "Beim Schlump Richtung Sternschanze",
        videos: [
          {"2022-01-08-rothenbaumchaussee/GX013131", "00:00:03.837", "00:00:29.997"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/resource/blob/634066/0754dd65f495d8f179a4aa094b5ef0e0/beim-schlump-pop-up-bikelane-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan",
       "https://lsbg.hamburg.de/resource/blob/634068/66a2320ef4e912e251b8b3ea98e15431/beim-schlump-pop-up-bikelane-abgestimmte-planung-plan-data.pdf"},
      {"Auswertung des Versuchradwegs",
       "https://www.hamburg.de/contentblob/15502496/c135ea0beb75f4be7b183eddd5eb0890/data/evaluationsbericht-publ-beim-schlump.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Zur Zeit sind die <.ref>Radfahrstreifen</.ref> Beim Schlump im Rahmen eines Verkehrsversuches temporär aufgebracht.</p>

    <h4>Planung</h4>
    <p>Die temporären Radfahrstreifen werden dauerhaft übernommen. Um Falschparken auf den Radfahrstreifen zu reduzieren, werden zusätzliche Ladezonen eingerichtet. An der <.v bounds="9.973128,53.568597,9.974971,53.569749" lon={9.973826} lat={53.568914} dir="forward" ref={@ref}>Kreuzung mit der Bundesstraße</.v> werden die Radfurten rot gefärbt und Aufstelltaschen zum <.ref>indirekten Linksabbiegen</.ref> markiert. Die alten Radwegreste werden zu Fußwegen.</p>

    <p>Nach aktuellem Stand ist für Ende 2024 ein Straßenumbau vorgesehen, wo bauliche Änderungen folgen könnten. Der Ausbau beschränkt sich vorerst auf Markierungsarbeiten, die zusammen mit einer Sielbaumaßnahme erledigt werden.</p>

    <h4>Meinung</h4>
    <p>Laut Auswertung haben die Radfahrstreifen ihr Ziel erreicht die Unfälle zu reduzieren. Es ist daher gut, das sie beibehalten werden. Leider bedeutet dies auch das ein effektiver Schutz vor Falschparkern in weite Ferne rückt. Die Ladezonen helfen dabei nur, wenn sie auch tatsächlich frei bleiben.</p>

    <p>Problematisch bleibt das der Radfahrstreifen <.v bounds="9.970271,53.567353,9.973695,53.569121" lon={9.971536} lat={53.56815} dir="backward" ref={@ref}>Richtung Sternschanze</.v> einfach aufhört. Hier blockieren KFZ häufig die Weiterfahrt. Leider weichen deswegen viele Radfahrende illegal über den Fußweg aus.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
