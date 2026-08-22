defmodule Video.StopFlag do
  @key :video_render_stop

  def reset, do: :persistent_term.put(@key, false)
  def stop, do: :persistent_term.put(@key, true)

  def stopped? do
    :persistent_term.get(@key, false)
  end

  def trap_sigusr2 do
    ref = make_ref()

    {:ok, _} =
      System.trap_signal(:sigusr2, ref, fn ->
        stop()
        msg = "\nUSR2 received — will stop after current segment(s) finish."

        if GenServer.whereis(Video.SegmentedRenderer.LiveProgress),
          do: Video.SegmentedRenderer.LiveProgress.log_async(msg),
          else: IO.puts(:stderr, msg)
      end)

    ref
  end
end
