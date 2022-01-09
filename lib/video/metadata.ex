defmodule Video.Metadata do
  use Agent

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  @spec for(binary) :: %{duration: float(), fps: float()} | nil
  def for(video_path) when is_binary(video_path) do
    start_link()
    Agent.get_and_update(__MODULE__, &video_info(&1, video_path))
  end

  @spec can_use?(binary) :: boolean()
  def can_use?(codec) do
    start_link()
    Agent.get_and_update(__MODULE__, &codec_info(&1, codec))
  end

  defp codec_info(state, codec) when is_map_key(state, codec),
    do: {state[codec], state}

  defp codec_info(state, codec) do
    %{status: status} =
      Util.cmd2(
        ~w[ffmpeg -hide_banner -loglevel fatal -f lavfi -i rgbtestsrc -pix_fmt yuv420p -t 0.016 -c:v] ++
          [codec] ++ ~w[-f mp4 -y /dev/null],
        stderr: "",
        stdout: ""
      )

    can_use = status == 0
    {can_use, Map.put(state, codec, can_use)}
  end

  defp video_info(state, video_path) when is_map_key(state, video_path),
    do: {state[video_path], state}

  defp video_info(state, video_path) do
    case run(video_path) do
      {:ok, val} ->
        {val, Map.put(state, video_path, val)}

      {:error, err} ->
        IO.puts(:stderr, err)
        {nil, state}
    end
  end

  defp run(video_path) do
    cli = [
      "ffprobe",
      "-hide_banner",
      "-of",
      "compact=p=0",
      "-select_streams",
      "0",
      "-show_entries",
      "stream=r_frame_rate:format=duration",
      video_path
    ]

    Util.cmd2(cli, stdout: "", stderr: "")
    |> case do
      %{status: 0, stdout: out} ->
        [_, num, denom] = Regex.run(~r/^r_frame_rate=(\d+)\/(\d+)$/m, out)
        [_, dur] = Regex.run(~r/^duration=([0-9\.]+)$/m, out)

        {:ok,
         %{
           fps: String.to_integer(num) / String.to_integer(denom),
           duration: String.to_float(dur)
         }}

      %{status: code, stdout: stdout, stderr: stderr} ->
        {:error,
         """
          ffprobe failed with #{code}
          CLI: #{Enum.join(cli, " ")}
          OUT: #{stdout}
          ERR: #{stderr}
         """}
    end
  end
end
