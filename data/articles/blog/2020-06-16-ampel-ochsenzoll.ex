defmodule Data.Article.Blog.AmpelOchsenzoll do
  use Article.Default

  def name(), do: "#{created_at()}-ampel-ochsenzoll"
  def created_at(), do: ~D[2020-06-16]

  def title(), do: "Ochsenzoll (Veloroute 4)"

  def type(), do: :ampel

  def tags(), do: ["4"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Um der Veloroute stadteinwärts folgen zu können muss bereits kurz nach der U-Bahn bereits die Straße gequert werden. Auch nach dem Umbau gibt es keine direkte, einleuchtende Querungsmöglichkeit auf <.m bounds="9.999377,53.676354,10.003115,53.677856" lon="10.0007942" lat="53.6772907" dir="backward">Höhe der Fibinger Straße</.m>. Das Hauptproblem ist jedoch, dass die Ampel den Radverkehr nicht erkennt und man Taster am Ampelmast betteln muss. Der befindet sich aber auf dem Fußweg, also nur durch Absteigen und damit sehr unbequem erreichbar. Pfeile um die Abbiegemöglichkeit zu verdeutlichen fehlen ebenfalls. Lange Rede, kurzer Sinn: diese Planungs- oder Baumängel sind für einen frischen Umbau (≈ 2019) peinlich, umsomehr da die Situation vor allem für den Radverkehr besser werden sollte.</p>
    """
  end
end
