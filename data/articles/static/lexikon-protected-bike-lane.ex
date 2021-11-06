defmodule Data.Article.Static.LexikonProtectedBikeLane do
  use Article.Static

  def name(), do: "lexikon/protected-bike-lane"
  def title(), do: "Lexikon · Protected Bike Line"

  def summary(),
    do: "Protected Bike Lanes sind durch hohe Bordsteine oder Poller vorm KFZ-Verkehr geschützt"

  def tags(),
    do: [
      "lexikon",
      "protected-bike-lane",
      "protected-bike-lanes",
      "pbl"
    ]

  def text(assigns) do
    ~H"""
    <p>Unter einer „<.m lat="53.45947" lon="9.99094" dir="backward" ref="11" bounds="9.986734,53.458457,9.997266,53.465207">Protected Bike Line</.m>“, also einer geschützten Radspur, versteht man eine vom Autoverkehr abgetrennte Fahrradspur. Eine Trennung wird durch einen extra Bordstein, Poller oder ähnliche Absperrelementen erreicht. Ihr Hauptvorteil liegt im besseren Fahrgefühl, da die Chancen sinkt das Autofahrende die Spur illegal mitbenutzen oder darauf parken.</p>
    <p>Nicht verwechseln: „<.ref>Schutzstreifen</.ref>“ klingt sehr ähnlich, stellt den Radverkehr aber deutlich schlechter.</p>
    """
  end
end
