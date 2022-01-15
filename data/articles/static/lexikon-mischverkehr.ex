defmodule Data.Article.Static.LexikonMischverkehr do
  use Article.Static

  def name(), do: "lexikon/mischverkehr"
  def title(), do: "Lexikon · Mischverkehr"

  def summary(),
    do: "Im Mischverkehr teilen sich Fahrrad und Auto die gleichen Spuren"

  def tags(), do: ["lexikon", "mischverkehr"]

  def text(assigns) do
    ~H"""
    <p>Als Mischverkehr wird eine Verkehrsführung bezeichnet, wo sich KFZ- und Radverkehr die Fahrspuren teilen, also „durchmischt“ fahren. Das ist in Hamburg in praktisch allen Nebenstraßen der Fall.</p>
    <img src="/images/mischverkehr.svg" class="roaddiagram" />
    <h4>Überholen / Nebeneinander fahren</h4>
    <p>Durch die vorgeschriebenen 1,5m Überholabstand kann mit dem Auto in der Regel nicht überholt werden. Rechenbeispiel: In neu hergerrichteten Straßen wird die Fahrbahn (der Asphalt) meist 4,5m breit. Autos messen rund 2,0m, ein einspuriges Fahrrad 0,8m. Mit 1,5m Überholabstand ergeben sich bereits 4,3m minimal notwendige Breite. Rechnet man noch die Sicherheitsabstände zum Bordstein hinzu ist klar, das Überholen für KFZ nicht möglich ist. Mit dem Fahrrad sind mindestens 0,8m zur Kanalrinne einzuhalten, um bei Stöcken, Glasscherben und anderen Hindernissen ausweichen zu können.</p>
    <p>Wenn mit dem Auto schon ein einzelnes Fahrrad nicht überholt werden darf, dann ändert auch Nebeneinanderfahren daran nichts mehr. Klönt schön!</p>
    """
  end
end
