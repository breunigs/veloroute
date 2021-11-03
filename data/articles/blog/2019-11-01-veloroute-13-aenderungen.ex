defmodule Data.Article.Blog.Veloroute13Aenderungen do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-13-aenderungen"
  def created_at(), do: ~D[2019-11-01]

  def title(), do: "Änderungen Veloroute 13 von Mitte 2018 bis Mitte 2019"

  def type(), do: nil

  def tags(), do: ["13"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Auf der <.a href="/13">Veloroute 13</.a> wurde zwischen 2018 und 2019 die Führung rund um den Alsenplatz angepasst. Über einen <.a href="/13#16/53.565301/9.950444/EqJ9VEYGWDsDZC6SEy17GA">Kreisel</.a> und einen <.a href="/13#16/53.565301/9.950444/BPuTX715EZPHHvF4UWs6Mw">Hochbordradweg</.a> kommt man jetzt viel direkter Richtung Holstenstraße. Im weiteren Verlauf gibt's auch <.a href="/13#16/53.56314/9.949637/YwJiaBPszmajfLfwOAG1lA">Radfahrstreifen</.a> , die jedoch schnell wieder <.a href="/13#16/53.563957/9.951167/rt5IRTNdDXrspuZEoU7Bsw">auf die alten Hochbordradwege</.a>  geführt werden. Diese werden erst ab 2020 im Rahmen der <.a href="/article/2018-08-29-13-holstenplatz">Umgestaltung Holstenplatz</.a> erneuert. <.a href="/13#16/53.56314/9.949637/ESr47cdS6UAgdBoKUDNHPQ">Richtung Eimsbüttel ist diese Übergangslösung</.a> etwas knapp ausgefallen und musste daher viel Kritik einstecken.</p> <p>Weitere Verbesserungen sind mir auf der Veloroute 13 nicht aufgefallen, aber <.mailto>korrigiert mich</.mailto> gerne.</p>
    """
  end
end
