defmodule Data do
  # mix runs from root directory
  @root_dir File.cwd!()

  @map Data.MapParser.load("#{@root_dir}/data/map.osm")
  def map, do: @map

  @articles Data.Article.load_all("#{@root_dir}/data/articles/")
  def articles, do: @articles

  @credentials Data.Credentials.load("#{@root_dir}/data/credentials.yaml")
  def credentials, do: @credentials
end
