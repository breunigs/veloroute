defmodule Data.Article.Blog.BleickenalleeWest do
  use Article.Default

  def title(), do: "Bleickenallee / Othmarscher Kirchenweg (Radroute 1)"

  def summary(),
    do:
      "…werden zur Fahrradstraße. Bleickenallee erhält glatteres Pflaster (nördliche Fahrbahn) bzw. wird asphaltiert (südlich). KFZ-Parken im Kirchenweg wird aufgeräumt."

  def start(), do: ~d[2027Q2]

  def type(), do: :planned

  def tags(), do: ["radroute-1"]

  def map_image do
    {name(),
     [
       {"SHP Ingenieure", "https://shp-verkehrsplanung.de/"},
       {"Bezirksamt Altona – Fachamt öffentlicher Raum",
        "https://www.hamburg.de/politik-und-verwaltung/bezirke/altona/bezirksamt/dezernat-wirtschaft-bauen-umwelt-50986"}
     ]}
  end

  def links(_assigns) do
    [
      {"1. Entwurf, Karte und Erläuterung", ~d[2026-05],
       "https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1018260"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es gibt im gesamten Abschnitt keine eigenen Radwege.</p>

    <p>In der <.v bounds="9.911836,53.550131,9.918492,53.551889" lon={9.91703} lat={53.551197} dir="backward" ref={Radroute1}>westlichen Bleickenallee</.v> kann auf Kopfsteinpflaster oder auf einem unbefestigten Gehweg in Straßenmitte gefahren werden. Dort ist nur Schrittgeschwindigkeit zulässig.</p>

    <p>Im <.v bounds="9.906808,53.550293,9.913738,53.552638" lon={9.911313} lat={53.55119} dir="backward" ref={Radroute1}>Othmarscher Kirchenweg</.v> ist die Straße asphaltiert. Wegen beidseitig abgestellter KFZ bleibt noch eine schmale Fahrgasse.</p>

    <p>Im gesamten Abschnitt gilt Rechts-vor-Links.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Der Abschnitt wird zur Fahrradstraße (KFZ frei).</p>

    <p>In der Bleickenallee wird die <.v bounds="9.912109,53.55042,9.91879,53.552115" lon={9.914665} lat={53.551162} dir="forward" ref={Radroute1}>Fahrtrichtung Ottensen</.v> asphaltiert. In <.v bounds="9.912109,53.55042,9.91879,53.552115" lon={9.914665} lat={53.551162} dir="backward" ref={Radroute1}>Richtung Othmarschen</.v> wird das vorhandene Kopfsteinpflaster abgeschliffen und wieder verlegt, sodass die Oberfläche ebener wird. Der Gehweg in Straßenmitte dient künftig ausschließlich zum Spazieren.</p>

    <p>Im <.v bounds="9.906808,53.550293,9.913738,53.552638" lon={9.911313} lat={53.55119} dir="backward" ref={Radroute1}>Othmarscher Kirchenweg</.v> wird KFZ-Parken einseitig in Parkbuchten verlegt. Die nutzbare Fahrbahnbreite beträgt ca. 4m.</p>

    <p>Die Radroute erhält durchgängig Vorrang, da die Nebenstraßen als Gehwegüberfahrten angebunden werden. <.v bounds="9.911645,53.550562,9.913473,53.551388" lon={9.912464} lat={53.551103} dir="forward" ref={Radroute1}>Am Rathenaupark</.v> wird die Vorfahrt nur mit Schildern angezeigt, um das einheitliche Bild des denkmalgeschützten Platzes zu erhalten.</p>

    <h4>Meinung</h4>
    <p>Der Denkmalschutz machte die Umgestaltung hier schwierig. Der jetzt gefundene Kompromiss geht aber in Ordnung.</p>

    <p>Negativ für den Radverkehr ist nur das geschliffene Kopfsteinpflaster auf der nördlichen Bleickenallee. Es ist weniger komfortabel als Asphalt und wird schneller uneben. Verglichen mit der mangelhaften Situation aktuell ist es dennoch eine erhebliche Verbesserung.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
