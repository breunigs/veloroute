defmodule Data.Article.Blog.Vierlandenstrasse do
  use Article.Default

  def title(), do: "Vierlandenstrasse (Bergedorfer Straße bis Sander Damm)"

  def summary(),
    do: "Protected-Bike-Lane geplant, allerdings mit Lücken für Bushalt und Parkplätze."

  def type(), do: :planned
  def tags(), do: []
  def start(), do: ~d[2023Q3]
  def stop(), do: ~d[2023Q3]

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "November 2022",
       "https://lsbg.hamburg.de/contentblob/12275556/0d16576522a6ea9bccc8ffec808bf97d/data/vierlandenstrasse-von-bergedorfer-strasse-bis-sander-damm-abgestimmte-planung-bericht.pdf"},
      {"Lageplan/Karte", "November 2022",
       "https://lsbg.hamburg.de/contentblob/12275558/5cd94f216794ee9530afdbe3c61611bc/data/vierlandenstrasse-von-bergedorfer-strasse-bis-sander-damm-abgestimmte-planung-plaene.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Abschnitt stehen beidseitig <.ref>Hochbordradwege</.ref> zur Verfügung.</p>

    <h4>Planung</h4>
    <p>Es sollen beidseitig <.ref>Radfahrstreifen</.ref> mit rund 2,0m Breite eingerichtet werden, die stellenweise durch 30cm breite Randsteine vom KFZ-Verkehr abgetrennt sind (<.ref>Protected-Bike-Lane</.ref>). Wegen Bushaltestellen, Einfahrten und Einmündungen sind die Randsteine nicht durchgängig. Busse halten auf dem Radfahrstreifen.</p>

    <p>Zum Linksabbiegen in die <.m bounds="10.208368,53.485606,10.210725,53.48649">Dietrich-Schreyge-Straße</.m> und die <.m bounds="10.209448,53.48514,10.211806,53.486024">Rektor-Ritter-Straße</.m> sind Verkehrsinseln in der Straßenmitte vorgesehen, sodass man in zwei Schritten abbiegen kann. An den anderen Einmündungen werden keine Querungshilfen eingerichtet.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
