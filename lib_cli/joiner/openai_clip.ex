defmodule Joiner.OpenAIClip do
  @moduledoc """
  Parse video using OpenAI's CLIP Model: https://github.com/openai/CLIP
  """

  require Logger

  @onnx_export_base_img {:remote, "nvcr.io/nvidia/pytorch", "24.11-py3"}

  @onnx_filename "clip-vit-base-patch32.onnx"
  @onnx_path "data/cache/#{@onnx_filename}"

  @model %{name: "openai/clip-vit-base-patch32", width: 224, height: 224, channels: 3}
  @batch_size 10
  @batch_timeout_ms 100

  @doc """
  Calculates the cosine similarity for two videos at the given starting times
  for a number of frames. If a video has less frames than specified, the output
  will be padded which might skew the results. If this is undesired, the caller
  needs to ensure that "start_time + frame_count < total_duration".

  Perfect matches return a value of 1.0. Close matches are between 0.85 to 1.0.
  Everything below that is probably not a good match.

  Example:

      # Compare 10 frames from video1 from the start with video2 at 13s 370ms
      iex> #{__MODULE__}.similarity({"video1.mp4", 0.0}, {"video2.mp4", 13.37}, 10)
      {:ok, 0.8370307087898254}
  """
  @typep video() :: {path :: binary(), start_time_in_seconds :: float()}
  @typep sim :: {:ok, cosine_similarity :: float()} | {:error, reason :: File.posix() | binary()}
  @spec similarity(video(), video(), frame_count :: pos_integer()) :: sim()
  def similarity({path1, start_s1}, {path2, start_s2}, frame_count)
      when is_float(start_s1) and start_s1 >= 0.0 and
             is_float(start_s2) and start_s2 >= 0.0 and
             is_integer(frame_count) and frame_count > 0 do
    with :ok <- ensure_started(),
         {:ok, embeds1} <- frame_embeddings(path1, start_s1, frame_count),
         {:ok, embeds2} <- frame_embeddings(path2, start_s2, frame_count) do
      {:ok, cos_sim(embeds1, embeds2)}
    end
  end

  @spec similarity(Joiner.Segment.t(), frame_count :: pos_integer()) :: sim()
  def similarity(segment, frame_count) do
    path1 = Joiner.Segment.video_path(segment, :from)
    path2 = Joiner.Segment.video_path(segment, :to)

    start1 = Joiner.Segment.start_s(segment, :from)
    start2 = Joiner.Segment.start_s(segment, :to)

    similarity({path1, start1}, {path2, start2}, frame_count)
  end

  @spec ensure_started() :: :ok | {:error, File.posix() | binary()}
  def ensure_started() do
    with :ok <- ensure_onnx(),
         :ok <- maybe_start() do
      :ok
    end
  end

  defp cos_sim(e1, e2) do
    1.0 - (Scholar.Metrics.Distance.cosine(e1, e2) |> Nx.to_number())
  end

  @spec frame_embeddings(binary(), float(), pos_integer()) ::
          {:error, binary()} | {:ok, Nx.Tensor.t()}
  defp frame_embeddings(file, start_ts, frames)
       when is_float(start_ts) and is_integer(frames) and frames > 0 do
    cmd =
      [
        "ffmpeg",
        "-hide_banner",
        "-an",
        "-ss",
        Video.Timestamp.from_seconds(start_ts),
        "-i",
        file,
        "-vf",
        Enum.join(
          [
            # scale to size while keeping aspect ratio by padding
            # "scale=w=#{@model.width}:h=#{@model.height}:force_original_aspect_ratio=1",
            # "pad=#{@model.width}:#{@model.height}:(ow-iw)/2:(oh-ih)/2"

            # scale with distortion
            "scale=w=#{@model.width}:h=#{@model.height}"
          ],
          ","
        ),
        "-frames:v",
        "#{frames}",
        "-pix_fmt",
        "rgb24",
        "-f",
        "rawvideo",
        "-"
      ]

    # Logger.debug(Util.cli_printer(cmd))

    img_bytes = @model.width * @model.height * @model.channels

    with %{result: :ok, stdout: stdout} <-
           Util.Cmd2.exec(cmd, stdout: <<>>, stderr: "", slow_warn_message: false),
         {_, 0} <- {:remaining_bytes, rem(byte_size(stdout), img_bytes)} do
      stacked =
        for <<chunk::size(^img_bytes)-binary <- stdout>> do
          chunk
          |> Nx.from_binary(:s8)
          |> Nx.reshape(
            {@model.height, @model.width, @model.channels},
            names: [:height, :width, :channels]
          )
          |> Nx.divide(255.0)
          |> Nx.transpose()
        end
        |> Nx.Batch.stack()

      pooled = Nx.Serving.batched_run(__MODULE__, stacked)

      # ensure our output is exactly #frames long
      {count, _model_output_size} = Nx.shape(pooled)
      padded = Nx.pad(pooled, 0.0, [{0, frames - count, 0}, {0, 0, 0}])

      {:ok, padded}
    else
      {:remaining_bytes, bytes} ->
        {:error,
         "ffmpeg: expected stdout bytes to be a multiple of w*h*c=#{@model.channels}*#{@model.height}*#{@model.width}=#{@model.channels * @model.height * @model.width}, but found an extra #{bytes}\nCLI: #{Util.cli_printer(cmd)}"}

      %{stderr: stderr} when stderr != "" ->
        {:error, "ffmpeg error:\nCLI: #{Util.cli_printer(cmd)}\nSTDERR: #{stderr}"}

      output ->
        {:error,
         "unexpected ffmpeg output:\nCLI: #{Util.cli_printer(cmd)}\noutput #{inspect(output)}"}
    end
  end

  @export_script_path "data/cache/open_ai_clip_onnx_export.py"
  @export_script """
  import torch
  from transformers import CLIPModel

  print("Downloading CLIP model")
  clip_model = CLIPModel.from_pretrained("#{@model.name}")
  dummy_image = torch.randn(1, #{@model.channels}, #{@model.height}, #{@model.width})

  print("Exporting CLIP model")
  torch.onnx.export(
    clip_model.vision_model,
    dummy_image,
    "/out/#{@onnx_filename}",
    input_names=["image"],
    output_names=["last_hidden_state", "pooled_output"],
    dynamic_axes={"image": {0: "batch"}},
  )
  """

  @spec ensure_onnx() :: :ok | {:error, File.posix() | binary()}
  defp ensure_onnx() do
    if File.exists?(@onnx_path), do: :ok, else: export_onnx()
  end

  defp export_onnx() do
    with :ok <- File.mkdir_p(Path.dirname(@onnx_path)),
         :ok <- File.write(@export_script_path, @export_script),
         :ok <-
           Util.Docker.run(
             "exporting ONNX for OpenAI CLIP model",
             @onnx_export_base_img,
             %{
               command_args: [
                 "bash",
                 "-c",
                 "pip --no-input --no-cache-dir --disable-pip-version-check install --no-warn-script-location --progress-bar off transformers && python /export.py"
               ],
               mounts: %{
                 @export_script_path => "/export.py",
                 Path.dirname(@onnx_path) => "/out/"
               },
               environment: %{"HOME" => "/workspace/"}
             },
             []
           ) do
      :ok
    end
  end

  @spec maybe_start() :: :ok | {:error, binary()}
  defp maybe_start do
    if is_nil(Process.whereis(__MODULE__)), do: start_link(), else: :ok
  end

  @spec start_link() :: :ok | {:error, binary()}
  defp start_link do
    Logger.debug("Loading ONNX model at #{@onnx_path}")
    model = Ortex.load(@onnx_path)
    def_backend = Nx.default_backend()

    serving =
      Nx.Serving.new(Ortex.Serving, model)
      |> Nx.Serving.client_postprocessing(fn {model_out, _server_info}, _client_info ->
        # throw away intermediate/hidden layers of model
        {_hidden, pooled} = model_out
        # Ortex doesn't implement features we want later on
        Nx.backend_transfer(pooled, def_backend)
      end)

    children = [
      {Nx.Serving,
       serving: serving,
       name: __MODULE__,
       batch_size: @batch_size,
       batch_timeout: @batch_timeout_ms}
    ]

    opts = [strategy: :one_for_one, name: OrtexServing.Supervisor]

    with {:ok, _pid} <- Supervisor.start_link(children, opts) do
      :ok
    else
      {:error, {:already_started, _pid}} -> :ok
      term -> {:error, "unknown error: #{inspect(term)}"}
    end
  end
end
