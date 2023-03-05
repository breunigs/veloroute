defmodule Search.Meilisearch.Exe do
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

  @version "v1.0.2"
  filename = "meilisearch-#{os}-#{arch}"
  @url "https://github.com/meilisearch/meilisearch/releases/download/#{@version}/#{filename}"
  @exe "#{filename}-#{@version}"

  def ensure_downloaded() do
    path = path()

    unless File.exists?(path) do
      :ok = Util.Download.to_file(@url, path)
    end

    :ok = File.chmod(path, 0o555)
  end

  def path(), do: Path.join(to_string(:code.priv_dir(:veloroute)), @exe)
end
