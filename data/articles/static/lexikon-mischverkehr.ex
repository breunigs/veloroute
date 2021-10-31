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
    """
  end
end
