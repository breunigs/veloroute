defmodule Util.Compress do
  def file_glob(path_glob, keep \\ true, desc \\ "") do
    desc = String.trim("Compressing #{desc}")

    files =
      Path.wildcard(path_glob)
      |> Enum.reject(&File.dir?/1)
      |> Enum.reject(fn path -> Path.extname(path) in [".gz", ".br"] end)

    files =
      if length(files) >= 5,
        do: Tqdm.tqdm(files, total: length(files), description: desc, clear: false),
        else: files

    Parallel.each(files, fn path ->
      data = File.read!(path)
      w1 = write_if_smaller(path <> ".gz", data, gzip(data))
      w2 = write_if_smaller(path <> ".br", data, brotli(data))
      if !keep && w1 && w2, do: File.rm(path)
    end)
  end

  defp write_if_smaller(path, source, compressed) do
    if byte_size(source) > byte_size(compressed) do
      File.write(path, compressed)
      true
    else
      false
    end
  end

  def gzip(data) do
    :zlib.gzip(data)
  end

  @brotli_compression_level 9
  @doc """
  Returns content compressed in brotli

  ## Examples

      iex> Util.Compress.brotli("hi hi hi hi hi hi hi hi hi hi hi hi hi hi hi hi hi hi hi hi hi hi hi")
      <<27, 67, 0, 0, 36, 65, 208, 210, 226, 155, 32, 182, 1>>
  """
  def brotli(data) when is_binary(data) do
    {:ok, br} = :brotli.encode(data, %{quality: @brotli_compression_level})
    br
  end
end
