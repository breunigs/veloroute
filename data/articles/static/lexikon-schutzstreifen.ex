defmodule Data.Article.Static.LexikonSchutzstreifen do
  use Article.Static

  def name(), do: "lexikon/schutzstreifen"
  def title(), do: "Lexikon · Schutzstreifen"

  def summary(),
    do: "Schutzstreifen verlaufen auf der KFZ-Spur und sind durch eine Strichellinie abgetrennt."

  def tags(), do: ~w(lexikon schutzstreifen)

  def text(assigns) do
    ~H"""
    <p><.m bounds="9.946338,53.581812,9.964407,53.585945" lon="9.9556474" lat="53.5846119" dir="forward" ref="3">Videobeispiel eines Schutzstreifens auf Veloroute 3</.m></p>

    <p>Schutzstreifen sind die kleinere Variante des <.ref>Radfahrstreifens</.ref> und in jeder Hinsicht schlechter gestellt. Sie sind durch eine schmale, gestrichelte Linie gekennzeichnet. Breite Fahrzeuge dürfen sie mitbenutzen und sie sind meist sehr schmal.</p>

    <img src="/images/schutzstreifen.svg" class="roaddiagram" alt="Eine Straßenansicht von oben (Vogelperspektive) die zeigt wie Schutzstreifen aussehen. Es sind Begegnungsverkehr PKW/PKW und LKW/LKW dargestellt."/>

    <p>Nicht verwechseln: „<.ref>Protected Bike Lane</.ref>“ klingt sehr ähnlich, ist für den Radverkehr aber deutlich besser.</p>
    """
  end
end
