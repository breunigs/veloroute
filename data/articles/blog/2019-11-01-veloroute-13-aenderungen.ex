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
    <p>Auf der <.a name="alltagsroute-13">Veloroute 13</.a> wurde zwischen 2018 und 2019 die Führung rund um den Alsenplatz angepasst. Über einen <.m bounds="9.944963,53.562037,9.955925,53.568565">Kreisel</.m> und einen <.m bounds="9.944963,53.562037,9.955925,53.568565">Hochbordradweg</.m> kommt man jetzt viel direkter Richtung Holstenstraße. Im weiteren Verlauf gibt's auch <.m bounds="9.944156,53.559876,9.955118,53.566404">Radfahrstreifen</.m> , die jedoch schnell wieder <.m bounds="9.945686,53.560693,9.956648,53.567221">auf die alten Hochbordradwege</.m>  geführt werden. Diese werden erst ab 2020 im Rahmen der <.a name="2018-08-29-13-holstenplatz">Umgestaltung Holstenplatz</.a> erneuert. <.m bounds="9.944156,53.559876,9.955118,53.566404">Richtung Eimsbüttel ist diese Übergangslösung</.m> etwas knapp ausgefallen und musste daher viel Kritik einstecken.</p> <p>Weitere Verbesserungen sind mir auf der Veloroute 13 nicht aufgefallen, aber <.mailto>korrigiert mich</.mailto> gerne.</p>
    """
  end
end
