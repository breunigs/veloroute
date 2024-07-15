defmodule Basemap.Static.Exe do
  require Benchmark

  @dir_name "maplibre-native"
  @cache_path "./data/cache/#{@dir_name}"
  @container_path "/workdir/#{@dir_name}/"
  @exe "mbgl-render"

  @dockerfile Path.join(__DIR__, "Dockerfile.maplibre-native")
  @image_ref {:dockerfile, @dockerfile}

  @spec ensure(Keyword.t()) :: :ok | {:error, binary()}
  def ensure(opts \\ [])
  def ensure(stale: :ok), do: if(File.exists?(exe()), do: :ok, else: ensure([]))

  def ensure(_opts) do
    {stale, reason} = Benchmark.measure("#{__MODULE__} staleness check", &staleness/0)

    if stale do
      Logger.info("static map renderer exe is stale because #{reason}")
      Benchmark.measure("#{__MODULE__} building", &build/0)
    else
      :ok
    end
  end

  def staleness() do
    patches = __ENV__.file |> Path.dirname() |> Path.join("patch")
    dependencies = [@dockerfile, __ENV__.file, patches, ToolVersions.path()]
    Util.IO.staleness(exe(), dependencies)
  end

  @spec build() :: :ok | {:error, binary()}
  def build() do
    with :ok <-
           Util.Docker.build_and_run(
             "building server side static tile renderer",
             @image_ref,
             %{
               # copy build artifacts to cache
               command_args: ["/bin/cp", "-r", "/build/.", @container_path]
             },
             []
           ),
         File.rm_rf(Path.dirname(exe())),
         {:ok, _files} <- File.cp_r(@cache_path, Path.dirname(exe())) do
      :ok
    else
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

    {~c"LD_PRELOAD", to_charlist(libs)}
  end
end
