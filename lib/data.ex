defmodule Data do
  require Logger

  @map_path "data/map.osm"

  @external_resource @map_path

  def full_map,
    do: Benchmark.measure("loading full map", fn -> Data.MapParser.load(@map_path) end)

  def relations, do: Data.MapCache.relations()
  def images, do: Data.ImageCache.images()
  def sequences, do: Data.ImageCache.sequences()

  def articles, do: Data.ArticleCache.get()

  def credentials, do: Credentials

  def find_article(), do: find_article(Settings.default_page())
  def find_article(""), do: find_article(Settings.default_page())
  def find_article(nil), do: find_article(Settings.default_page())

  def find_article(name) do
    Logger.debug("Loading article #{name}")
    articles()[name]
  end

  def find_page(name), do: find_article("0000-00-00-#{name}")
end
