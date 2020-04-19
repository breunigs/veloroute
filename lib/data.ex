defmodule Data do
  require Logger

  # mix runs from root directory
  @root_dir File.cwd!()

  use Memoize

  defmemo(map, do: Data.MapParser.load("#{@root_dir}/data/map.osm"))
  defmemo(articles, do: Data.Article.load_all("#{@root_dir}/data/articles/"))
  def credentials, do: Credentials

  @default_article "0000-00-00-startpage"
  def find_article(), do: find_article(@default_article)
  def find_article(""), do: find_article(@default_article)
  def find_article(nil), do: find_article(@default_article)

  def find_article(name) do
    Logger.debug("Loading article #{name}")
    articles()[name]
  end
end
