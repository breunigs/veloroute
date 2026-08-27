defmodule Search.Meilisearch.Exe do
  require Logger

  os =
    case :os.type() do
      {_, :linux} -> :linux
      {_, :darwin} -> :macos
    end

  arch =
    :erlang.system_info(:system_architecture)
    |> to_string()
    |> case do
      "x86_64" <> _ -> :amd64
      "arm64" <> _ -> if os == :macos, do: :"apple-silicon", else: :aarch64
      "aarch64" <> _ -> :aarch64
    end

  @version "v1.53.1"
  filename = "meilisearch-#{os}-#{arch}"
  @url "https://github.com/meilisearch/meilisearch/releases/download/#{@version}/#{filename}"
  @exe "#{filename}-#{@version}"

  def ensure_downloaded() do
    path = path()

    if File.exists?(path) do
      :ok
    else
      Logger.debug("Downloading Meilisearch from #{@url}")
      :ok = Util.Download.to_file(@url, path)
      :ok = File.chmod(path, 0o555)
      :ok
    end
  end

  def version(), do: @version

  def path(), do: Path.join(to_string(:code.priv_dir(:veloroute)), @exe)

  def purge_old_data!() do
    Path.wildcard("priv/meilisearch-*")
    |> Enum.reject(&String.contains?(&1, version()))
    |> Enum.each(&File.rm_rf!/1)
  end
end
