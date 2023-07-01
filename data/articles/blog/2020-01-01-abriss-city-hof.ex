defmodule Data.Article.Blog.AbrissCityHof do
  use Article.Default

  def created_at(), do: ~D[2020-01-01]

  def title(), do: "Baustelle ehemaliger City-Hof"

  def type(), do: :construction
  def start(), do: ~d[2019]
  def stop(), do: ~d[2023-08-01]
  # def construction_site_id_hh(), do: [113_099]

  def tags(), do: ["9"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    Bedingt durch die Baustelle auf der Fläche des ehemaligen „City-Hof“ wird die Veloroute 9 stadtauswärts über den <.m bounds="10.004614,53.548439,10.005449,53.550092">Johanniswall</.m> umgeleitet.
    """
  end
end
