defmodule Data.Article.Blog.Kueckenbracksweg do
  use Article.Default

  def name(), do: "#{created_at()}-kueckenbracksweg"
  def created_at(), do: ~D[2020-07-05]

  def title(), do: "Kükenbracksweg/Wilhelmsburger Reichsstraße (Veloroute 11)"

  def stop(), do: ~d[2021-04-30]

  def type(), do: :finished

  def tags(), do: ["11"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Im Zuge der Verlegung der alten Wilhelmsburger Reichsstraße ist ein Stück der Veloroute 11 momentan gesperrt. Eine Umleitung über die Georg-Wilhelm-Straße ist ausgeschildert. Leider bedeutet dies einen großen Umweg und die Qualität ist für den Radverkehr mangelhaft. Die Bauarbeiten verzögern sich leider und mittlerweile geht man erst von einer Fertigstellung gegen Ende April 2021 aus.</p>
    """
  end
end
