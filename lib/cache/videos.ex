defmodule Cache.Videos do
  @data Video.Rendered.all_from_map(Cache.Map.full_map())

  def get(hash), do: Map.get(@data, hash)
end
