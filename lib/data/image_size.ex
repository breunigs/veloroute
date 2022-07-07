defmodule Data.ImageSize do
  @search_path "data/images/*.svg"

  paths = Path.wildcard(@search_path)
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
             _ ->
               with [_all, w, h] <- Regex.run(~r/<svg [^>]*viewBox="0 0 (\d+) (\d+)/, xml) do
                 {path, {String.to_integer(w), String.to_integer(h)}}
               else
                 _ -> {path, "#{path} doesn't include width/height in the SVG"}
               end
           end
         end)

  def size(path),
    do:
      Map.get(
        @sizes,
        path,
        "no image indexed for #{path}. Check it's present in #{@search_path} and the recompile the app."
      )
end
