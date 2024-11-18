defmodule Data.Article.Static.LexikonFahrbahnUndNebenflaechen do
  use Article.Static

  def name(), do: "lexikon/fahrbahn-und-nebenflaechen"
  def title(), do: "Lexikon · Fahrbahn und Nebenflächen"

  def summary(),
    do: "Salopp: Fahrbahn ist was aus Asphalt ist, Nebenflächen alles andere."

  def tags(),
    do: [
      "lexikon",
      "fahrbahn-und-nebenflaechen",
      "fahrbahn",
      "fahrbahnen",
      "nebenflächen"
    ]

  def text(assigns) do
    ~H"""
    <p><em>Straße</em> meint immer alles, also von Hauswand bis Hauswand.</p>

    <p>Direkt an den Häusern schließen die <em>Nebenflächen</em> an. Sie enthalten Gehwege, <.ref>Hochbordradwege</.ref>, <.ref>Kopenhagener Radwege</.ref>, Grünstreifen oder Abstellmöglichkeiten für Fahrräder und Autos. Die Nebenflächen enden in der Regel am Randstein der Trumme (Regenablauf).</p>

    <p>Der meist asphaltiere Teil zwischen den Randsteinen heißt <em>Fahrbahn</em>. KFZ-Fahrspuren sind immer Teil der Fahrbahn, auch Fahrrad-<.ref>Schutzstreifen</.ref> (schmale, gestrichelte Linie) sind es.</p>

    <p><.ref>Radfahrstreifen</.ref> sind <em>Sonderwege</em>: sie sind rechtlich weder Teil der Fahrbahn, noch der Nebenflächen. Das gilt so auch für <.ref>Protected-Bike-Lanes</.ref>.</p>

    <p>In der Praxis bezeichnet man Schutzstreifen und Radfahrstreifen als <em>fahrbahnnah</em>. Protected-Bike-Lanes, Kopenhagener Radwege und Hochbordradwege dagegen als <em>fahrbahnbegleitend</em>.</p>

    <.roaddiagram src="fahrbahn-und-nebenflaechen" alt="Eine Straßenansicht von oben (Vogelperspektive), die den Unterschied zwischen Nebenflächen und Fahrbahn verdeutlicht."/>
    """
  end
end
