defmodule Data.Article.Static.LexikonRadfahrstreifenInMittellage do
  use Article.Static

  def name(), do: "lexikon/radfahrstreifen-in-mittellage"
  def title(), do: "Lexikon · Radfahrstreifen in Mittellage (RiM, Fahrradweiche)"

  def summary(),
    do: "RiMs verlaufen auf der Kreuzung zwischen den KFZ-Rechts und KFZ-Geradeaus Spuren"

  def tags(), do: ["lexikon", "rim"]

  def text(assigns) do
    ~H"""
    <p>Umgangssprachlich als „Fahrradweiche“ bezeichnet ist ein „Radfahrstreifen in Mittellage“ eine an Kreuzungen aufgemalte Verkehrsführung. Sie packt die Geradeausspur für den Radverkehr zwischen die Geradeausspur bzw. Rechtsabbiegerspur für KFZ. Beispiel: <.m bounds="10.01356,53.61575,10.018941,53.617472" lon="10.0169467" lat="53.6161836" dir="forward" route="4">Kreuzung Maienweg/Semmelmannstraße</.m>. Eine <.a href="https://nationaler-radverkehrsplan.de/de/aktuell/nachrichten/einsatzbereiche-von-radfahrstreifen-mittellage">Studie der TU Berlin</.a> kommt zum Ergebnis, das diese Führung vergleichbar mit älteren Varianten ist was Unfälle betrifft.</p>
    """
  end
end
