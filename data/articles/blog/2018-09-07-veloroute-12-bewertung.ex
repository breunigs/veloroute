defmodule Data.Article.Blog.Veloroute12Bewertung do
  use Article.Default

  def name(), do: "#{created_at()}-veloroute-12-bewertung"
  def created_at(), do: ~D[2018-09-07]

  def title(), do: "Bewertung der Veloroute 12 Herbst 2018"

  def type(), do: nil

  def tags(), do: ["12"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Warum man der Veloroute 12 einen eigenen Namen gegönnt hat, statt sie einfach als Teil der <em>Ringroute</em> 13 auszuschildern ist mir nicht ganz klar. Eventuell lässt sie sich so leichter für Touristen anbieten? Immerhin sind mit Ausnahme von <.m bounds="9.935089,53.547425,9.935526,53.551769">Altona</.m> alle passierten Stationen Sehenswürdigkeiten – und der steile Anstieg in der <.m bounds="9.828914,53.546391,9.982945,53.680682">Kirchenstraße</.m> Richtung Alonta macht sie für den Alltag auch weniger attraktiv als andere Führungen.</p>
    <p>Beim Ausbaustatus macht die Route keine gute Figur: bis auf wenige Stellen, etwa in der Innenstadt bis <.m bounds="9.984327,53.545291,9.987518,53.548875">Rödingsmarkt</.m>, präsentiert sich die Route klassisch. Will sagen, Hochbordradwege die im Nichts enden und schmal sind, enge Kurven und unklare Führung.</p>
    <p>Für Teilstrecken taugt die Route also sicherlich, einen Umweg wegen ihr kann man sich aber sparen, zumindest als Einwohner.</p>
    <p><.a href="https://www.abendblatt.de/hamburg/article215621967/Die-Tour-mit-schmalen-Wegen-aber-schoenem-Hamburg-Blick.html">Zeitungsartikel/Review vom 22.10.2018</.a></p>
    """
  end
end
