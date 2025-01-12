defmodule Settings do
  defmacro c(key) do
    quote do
      Application.compile_env!(:veloroute, [Settings, unquote(key)])
    end
  end

  def r(:video_dir_abs), do: Path.join(File.cwd!(), r(:video_dir_rel))
  def r(:video_source_dir_abs), do: Path.join(File.cwd!(), r(:video_source_dir_rel))
  def r(:video_target_dir_abs), do: Path.join(File.cwd!(), r(:video_target_dir_rel))

  def r(key), do: Application.fetch_env!(:veloroute, Settings) |> Map.fetch!(key)
end
