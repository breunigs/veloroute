defmodule Video.SegmentedRenderer.OwlProgress do
  @moduledoc false

  @params [:id, :taken, :total, :out]
  @enforce_keys @params
  defstruct @params

  def new(id, total_frames) do
    %__MODULE__{id: id, taken: 0, total: total_frames, out: []}
  end
end

defimpl Collectable, for: Video.SegmentedRenderer.OwlProgress do
  alias Video.SegmentedRenderer.LiveProgress

  def into(pbar) do
    updater = fn
      pbar, {:cont, "WARNING:" <> _rest = out} ->
        IO.puts(:stderr, out)
        %{pbar | out: [out | pbar.out]}

      pbar, {:cont, out} ->
        with [_, frames] <- Regex.run(~r/^frame=\s*(\d+)\s/m, out),
             frames <- String.to_integer(frames) do
          frames = min(frames, pbar.total)
          advance = max(0, frames - pbar.taken)
          if advance > 0, do: LiveProgress.inc(pbar.id, advance)
          %{pbar | taken: frames}
        else
          _ ->
            %{pbar | out: [out | pbar.out]}
        end

      pbar, :done ->
        remaining = pbar.total - pbar.taken
        if remaining > 0, do: LiveProgress.inc(pbar.id, remaining)
        LiveProgress.complete(pbar.id)
        pbar

      _pbar, :halt ->
        :ok
    end

    {pbar, updater}
  end
end

defimpl String.Chars, for: Video.SegmentedRenderer.OwlProgress do
  def to_string(pbar) do
    pbar.out |> Enum.reverse() |> Enum.join()
  end
end
