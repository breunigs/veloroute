defmodule Data.Article.Blog.Veloroute8Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-10-13]

  def title(), do: "Verbesserungen Veloroute 8 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["8"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die einzige größere Änderung auf der <.a name="alltagsroute-8">Veloroute 8</.a> zwischen Sommer 2018 und 2019 die mir aufgefallen ist, ist die Fertigstellung der Fahrradstraße im <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.554868, lon: 10.078777, zoom: 16})} ref="8">Horner Weg</.m>. Vor einem Jahr wurde stadtauswärts ab dem Rhiemsweg gerade der Umbau begonnen, jetzt rollt es sich auf der gesamten Straße wunderbar.</p>
    <p>Interessant ist auch die <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.510812, lon: 10.173014, zoom: 16})} ref="8">Routenmarkierung auf der Straße Am Langberg</.m>. Sie ist von weitem gut erkennbar und zeigt klar den Weg – da man an dieser Stelle leicht die Abfahrt verpassen kann, auch eine sinnvolle Ergänzung. Es ist die einzige mir bekannte im gesamten Velorouten Netz und sie greift der geplanten, stadtweit einheitlichen Markierung voraus. Diese soll erst ab 2020 auf einem Teilstück der <.a name="alltagsroute-4">Veloroute 4</.a> erprobt werden und sieht zur Zeit andere Piktogramme vor (<.a href="https://www.buergerschaft-hh.de/parldok/dokument/68002/buergerschaftliches_ersuchen_vom_10_april_2019_velorouten_mehr_komfort_durch_bessere_kennzeichnung_drs_21_16693.pdf">Details in Drucksache 21/18365</.a>).</p>
    <p>Wenn ich etwas übersehen habe, <.mailto>schreib mir</.mailto> bitte. Die Bilder sind Ende Juli 2019 entstanden.</p>
    """
  end
end
