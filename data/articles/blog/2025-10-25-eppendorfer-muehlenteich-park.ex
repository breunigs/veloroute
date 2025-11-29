defmodule Data.Article.Blog.EppendorferMuehlenteichPark do
  use Article.Default

  def title(), do: "Eppendorfer Mühlenteich Park"

  def summary(),
    do:
      "Wege im Park sollen erneuert werden. Dabei soll auch die Anbindung an Salomon-Heine-Weg verbessert werden."

  def type(), do: :planned

  def start(), do: ~d[2026]
  def stop(), do: ~d[2026]

  def tags(), do: ["br-nord-n2", "FR12"]

  def links(_assigns) do
    [
      {"Pläne Bezirksamt", ~d[2025-10],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1015798"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Man kann den Park in <.v bounds="9.984816,53.60131,9.989626,53.603193" lon={9.986399} lat={53.602265} dir="backward" ref={BrNordN2}>Richtung Salomon-Heine-Weg</.v> nur schwierig verlassen, weil eine direkte Verbindung fehlt.</p>

    <h4>Vorhaben</h4>
    <p>Die Wegbeziehung soll verbessert werden. Zusätzlich sollen <.ref>Umlaufsperren</.ref> das Radeln direkt am See unattraktiver machen.</p>

    <p>Auch alle sonstigen Wege im Park sollen erneuert werden. Steilere stellen werden gepflastert, sonst bleibt es wie heute bei Grand.</p>

    <h4>Meinung</h4>
    <p>Gerade für den Alltagsverkehr ist eine Überleitung vom Park auf die Straße hilfreich. Für den Freizeitverkehr muss der Salomon-Heine-Weg aufgewertet werden, wenn man Rad- und Fußverkehr wirklich trennen will. Der <.a ref={NeuerJungfernstieg}>Umbau des Neuen Jungernstieg</.a> könnte dabei als Vorbild dienen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
