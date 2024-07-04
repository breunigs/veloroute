defmodule Data.Article.Blog.Argentinienbruecke do
  use Article.Default

  def title(), do: "Argentinienbrücke (Radroute 11)"

  def start(), do: ~d[2024-09-02]
  def stop(), do: ~d[2024-09-19]
  def construction_site_id_hh(), do: [877_179]

  def summary(),
    do:
      "In Richtung Wilhelmsburg wird eine Protected-Bike-Lane angelegt, sodass der zweimalige Umweg über die Ampel entfällt."

  def type(), do: :intent

  def tags(), do: ["11"]

  def links(_assigns) do
    [
      {"FragDenStaat.de Anfrage Lagepläne/Erläuterungsbericht", ~d[2024-07],
       "https://fragdenstaat.de/anfrage/lageplan-und-erlaeuterungsbericht-protected-bike-lane-argentinienbruecke/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In <.v bounds="9.97225,53.526858,9.978837,53.529696" lon={9.973877} lat={53.527935} dir="forward" ref="11">Fahrtrichtung Wilhelmsburg</.v> muss die Straßenseite zwei mal gewechselt werden, da es auf der Südseite keinen Radweg gibt. Auch das Radeln auf der <.ref>Fahrbahn</.ref> ist verboten. Die Ampelschaltzeiten sind sehr lang, sodass hoher Zeitverlust auftritt.</p>

    <h4>Vorhaben</h4>
    <p>Die rechte KFZ-Fahrspur soll zu einer <.ref>Protected-Bike-Lane</.ref> ausgebaut werden.</p>

    <h4>Meinung</h4>
    <p>Endlich. Es bleibt zu hoffen, dass die Abzweigung zur <.m bounds="9.97242,53.526409,9.980139,53.528896">Ellerholzbrücke</.m> sinnvoll gestaltet wird. Da nur der Abschnitt der Radroute überarbeitet wird, bleibt die Weiterfahrt Richtung <.m bounds="9.976615,53.520886,10.031977,53.533112">Veddel</.m> vermutlich umständlich. Die Hamburg Port Authority wurde gebeten die genauen Pläne zu veröffentlichen.</p>

    <h4>Links</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
