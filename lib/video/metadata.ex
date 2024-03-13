defmodule Video.Metadata do
  use Agent

  @type t :: %Video.Metadata{
          duration: float(),
          fps: float(),
          time_base: float(),
          time_lapse: pos_integer() | nil,
          pts_correction: float()
        }

  @typep state :: %{optional(binary) => t() | boolean()}

  @enforce_keys [:duration, :fps, :time_base, :time_lapse, :pts_correction]
  defstruct @enforce_keys

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  @spec for(binary | Video.TrimmedSource.t()) :: {:ok, t()} | {:error, binary()}
  def for(%{source: source}) do
    __MODULE__.for(Video.Path.source_rel_to_cwd(source))
  end

  def for(video_path) when is_binary(video_path) do
    start_link()

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
        Agent.update(__MODULE__, &Map.put(&1, video_path, meta), :infinity)
        meta

      :pending ->
        Process.sleep(100)
        __MODULE__.for(video_path)

      meta ->
        meta
    end
  end

  @spec can_use?(binary) :: boolean()
  def can_use?(codec) do
    start_link()
    Agent.get_and_update(__MODULE__, &codec_info(&1, codec), :infinity)
  end

  def fake(path, val) do
    if Mix.env() != :test do
      raise "can only use fake for testing"
    end

    Agent.update(__MODULE__, fn state -> Map.put(state, path, {:ok, val}) end, :infinity)
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
    name = "ffprobe " <> name

    with %{result: :ok, stdout: out} <- Util.Cmd2.exec(cli, stdout: "", stderr: "", name: name),
         {:ok, %{"streams" => streams, "format" => format}} <- Jason.decode(out) do
      indexed = Enum.into(streams, %{}, &{Map.fetch!(&1, "codec_tag_string"), &1})
      video = indexed["hvc1"] || indexed["FFV1"] || hd(streams)

      time_lapse =
        with %{"duration_ts" => dur_ts, "duration" => dur} <- indexed["gpmd"] do
          round(dur_ts / (String.to_float(dur) * 1000))
        end

      fps = Util.fraction_to_float(video["r_frame_rate"])

      default = Video.Constants.assumed_time_lapse_when_no_metadata()
      desired = Video.Constants.desired_time_lapse()
      fps_change = fps / Video.Constants.output_fps()
      time_lapse_change = (time_lapse || default) / desired

      {:ok,
       %Video.Metadata{
         fps: fps,
         time_base: Util.fraction_to_float(video["time_base"]),
         duration: String.to_float(format["duration"]),
         time_lapse: time_lapse,
         # due to FPS differences, we might need to speed up the video more/less
         pts_correction: time_lapse_change / fps_change
       }}
    else
      %{result: result} -> result
      {:error, reason} -> {:error, reason}
      {:ok, decode} -> {:error, "Unexpected ffprobe JSON: #{inspect(decode)}"}
    end
  end
end
