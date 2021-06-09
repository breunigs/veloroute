defmodule Cache.Videos do
  @data Benchmark.measure("#{__MODULE__}: finding rendered videos", fn ->
          Video.Rendered.all_from_map(Cache.Map.full_map())
        end)

  def get(hash), do: Map.get(@data, hash)
end
