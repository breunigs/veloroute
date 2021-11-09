defmodule Data.Article.Blog.Veloroute13Aenderungen do
  use Article.Default

  def created_at(), do: ~D[2019-11-01]

  def title(), do: "Änderungen Veloroute 13 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Auf der <.a href="/13">Veloroute 13</.a> wurde zwischen 2018 und 2019 die Führung rund um den Alsenplatz angepasst. Über einen <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.565301, lon: 9.950444, zoom: 16})} ref="13">Kreisel</.m> und einen <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.565301, lon: 9.950444, zoom: 16})} ref="13">Hochbordradweg</.m> kommt man jetzt viel direkter Richtung Holstenstraße. Im weiteren Verlauf gibt's auch <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.56314, lon: 9.949637, zoom: 16})} ref="13">Radfahrstreifen</.m> , die jedoch schnell wieder <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.563957, lon: 9.951167, zoom: 16})} ref="13">auf die alten Hochbordradwege</.m>  geführt werden. Diese werden erst ab 2020 im Rahmen der <.a href="/article/2018-08-29-13-holstenplatz">Umgestaltung Holstenplatz</.a> erneuert. <.m bounds={Geo.CheapRuler.center_zoom_to_bounds(%{lat: 53.56314, lon: 9.949637, zoom: 16})} ref="13">Richtung Eimsbüttel ist diese Übergangslösung</.m> etwas knapp ausgefallen und musste daher viel Kritik einstecken.</p> <p>Weitere Verbesserungen sind mir auf der Veloroute 13 nicht aufgefallen, aber <.mailto>korrigiert mich</.mailto> gerne.</p>
    """
  end
end
