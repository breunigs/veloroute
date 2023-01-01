defmodule Video.Metadata do
  use Agent

  @type t :: %Video.Metadata{duration: float(), fps: float(), time_base: float()}
  @typep state :: %{optional(binary) => t()}

  @enforce_keys [:duration, :fps, :time_base]
  defstruct @enforce_keys

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  @spec for(binary) :: {:ok, t()} | {:error, binary()}
  def for(video_path) when is_binary(video_path) do
    start_link()
    Agent.get_and_update(__MODULE__, &video_info(&1, video_path), :infinity)
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

    Agent.update(__MODULE__, fn state -> Map.put(state, path, val) end, :infinity)
  end

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

  @spec video_info(state(), binary()) :: {{:ok, t()} | {:error, binary()}, state}
  defp video_info(state, video_path) when is_map_key(state, video_path),
    do: {{:ok, state[video_path]}, state}

  defp video_info(state, video_path) do
    case run(video_path) do
      {:ok, val} ->
        {{:ok, val}, Map.put(state, video_path, val)}

      {:error, err} ->
        IO.puts(:stderr, err)
        {{:error, err}, state}
    end
  end

  defp run(video_path) do
    cli = [
      "ffprobe",
      "-hide_banner",
      "-of",
      "default=noprint_wrappers=1",
      "-select_streams",
      "v:0",
      "-show_entries",
      "stream=r_frame_rate,time_base:format=duration",
      video_path
    ]

    Util.Cmd2.exec(cli, stdout: "", stderr: "")
    |> case do
      %{result: :ok, stdout: out} ->
        [_, fr_num, fr_denom] = Regex.run(~r/^r_frame_rate=(\d+)\/(\d+)$/m, out)
        [_, tb_num, tb_denom] = Regex.run(~r/^time_base=(\d+)\/(\d+)$/m, out)
        [_, dur] = Regex.run(~r/^duration=([0-9\.]+)$/m, out)

        {:ok,
         %Video.Metadata{
           fps: String.to_integer(fr_num) / String.to_integer(fr_denom),
           time_base: String.to_integer(tb_num) / String.to_integer(tb_denom),
           duration: String.to_float(dur)
         }}

      %{result: result} ->
        result
    end
  end
end
