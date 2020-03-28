defmodule Data do
  # mix runs from root directory
  @root_dir File.cwd!()

  @map Data.MapParser.load("#{@root_dir}/data/map.osm")
  def map, do: @map
end
