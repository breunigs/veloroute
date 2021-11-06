defmodule Data.Article.Static.LexikonRadfahrstreifen do
  use Article.Static

  def name(), do: "lexikon/radfahrstreifen"
  def title(), do: "Lexikon · Radfahrstreifen"

  def summary(),
    do: "Radfahrstreifen sind asphaltierte Radwege direkt neben den KFZ-Spuren"

  def tags(), do: ["lexikon", "radfahrstreifen", "radfahrstreifens"]

  def text(assigns) do
    ~H"""
    <p><.m bounds="9.944998,53.563638,9.954255,53.565782" lon="9.9503139" lat="53.564714" ref="13" dir="backward">Radfahrstreifen</.m> werden auf dem gleichen Niveau geführt wie die KFZ-Fahrspuren und durch einen weißen „Breitstrich“ von diesen abgegrenzt. KFZ dürfen den Radfahrstreifen nicht benutzen – befahren, halten oder parken sind verboten. Die einzige Ausnahme ist um Einfahrten oder Parkplätze rechts des Radfahrstreifens zu erreichen; man spricht hier häufig von „überfahren“.</p>
    <p>Zur Breite: leider wird der 25cm „Breitstrich“ meist dem Radfahrstreifen zugeschlagen – befahren werden darf er jedoch nicht, auch nicht mit dem Lenker. Die StVO geht hier mit schlechtem Beispiel voran. Nicht ganz so häufig wird auch der Sicherheitsabstand zu Parkplätzen („<.ref>Dooring</.ref>“) mit in die Breite gezählt.</p>
    """
  end
end
