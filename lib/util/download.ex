defmodule Util.Download do
  @spec to_file(binary(), binary(), non_neg_integer()) :: :ok | {:error, atom | binary()}
  @doc """
  Downloads from the URL to the given path. The target path's partent
  directories must be present, but the file itself may not.
  """
  def to_file(url, file, allowed_redirects \\ 3) do
    Benchmark.measure("downloading #{file}", fn ->
      to_file_raw(url, file, allowed_redirects)
    end)
  end

  defp to_file_raw(url, file, allowed_redirects) do
    {:ok, code, headers, ref} = :hackney.request(url)

    case code do
      x when x in [301, 302] and allowed_redirects > 0 ->
        {_, url} = Enum.find(headers, fn {key, _val} -> String.downcase(key) == "location" end)
        to_file(url, file, allowed_redirects - 1)

      200 ->
        tmp = "#{file}.#{System.unique_integer([:positive])}.tmp"

        try do
          with {:ok, handle} <- File.open(tmp, [:write, :binary, :exclusive, :delayed_write]),
               :ok <- stream_body(ref, handle),
               :ok <- File.close(handle),
               :ok <- File.rename(tmp, file) do
            :ok
          end
        after
          File.rm(tmp)
        end

      code ->
        {:error, "unexpected status code: #{code}\nheaders: #{inspect(headers)}"}
    end
  end

  defp stream_body(ref, handle) do
    case :hackney.stream_body(ref) do
      {:ok, data} ->
        IO.binwrite(handle, data)
        |> case do
          :ok ->
            stream_body(ref, handle)

          {:error, reason} ->
            {:error, "writing to file stream failed: #{reason}"}
        end

      :done ->
        :ok

      {:error, reason} ->
        {:error, "hackney stream_body failed: #{reason}"}
    end
  end
end
