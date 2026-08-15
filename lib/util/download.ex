defmodule Util.Download do
  require Benchmark

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
    {:ok, code, headers, ref_or_body} =
      :hackney.request(:get, url, [], "",
        follow_redirect: false,
        pool: false,
        recv_timeout: :infinity,
        connect_timeout: 30_000
      )

    case code do
      200 ->
        tmp = "#{file}.#{System.unique_integer([:positive])}.tmp"

        try do
          with {:ok, handle} <- File.open(tmp, [:write, :binary, :exclusive, :delayed_write]),
               :ok <- write_body(ref_or_body, handle),
               :ok <- File.close(handle) do
            File.rename(tmp, file)
          end
        after
          File.rm(tmp)
        end

      redirect when redirect in [301, 302, 303, 307, 308] ->
        maybe_close(ref_or_body)

        if allowed_redirects <= 0 do
          {:error, "too many redirects"}
        else
          location = get_location(headers)
          to_file_raw(location, file, allowed_redirects - 1)
        end

      code ->
        {:error, "unexpected status code: #{code}\nheaders: #{inspect(headers)}"}
    end
  end

  defp get_location(headers) do
    {_, location} = List.keyfind(headers, "Location", 0) || List.keyfind(headers, "location", 0)
    location
  end

  defp maybe_close(ref) when is_reference(ref), do: :hackney.close(ref)
  defp maybe_close(_body), do: :ok

  # hackney returns the body directly for small responses
  defp write_body(body, handle) when is_binary(body) do
    IO.binwrite(handle, body)
  end

  defp write_body(ref, handle) when is_reference(ref) do
    stream_body(ref, handle)
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
        :hackney.close(ref)
        :ok

      {:error, reason} ->
        {:error, "hackney stream_body failed: #{reason}"}
    end
  end
end
