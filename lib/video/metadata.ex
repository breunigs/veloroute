defmodule Video.Metadata do
  use Agent
  require Logger

  @type t :: %Video.Metadata{
          duration: float(),
          fps: float(),
          time_base: float(),
          time_lapse: pos_integer() | nil
        }

  @typep state :: %{optional(binary) => {:ok, t()} | {:error, binary()} | boolean()}

  @derive JSON.Encoder
  @enforce_keys [:duration, :fps, :time_base, :time_lapse]
  defstruct @enforce_keys

  def start() do
    case Agent.start(fn -> read_json() end, name: __MODULE__) do
      {:ok, _pid} -> :ok
      {:error, {:already_started, _pid}} -> :ok
    end
  end

  @spec for(binary | Video.TrimmedSource.t() | Video.Source.t()) ::
          {:ok, t()} | {:error, binary()}
  def for(%{source: source}) do
    __MODULE__.for(Video.Path.source_rel_to_cwd(source))
  end

  def for(video_path) when is_binary(video_path) do
    start()

    video_path =
      if Path.absname(video_path) == video_path,
        do: Video.Path.source_rel_to_cwd(video_path),
        else: video_path

    Agent.get_and_update(
      __MODULE__,
      fn state ->
        val = state[video_path]
        state = Map.put_new(state, video_path, :pending)
        {val, state}
      end,
      :infinity
    )
    |> case do
      nil ->
        meta = run(video_path)
        Agent.update(__MODULE__, &write_json(Map.put(&1, video_path, meta)), :infinity)
        meta

      :pending ->
        Process.sleep(100)
        __MODULE__.for(video_path)

      meta ->
        meta
    end
  end

  @spec frame_duration_s(t(), non_neg_integer()) :: float()
  def frame_duration_s(%{fps: fps}, frame_count \\ 1), do: 1.0 / fps * frame_count

  def frame_duration_ms(meta, frame_count \\ 1),
    do: round(frame_duration_s(meta, frame_count) * 1000.0)

  @spec frame_count_between(t(), float(), float()) :: non_neg_integer()
  def frame_count_between(%{duration: dur, fps: fps}, start_ts, stop_ts)
      when is_float(start_ts) and is_float(stop_ts) and start_ts < stop_ts do
    start_lim = max(start_ts, 0.0)
    frame_duration = 1.0 / fps
    stop_lim = min(stop_ts, dur - frame_duration)
    floor(fps * (stop_lim - start_lim))
  end

  @doc """
  How many **output** frames each second of source time yields, given the local
  warp slope. `sample_fps > meta.fps` means output frames outnumber the source
  frames available, i.e. frames have to be generated.
  """
  @spec sample_fps(t(), float()) :: float()
  def sample_fps(%{}, slope), do: Video.Constants.output_fps() * slope

  @doc """
  Duration of `frame_count` output frames, expressed in source milliseconds.
  """
  @spec output_frame_duration_ms(t(), float(), non_neg_integer()) :: non_neg_integer()
  def output_frame_duration_ms(meta, slope, frame_count \\ 1) do
    round(frame_count / sample_fps(meta, slope) * 1000.0)
  end

  @doc """
  Like `frame_count_between/3`, but counts output frames rather than source
  frames.
  """
  @spec output_frame_count_between(t(), float(), float(), float()) :: non_neg_integer()
  def output_frame_count_between(%{duration: dur, fps: fps} = meta, slope, start_ts, stop_ts)
      when is_float(start_ts) and is_float(stop_ts) and start_ts < stop_ts do
    start_lim = max(start_ts, 0.0)
    stop_lim = min(stop_ts, dur - 1.0 / fps)
    floor(sample_fps(meta, slope) * (stop_lim - start_lim))
  end

  def approx_frame_count(%{duration: dur, fps: fps}), do: round(dur - 1.0 / fps)

  @doc """
  reads the length of a video
  """
  @spec length_ms!(binary | Video.TrimmedSource.t() | Video.Source.t() | t()) :: integer()
  def length_ms!(%{duration: seconds}) when is_float(seconds), do: round(seconds * 1000.0)

  def length_ms!(input) do
    {:ok, meta} = __MODULE__.for(input)
    round(meta.duration * 1000.0)
  end

  @spec length_ms(binary | Video.TrimmedSource.t() | Video.Source.t() | t()) :: integer() | nil
  def length_ms(%{duration: seconds}) when is_float(seconds), do: round(seconds * 1000.0)

  def length_ms(input) do
    with {:ok, meta} <- __MODULE__.for(input) do
      round(meta.duration * 1000.0)
    else
      _ -> nil
    end
  end

  def length_ms(input, :nocache) do
    with {:ok, %{duration: dur_s}} <- run(input) do
      {:ok, round(dur_s * 1000)}
    end
  end

  @spec can_use?(binary) :: boolean()
  def can_use?(codec) do
    start()
    Agent.get_and_update(__MODULE__, &codec_info(&1, codec), :infinity)
  end

  # Note these need no Video.Speedup counterpart: none of the fixture paths
  # carries a date, so Video.Speedup.for/1 falls through to the legacy constant
  # of time_lapse/desired_time_lapse = 1.0 without touching the filesystem.
  # Seeding it from here would also make Video.Metadata call Video.Speedup,
  # which Video.SpeedupTest forbids.
  def fake() do
    default_meta = %__MODULE__{
      duration: 60.0,
      fps: 30_000 / 1001,
      time_base: 1 / 90_000,
      time_lapse: 5
    }

    start()
    fake("videos/source/1.mp4", default_meta)
    fake("videos/source/2.mp4", %{default_meta | time_base: 1 / 1000})
    fake("test/fixtures/1.MP4", default_meta)
    fake("test/fixtures/2.MP4", default_meta)
    fake("test/fixtures/3.MP4", default_meta)
  end

  defp fake(path, val) do
    if Mix.env() != :test do
      raise "can only use fake for testing"
    end

    # Under both the key as given and the canonically resolved one: callers
    # reach for/1 either with a bare relative path or through
    # Video.Path.source/1, and the fixtures have no file on disk to fall back to.
    Agent.update(
      __MODULE__,
      fn state ->
        state
        |> Map.put(path, {:ok, val})
        |> Map.put(Video.Path.source_rel_to_cwd(path), {:ok, val})
      end,
      :infinity
    )
  end

  @spec codec_info(state(), binary()) :: {boolean(), state()}
  defp codec_info(state, codec) when is_map_key(state, codec),
    do: {state[codec], state}

  defp codec_info(state, codec) do
    %{status: status} =
      Util.Cmd2.exec(
        ~w[ffmpeg -hide_banner -loglevel fatal -f lavfi -i rgbtestsrc -pix_fmt yuv420p -t 0.016 -c:v] ++
          [codec] ++ ~w[-f mp4 -y /dev/null],
        stderr: "",
        stdout: ""
      )

    can_use = status == 0
    {can_use, Map.put(state, codec, can_use)}
  end

  @spec run(binary()) :: {:ok, t()} | {:error, binary()}
  defp run(video_path) do
    cli = [
      "ffprobe",
      "-hide_banner",
      "-of",
      "json",
      "-show_entries",
      "stream=r_frame_rate,time_base,duration,duration_ts,codec_tag_string:format=duration",
      video_path
    ]

    name = video_path |> Path.split() |> Enum.take(-2) |> Enum.join("/") |> Path.rootname()
    name = "metadata for " <> name

    with %{result: :ok, stdout: out} <-
           Util.Cmd2.exec(cli, stdout: "", stderr: "", name: name, slow_warn_message: false),
         {:ok, %{"streams" => streams, "format" => format}} <- JSON.decode(out),
         {:format, %{"duration" => duration}} <- {:format, format} do
      indexed = Enum.into(streams, %{}, &{Map.fetch!(&1, "codec_tag_string"), &1})
      video = indexed["hvc1"] || indexed["FFV1"] || indexed["av01"] || hd(streams)

      fps = Util.fraction_to_float(video["r_frame_rate"])
      duration = String.to_float(duration)

      from_gpmd =
        with %{"duration_ts" => dur_ts, "duration" => dur} <- indexed["gpmd"] do
          round(dur_ts / (String.to_float(dur) * 1000))
        end

      {:ok,
       %__MODULE__{
         fps: fps,
         time_base: Util.fraction_to_float(video["time_base"]),
         duration: duration,
         time_lapse: time_lapse(video_path, duration, from_gpmd)
       }}
    else
      %{result: result} -> result
      {:format, format} -> {:error, "Missing metadata. Got: #{inspect(format)} @ #{video_path}"}
      {:error, reason} -> {:error, reason}
      {:ok, decode} -> {:error, "Unexpected ffprobe JSON: #{inspect(decode)} @ #{video_path}"}
    end
  end

  # How much faster than real time the video plays. The gpmd stream states it
  # directly, but derived variants (.mkv, _stabilized.MP4) carry no gpmd, and
  # blindly assuming the default there renders them at the wrong speed: the
  # _stabilized files under 2024-10-19-ottensen and 2024-07-06-louise are
  # realtime footage that would be taken for 5x. So measure it from the GPX
  # instead, and only fall back to the assumed value with no GPX at all.
  @spec time_lapse(binary(), float(), pos_integer() | nil) :: pos_integer()
  defp time_lapse(video_path, duration, from_gpmd) do
    measured = measure_time_lapse(video_path, duration)

    case {from_gpmd, measured} do
      {nil, nil} ->
        Video.Constants.assumed_time_lapse_when_no_metadata()

      {nil, measured} ->
        measured

      {from_gpmd, nil} ->
        from_gpmd

      {same, same} ->
        same

      {from_gpmd, measured} ->
        Logger.warning(
          "#{video_path}: gpmd says time lapse #{from_gpmd}x but the GPX measures " <>
            "#{measured}x. Using the gpmd value."
        )

        from_gpmd
    end
  end

  @spec measure_time_lapse(binary(), float()) :: pos_integer() | nil
  defp measure_time_lapse(_video_path, duration) when duration <= 0.0, do: nil

  defp measure_time_lapse(video_path, duration) do
    # run/1 receives a cwd relative path, but Video.Path.abs_path/1 only passes
    # through absolute ones and would otherwise prepend the source dir twice
    with %Video.Source{} = source <- Video.Source.new_from_path(Path.expand(video_path)),
         {:ok, span_s} <- Video.Source.gpx_real_span_s(source),
         lapse when lapse >= 1 <- round(span_s / duration),
         true <- plausible_measurement?(span_s / duration, lapse) do
      lapse
    else
      _ -> nil
    end
  end

  # A genuine time lapse makes the GPX span a whole multiple of the video
  # duration: the realtime _stabilized files land within 0.2% of 1x and 4x. A
  # GPX that merely overruns its video does not — the one .mkv that still has
  # its GPX measures 6.16x against an assumed 5x — and trusting that would both
  # re-render it and add generated frames for nothing.
  defp plausible_measurement?(ratio, rounded) do
    abs(ratio - rounded) / rounded <= Video.Constants.time_lapse_measure_tolerance()
  end

  parameters =
    Video.Constants.__info__(:functions)
    |> Keyword.filter(fn {_fun, arity} -> arity == 0 end)
    |> Keyword.keys()
    |> Enum.sort()
    |> Enum.map(&apply(Video.Constants, &1, []))

  hash =
    :crypto.hash(:md5, Enum.join(parameters, " "))
    |> Base.encode16(case: :lower)

  @json_path "data/cache/video_metadata_#{hash}.json"
  @spec read_json() :: state()
  def read_json() do
    try do
      data = File.read!(@json_path)
      json = JSON.decode!(data)

      Enum.into(json, %{}, fn {key, meta} ->
        struct = Map.new(meta, fn {k, v} -> {String.to_existing_atom(k), v} end)
        # ensure we have all keys
        {key, {:ok, struct!(__MODULE__, struct)}}
      end)
    rescue
      File.Error ->
        write_json(%{})

      err ->
        IO.warn("failed to read video metadata JSON: #{inspect(err)}")
        write_json(%{})
    end
  end

  @spec write_json(state()) :: state()
  defp write_json(state) do
    cache =
      Enum.reduce(state, %{}, fn
        {path, {:ok, meta}}, acc -> Map.put(acc, path, meta)
        _other, acc -> acc
      end)

    json = JSON.encode!(cache)
    File.write(@json_path, json)

    state
  end
end
