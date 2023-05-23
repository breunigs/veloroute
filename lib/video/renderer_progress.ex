defmodule Video.Renderer.Progress do
  @params [:stream, :taken, :out]
  @enforce_keys @params
  defstruct @params

  def new(rendered) do
    total_frames = round(rendered.length_ms() / 1000.0 * Video.Constants.output_fps())
    desc = "rendering #{rendered.hash()}"

    # immediately take 1 to force progress bar to show up
    {_taken, stream} =
      0..(total_frames + 1)
      |> Tqdm.tqdm(total: total_frames, description: desc, clear: false)
      |> StreamSplit.take_and_drop(1)

    %__MODULE__{stream: stream, taken: 0, out: []}
  end
end

defimpl Collectable, for: Video.Renderer.Progress do
  def into(pbar) do
    updater = fn
      pbar, {:cont, "WARNING:" <> _rest = out} ->
        IO.puts(:stderr, out)
        %{pbar | out: [out | pbar.out]}

      pbar, {:cont, out} ->
        with [_, frames] <- Regex.run(~r/^frame=\s*(\d+)\s/m, out),
             frames <- String.to_integer(frames) do
          {_taken, stream} = StreamSplit.take_and_drop(pbar.stream, frames - pbar.taken)
          %{pbar | taken: frames, stream: stream}
        else
          _ ->
            %{pbar | out: [out | pbar.out]}
        end

      pbar, :done ->
        Stream.run(pbar.stream)
        pbar

      _pbar, :halt ->
        :ok
    end

    {pbar, updater}
  end
end

defimpl String.Chars, for: Video.Renderer.Progress do
  def to_string(pbar) do
    pbar.out |> Enum.reverse() |> Enum.join()
  end
end
