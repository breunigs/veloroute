defmodule Video.Renderer.Progress do
  @params [:stream, :taken, :total, :out]
  @enforce_keys @params
  defstruct @params

  def new(rendered, pass, fps \\ nil) do
    fps = fps || Video.Constants.output_fps()
    total_frames = round(rendered.length_ms() / 1000.0 * fps)
    desc = "#{pass} #{rendered.hash()}"
    make(total_frames, desc, false)
  end

  def make(total_frames, desc, clear) do
    # immediately take 1 to force progress bar to show up
    {_taken, stream} =
      0..(total_frames + 1)
      |> Tqdm.tqdm(total: total_frames, description: desc, clear: clear)
      |> StreamSplit.take_and_drop(1)

    %__MODULE__{stream: stream, taken: 0, total: total_frames, out: []}
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
          # Cap to total so we never consume past the end of the TQDM stream
          frames = min(frames, pbar.total)
          advance = max(0, frames - pbar.taken)
          {_taken, stream} = StreamSplit.take_and_drop(pbar.stream, advance)
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
