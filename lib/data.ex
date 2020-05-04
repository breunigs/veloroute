defmodule Data do
  require Logger

  # mix runs from root directory
  @root_dir File.cwd!()

  use Memoize

  defmemo(map, do: Data.MapParser.load("#{@root_dir}/data/map.osm"))

  defmemo(images, do: Data.Image.load_all("#{@root_dir}/data/images/"))

  defmemo(sequences, do: Data.Image.sequences(images()))

  defmemo(articles, do: Data.Article.load_all("#{@root_dir}/data/articles/"))

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
