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
      "nebenflächen"
    ]

  def text(assigns) do
    ~H"""
    <p>„Straße“ meint immer alles, also salopp von Hauswand bis Hauswand. Die Fahrbahn bezeichnet das Stück zwischen den Bordsteinen, die heute meist geteert wird. Die KFZ-Fahrspuren sind immer Teil der Fahrbahn, auch Radfahrstreifen zählen zur Fahrbahn. Als Nebenflächen bezeichnet man alles vom Randstein bis zur Hauswand, also Fußwege oder Hochbordradwege. Auch die in Hamburg häufig anzutreffenden „Baum/Parkplatz“-Streifen zählen zu den Nebenflächen.</p>

    <img src="/images/fahrbahn-und-nebenflaechen.svg" class="roaddiagram" alt="Eine Straßenansicht von oben (Vogelperspektive), die den Unterschied zwischen Nebenflächen und Fahrbahn verdeutlicht."/>

    """
  end
end
