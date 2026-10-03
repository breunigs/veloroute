defmodule Util.Compress do
  require Logger

  @spec file_glob(Path.t(), binary(),
          keep_source: boolean(),
          keep_large_compressed: boolean(),
          reuse_from: {new_root :: Path.t(), old_root :: Path.t()}
        ) :: :ok
  def file_glob(path_glob, desc \\ "", opts \\ []) do
    desc = String.trim("Compressing #{desc}")

    {keep_source, opts} = Keyword.pop(opts, :keep_source, false)
    {keep_big, opts} = Keyword.pop(opts, :keep_large_compressed, false)
    {reuse_from, opts} = Keyword.pop(opts, :reuse_from, nil)
    writer = if keep_big, do: &write_always/3, else: &write_if_smaller/3
    [] = opts

    files =
      path_glob
      |> Path.wildcard()
      |> Enum.reject(fn path ->
        compressed = Path.extname(path) in [".gz", ".br"]
        compressed || File.dir?(path)
      end)

    tracked =
      if length(files) >= 5,
        do: Tqdm.tqdm(files, total: length(files), description: desc, clear: false),
        else: files

    reused =
      Parallel.map(tracked, fn path ->
        data = File.read!(path)

        if reuse(reuse_from, path, data) do
          if !keep_source, do: File.rm(path)
          true
        else
          w1 = writer.(path <> ".gz", data, gzip(data))
          w2 = writer.(path <> ".br", data, brotli(data))
          if !keep_source && w1 && w2, do: File.rm(path)
          false
        end
      end)
      |> Enum.count(& &1)

    if reused > 0,
      do: Logger.info("#{desc}: reused #{reused} of #{length(files)} already compressed files")

    :ok
  end

  # Reuses the previously compressed artifacts when the uncompressed content is
  # unchanged, which is much cheaper than compressing again. We only reuse when
  # both artifacts exist, so the "is compressing even worth it?" decision of the
  # previous run stays reproducible.
  defp reuse(nil, _path, _data), do: false

  defp reuse({new_root, old_root}, path, data) do
    old = Path.join(old_root, Path.relative_to(path, new_root))

    with true <- File.exists?(old <> ".br"),
         {:ok, gz} <- File.read(old <> ".gz"),
         {:ok, ^data} <- safe_gunzip(gz) do
      link(old <> ".gz", path <> ".gz")
      link(old <> ".br", path <> ".br")
      true
    else
      _ -> false
    end
  end

  defp safe_gunzip(data) do
    {:ok, gunzip(data)}
  rescue
    _ -> :error
  end

  defp link(from, to) do
    with {:error, _reason} <- File.ln(from, to) do
      File.cp!(from, to)
    end

    # Hard links share the inode's mtime, so refresh it to keep staleness checks
    # that look at the oldest file in a tree (see Util.IO.staleness/2) happy.
    File.touch!(to)
  end

  defp write_if_smaller(path, source, compressed) do
    if byte_size(source) > byte_size(compressed) do
      File.write(path, compressed)
      true
    else
      false
    end
  end

  defp write_always(path, _source, compressed) do
    File.write(path, compressed)
    true
  end

  def gunzip(data) do
    :zlib.gunzip(data)
  end

  @spec unzip(binary(), [binary()] | nil) ::
          {:ok, %{(file_name :: binary()) => data :: binary()}}
          | {:error, reason :: binary()}
  def unzip(data, files \\ nil) do
    args = [:memory]
    args = if files, do: [{:file_list, files} | args], else: args

    :zip.extract(data, args)
    |> case do
      {:ok, list} -> {:ok, Enum.into(list, %{}, fn {f, d} -> {to_string(f), d} end)}
      {:error, {_name, reason}} -> {:error, "#{inspect(reason)}"}
      {:error, reason} -> {:error, "#{inspect(reason)}"}
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
