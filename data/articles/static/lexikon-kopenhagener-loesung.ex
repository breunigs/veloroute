defmodule Data.Article.Static.LexikonKopenagenerLoesung do
  use Article.Static

  def name(), do: "lexikon/kopenhagener-loesung"
  def title(), do: "Lexikon · Kopenhagener Lösung"

  def summary(),
    do:
      "Radwege nach Kopenhagener Lösung sind durch Bordsteine von Fußwegen und KFZ-Streifen getrennt"

  def tags(),
    do: [
      "lexikon",
      "kopenhagener-lösung",
      "kopenhagener-radweg"
    ]

  def text(assigns) do
    ~H"""
    <p>Als <.m bounds="9.973614,53.536534,10.019039,53.546934" lon="10.0054612" lat="53.5408617" dir="backward" ref="10">Kopenhagener Lösung</.m> beschreibt man Radwege, die durch einen Bordstein von den KFZ-Spuren und dem Fußweg abgetrennt sind. Sie stellen damit eine Zwischenstufe von <.ref>Hochbordradwegen</.ref> und <.ref>Radfahrstreifen</.ref> dar.</p>
    """
  end
end
