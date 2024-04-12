defmodule Video.DiskPreloader do
  use GenServer
  import Guards
  require Logger

  @consider_preloaded_for_hours 12
  @zerotime ~U[2000-01-01 00:00:00.000000Z]

  @typep state :: %{optional(binary()) => DateTime.t()}
  @typep hash :: <<_::256>>

  # Round timestamp to down nearest multiple of this. Avoids individual preloads
  # for every millisecond step, which is very likely cached already.
  @timestamp_accuracy_ms 10_000

  @enabled Application.compile_env!(:veloroute, :disk_preload)

  @spec warm(hash(), %{:time_offset_ms => non_neg_integer(), optional(any) => any}) :: :ok
  def warm(hash, %{time_offset_ms: time_offset_ms}) when valid_hash(hash) do
    if @enabled do
      time_offset_ms = div(time_offset_ms, @timestamp_accuracy_ms) * @timestamp_accuracy_ms
      GenServer.cast(__MODULE__, {:dir, hash, time_offset_ms})
    else
      :ok
    end
  end

  @spec start_link(keyword) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, Keyword.put_new(opts, :name, __MODULE__))
  end

  @spec handle_cast(
          {:dir, hash(), non_neg_integer()}
          | {:cat_file, binary()}
          | {:cat_file, binary(), Range.t()}
          | {:parse_m3u8, binary(), non_neg_integer()},
          state()
        ) :: {:noreply, state()}
  @impl true
  def handle_cast({:dir, hash, time_offset_ms}, state) do
    key = "#{hash} #{time_offset_ms}"
    last_update = state[key] || @zerotime
    now = DateTime.utc_now()
    age_in_hours = DateTime.diff(now, last_update) / (60 * 60)

    if age_in_hours > @consider_preloaded_for_hours do
      cat_from_disk(hash, time_offset_ms)
      {:noreply, Map.put(state, key, now)}
    else
      {:noreply, state}
    end
  end

  def handle_cast({:cat_file, file}, state) do
    case File.read(file) do
      {:ok, _content} ->
        Logger.debug("preloaded #{file}")

      {:error, reason} ->
        Logger.debug("failed to read #{file}: #{reason}")
    end

    {:noreply, state}
  end

  def handle_cast({:cat_file, file, range}, state) do
    case :file.open(to_charlist(file), [:read, :raw]) do
      {:ok, f} ->
        case :file.pread(f, range.first, range.last - range.first) do
          {:ok, _data} ->
            Logger.debug("preloaded #{file} for #{inspect(range)}")

          :eof ->
            Logger.debug("read #{file} past the end (tried #{inspect(range)})")

          {:error, reason} ->
            Logger.debug("failed to pread #{file}: #{reason}")
        end

        :file.close(f)

      {:error, reason} ->
        Logger.debug("failed to open #{file}: #{reason}")
    end

    {:noreply, state}
  end

  def handle_cast({:parse_m3u8, m3u8_path, time_offset_ms}, state) do
    with {:ok, tokens} <- M3U8.Tokenizer.read_file(m3u8_path),
         ranges <- M3U8.Utils.byte_range_for(tokens, time_offset_ms) do
      Enum.each(ranges, fn
        {_name, nil} ->
          nil

        {name, range} ->
          video_path = Path.dirname(m3u8_path) |> Path.join(name)
          GenServer.cast(__MODULE__, {:cat_file, video_path, range})
      end)
    else
      {:error, reason} ->
        Logger.debug("failed to parse m3u8 #{m3u8_path}: #{reason}")
    end

    {:noreply, state}
  end

  @impl true
  def handle_info(:cleanup, state) do
    fresh_after = DateTime.utc_now() |> DateTime.add(-60 * 60 * @consider_preloaded_for_hours)

    state =
      Enum.reduce(state, %{}, fn
        {_key, updated}, acc when updated < fresh_after -> acc
        {key, updated}, acc -> Map.put(acc, key, updated)
      end)

    cleanup_periodically()

    {:noreply, state}
  end

  @one_day 24 * 60 * 60 * 1000
  defp cleanup_periodically() do
    Process.send_after(self(), :cleanup, @one_day)
  end

  @spec init(:ok) :: {:ok, state()}
  @impl true
  def init(:ok) do
    cleanup_periodically()
    {:ok, %{}}
  end

  @spec cat_from_disk(hash(), non_neg_integer()) :: :ok
  defp cat_from_disk(hash, time_offset_ms) do
    list_files(hash)
    |> Enum.filter(&String.ends_with?(&1, ".m3u8"))
    |> Enum.sort()
    |> Enum.each(fn file -> GenServer.cast(__MODULE__, {:parse_m3u8, file, time_offset_ms}) end)
  end

  @spec list_files(hash()) :: [binary()]
  defp list_files(hash) do
    path = Path.join(Settings.video_target_dir_abs(), hash)

    case File.ls(path) do
      {:ok, list} ->
        Enum.map(list, &Path.join(path, &1))

      {:error, :enoent} ->
        []

      {:error, reason} ->
        Logger.debug("failed to read #{path}: #{reason}")
        []
    end
  end
end
