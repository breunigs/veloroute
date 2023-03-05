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
      <<161, 24, 2, 0, 32, 9, 130, 150, 22, 223, 4, 177, 13>>
  """
  def brotli(data) when is_binary(data) do
    {:ok, tmp} = Temp.path("veloroute-compress-brotli")

    try do
      File.write!(tmp, data)

      System.cmd("brotli", ["--quality=#{@brotli_compression_level}", "--stdout", tmp])
      |> case do
        {compressed, 0} -> compressed
        {_out, exit_code} -> raise "Failed to compress with brotli (exit code #{exit_code})"
      end
    after
      File.rm(tmp)
    end

    # Util.Cmd2.exec(
    #   [
    #     "brotli",
    #     "--quality=#{@brotli_compression_level}",
    #     "--stdout",
    #     "-"
    #   ],
    #   stdin: data,
    #   stdout: ""
    # )
    # |> case do
    #   %{result: :ok, stdout: br} -> br
    #   %{result: {:error, error}} -> raise "Failed to compress with brotli: #{error}"
    # end
  end
end
