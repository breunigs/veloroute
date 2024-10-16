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
    {:ok, code, headers, ref} =
      :hackney.request(:get, url, [], "",
        follow_redirect: allowed_redirects >= 0,
        max_redirect: allowed_redirects,
        recv_timeout: :infinity
      )

    case code do
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

  # Dialyzer complains about IO.binwrite never returning {:error, _}, which
  # seems fishy, since as per Elixir's and Erlang's docs it might.
  @dialyzer {:no_match, stream_body: 2}

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
