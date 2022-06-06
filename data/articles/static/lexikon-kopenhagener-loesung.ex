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
    <p><.m bounds="9.999916,53.539131,10.010449,53.542032" lon="10.00548" lat="53.540836" dir="backward" ref="10">Videobeispiel Überseeallee in der HafenCity</.m></p>

    <p>Als Kopenhagener Lösung beschreibt man Radwege, die durch einen Bordstein von den KFZ-Spuren und dem Fußweg abgetrennt sind. Sie stellen damit eine Zwischenstufe von <.ref>Hochbordradwegen</.ref> und <.ref>Radfahrstreifen</.ref> dar.</p>
    """
  end
end
