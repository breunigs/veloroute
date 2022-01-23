defmodule Data.ImageSize do
  paths = Path.wildcard("data/images/*.svg")
  paths_hash = :erlang.md5(paths)

  for path <- paths do
    @external_resource path
  end

  def __mix_recompile__?() do
    Path.wildcard("data/images/*.svg") |> :erlang.md5() != unquote(paths_hash)
  end

  @sizes Enum.into(paths, %{}, fn path ->
           xml = File.read!(path)

           with [_all, w] <- Regex.run(~r/<svg [^>]*width="(\d+)/, xml),
                [_all, h] <- Regex.run(~r/<svg [^>]*height="(\d+)/, xml) do
             {path, {String.to_integer(w), String.to_integer(h)}}
           else
             _ -> {path, nil}
           end
         end)

  def size(path), do: Map.get(@sizes, path)
end
