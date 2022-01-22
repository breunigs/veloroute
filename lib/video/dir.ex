defmodule Video.Dir do
  def must_exist!(fun \\ fn -> nil end) when is_function(fun) do
    case present?() do
      {:error, msg} ->
        raise msg

      :ok ->
        fun.()
    end
  end

  def present? do
    Settings.video_source_dir_abs()
    |> File.stat()
    |> case do
      {:ok, %{type: :directory}} ->
        :ok

      {:ok, %{type: :symlink}} ->
        :ok

      any ->
        {:error,
         "#{Settings.video_source_dir_abs()} should point to video data, but it's not accessible: #{inspect(any)}"}
    end
  end
end
