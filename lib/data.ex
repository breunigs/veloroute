defmodule Data do
  # mix runs from root directory
  @root_dir File.cwd!()

  use Memoize

  defmemo(map, do: Data.MapParser.load("#{@root_dir}/data/map.osm"))
  defmemo(articles, do: Data.Article.load_all("#{@root_dir}/data/articles/"))
  defmemo(credentials, do: Data.Credentials.load("#{@root_dir}/data/credentials.yaml"))
end
