defmodule Video.StopFlag do
  @key :video_render_stop

  def reset, do: :persistent_term.put(@key, false)
  def stop, do: :persistent_term.put(@key, true)

  def stopped? do
    :persistent_term.get(@key, false)
  end

  def trap_sigusr1 do
    spawn(fn -> sigusr1_loop() end)
  end

  defp sigusr1_loop do
    :os.set_signal(:sigusr1, :handle)

    receive do
      {:signal, :sigusr1} ->
        stop()
        IO.puts(:stderr, "\nUSR1 received — will stop after current segment(s) finish.")
    end
  end
end
