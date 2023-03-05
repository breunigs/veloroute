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
  @exe "./data/cache/#{filename}-#{@version}"

  def ensure_downloaded() do
    unless File.exists?(@exe) do
      :ok = Util.Download.to_file(@url, @exe)
    end

    :ok = File.chmod(@exe, 0o555)
  end

  def path(), do: Path.expand(@exe)
end
