defmodule Data.Article.Blog.AbrissEssohaeuser do
  use Article.Default

  def created_at(), do: ~D[2020-01-01]

  def title(), do: "Baugrube ehemalige Esso-Häuser"

  def type(), do: :construction

  def tags(), do: ["9"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    Bedingt durch die Baugrube auf der Fläche der ehemaligen „Esso-Häuser“ wird die Veloroute 9 stadtauswärts über den <.m bounds="10.004614,53.548439,10.005449,53.550092">Johanniswall</.m> umgeleitet.
    """
  end
end
