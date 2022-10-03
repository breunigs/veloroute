defmodule Data.Article.Static.LexikonRadfahrstreifenInMittellage do
  use Article.Static

  def name(), do: "lexikon/radfahrstreifen-in-mittellage"
  def title(), do: "Lexikon · Radfahrstreifen in Mittellage (RiM, Fahrradweiche)"

  def summary(),
    do: "RiMs verlaufen auf der Kreuzung zwischen den KFZ-Rechts und KFZ-Geradeaus Spuren"

  def tags(),
    do: ["lexikon", "radfahrstreifen-in-mittellage", "rim", "mittellage", "in-mittellage"]

  def tracks(), do: Data.Article.Blog.HammerLandstrasse.tracks()
  def point_of_interest(), do: %{lon: 10.057493, lat: 53.554926, zoom: 16}

  def text(assigns) do
    ~H"""
    <p><.m bounds="10.054611,53.554266,10.060643,53.555758" lon={10.055845} lat={53.555012} dir="forward">Videobeispiel Kreuzung Hammer Landstraße/Diagonalstraße/Hammer Steindamm</.m></p>

    <p>Umgangssprachlich als „Fahrradweiche“ bezeichnet ist ein „Radfahrstreifen in Mittellage“ eine an Kreuzungen aufgemalte Verkehrsführung. Sie packt die Geradeausspur für den Radverkehr zwischen die Geradeausspur bzw. Rechtsabbiegerspur für KFZ.
    </p>

    <.roaddiagram src="rim" alt="Eine Straßenansicht von oben (Vogelperspektive) die zeigt wo Radfahrstreifen in Mittellage im Kreuzungsbereich verlaufen."/>

    <p>Eine <.a href="https://nationaler-radverkehrsplan.de/de/aktuell/nachrichten/einsatzbereiche-von-radfahrstreifen-mittellage">Studie der TU Berlin</.a> kommt zum Ergebnis, das diese Führung vergleichbar mit älteren Varianten ist was Unfälle betrifft. Die Stadt einigte sich 2020 mit dem <.a href="https://radentscheid-hamburg.de/">Radentscheid Hamburg</.a> darauf, keine neuen Radfahrstreifen in Mittellage mehr zu planen. Da zwischen Planung und Umbau teils Jahre vergehen, taucht diese Variante stellenweise trotzdem noch auf (Stand: 2022).</p>

    <h3>Meinung</h3>
    <p>Radfahrstreifen in Mittellage kommen aus der autogerechten Planung und sind für den Radverkehr absolut ungeeignet. Hauptsächlich wurden sie eingesetzt, um trotz der Ineffizienz des Autosverkehrs noch möglichst viele Rechtsabbieger zuzulassen. In der Praxis werden sie von KFZ bei roter Ampel überstaut und zwingen den Radverkehr sich durchzuschlängeln. Nach wiederholten Todesfällen an dieser Führungsform malt Hamburg die vorhandenen RiMs rot an. RiMs lassen an der Kompetenz der Fachkommission zweifeln, die diese Variante vorgeschlagen hat.</p>
    """
  end
end
