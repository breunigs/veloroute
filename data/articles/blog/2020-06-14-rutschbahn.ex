defmodule Data.Article.Blog.Rutschbahn do
  use Article.Default

  def created_at(), do: ~D[2020-06-14]

  def title(), do: "Rutschbahn (Veloroute 3)"

  def start(), do: ~d[2020Q1]
  def stop(), do: ~d[2020-06-19]

  def type(), do: :finished

  def tags(), do: ["3"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Zur Zeit wird in der Rutschbahn gebaut. Die Umleitung erfolgt über den Fußweg, der trotz des erheblichen Platzmangels als gemeinsamer Rad- und Fußweg ausgeschildert wurde. Die Straße soll dabei so hergestellt werden, wie sie vorher war – eine Verbesserung für den Rad- oder Fußverkehr wird nicht vorgenommen. Die Baustelle soll im Juni fertig werden.</p>
    """
  end
end
