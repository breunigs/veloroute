defmodule Data.Article.Blog.WaltershoferStrasse do
  use Article.Default

  def title(), do: "Waltershofer Straße / Cuxhavener Straße (Radroute 10)"

  def summary(), do: "Provisorische Abschnitte sollen Protected-Bike-Lanes erhalten."

  def type(), do: :planned

  def tags(), do: ["radroute-10"]

  def links(_assigns) do
    [
      {"Lagepläne Bezirksamt", ~d[2025-10],
       "https://fragdenstaat.de/anfrage/knoten-cuxhavener-strasse-waltershofer-strasse/#nachricht-1052952"}
    ]
  end

  def map_image do
    {name(),
     [
       {"Bezirksamt Harburg H/MR21", "https://www.hamburg.de/service/info/11333191/"},
       {"Ingenieurbüro Münster GmbH", "https://ib-muenster.de/kontakt/"}
     ]}
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang der Radroute 10 wird man provisorisch über die Gehwege geleitet. Teilweise sind eigene Radwege vorhanden, die aber nicht sinnvoll erreicht werden können.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Die noch in Arbeit befindliche Planung sieht vor die fehlenden Abschnitte in der <.v bounds="9.899262,53.470526,9.904431,53.474835" lon={9.9007} lat={53.473771} dir="backward" ref={Radroute10}>Waltershofer Straße</.v> als <.ref>Protected-Bike-Lane</.ref> herzurichten. Lediglich in Richtung Norden ab etwa der Bahnbrücke bleibt es beim gemeinsamen Rad- und Gehweg.</p>

    <p>Auf der Cuxhavener Straße soll der <.ref>Radfahrstreifen</.ref> nachträglich noch Protektions-Elemente erhalten.</p>

    <p>Im Kreuzungsbereich beider Straßen erfolgt das Rechtsabbiegen jeweils über die Haltefläche der Busse. Damit KFZ-Fahrer die Kurve nicht schneiden, sind stellenweise Verkehrsinseln vorgesehen.</p>

    <p>Zusätzlich soll eine neue Furt <.ref>direktes Linksabbiegen</.ref> von der Waltershofer Straße in Richtung Harburg ermöglichen.</p>

    <h4>Meinung</h4>
    <p>Auf den ersten Blick stimmt die Richtung der Planung. Hoffen wir, dass sie bis zur Fertigstellung so beibehalten wird.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
