defmodule Basemap.Static.Exe do
  @dir_name "maplibre-native"
  @cache_path "./data/cache/#{@dir_name}"
  @container_path "/workdir/#{@dir_name}/"
  @exe "mbgl-render"

  @dockerfile Path.join(__DIR__, "Dockerfile.maplibre-native")

  @spec ensure(Keyword.t()) :: :ok | {:error, binary()}
  def ensure(opts \\ [])
  def ensure(stale: :ok), do: if(File.exists?(exe()), do: :ok, else: build())
  def ensure(_opts), do: if(stale?(), do: build(), else: :ok)

  def stale?() do
    patches = __ENV__.file |> Path.dirname() |> Path.join("patch")
    Util.IO.stale?(exe(), [@dockerfile, __ENV__.file, patches])
  end

  @spec build() :: :ok | {:error, binary()}
  def build() do
    with %{result: :ok} <-
           Docker.build_and_run(
             @dockerfile,
             # copy build artifacts to cache
             ["/bin/cp", "-r", "/build/.", @container_path],
             name: "building server side static tile renderer"
           ),
         File.rm_rf(Path.dirname(exe())),
         {:ok, _files} <- File.cp_r(@cache_path, Path.dirname(exe())) do
      :ok
    else
      %{result: result} -> result
      {:error, posix, file} -> {:error, "#{posix} #{file}"}
      error -> error
    end
  end

  defp exe(), do: Path.join([to_string(:code.priv_dir(:veloroute)), @dir_name, @exe])

  def command_line(), do: ["/usr/bin/xvfb-run", "-a", exe()]

  def ld_preload() do
    dir = Path.dirname(exe())

    libs =
      Path.join(dir, "*.so.*")
      |> Path.wildcard()
      |> Enum.join(":")

    {'LD_PRELOAD', to_charlist(libs)}
  end
end