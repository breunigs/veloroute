defmodule Util.ArchiveOrg do
  use Tesla
  use Memoize

  @base "https://web.archive.org"

  plug Tesla.Middleware.BaseUrl, @base
  plug Tesla.Middleware.Headers, [{"user-agent", Settings.email()}]
  plug Tesla.Middleware.JSON

  @timeout_ms 2 * 60 * 1_000
  plug Tesla.Middleware.Timeout, timeout: @timeout_ms
  adapter(Tesla.Adapter.Hackney, recv_timeout: @timeout_ms)

  @doc """
  Searches archive.org for mirrors of this URL, returning the most recent
  successful mirror if there is one.
  """
  @spec mirror(binary()) :: {:ok, mirrored_url :: binary()} | {:error, reason :: binary()}
  defmemo mirror(url) do
    encoded = URI.encode_www_form(url)
    search = "/cdx/search/cdx?url=#{encoded}&output=json"
    result = get(search)

    with {:ok, %{status: 200, body: body}} <- result,
         %{timestamp: timestamp} <- latest_successful(body) do
      {:ok, "#{@base}/web/#{timestamp}/#{url}"}
    else
      {:error, err} -> {:error, "failed to search: #{err}"}
      err -> {:error, "failed to search: #{inspect(err)}"}
    end
  end

  def archive_url?(url) do
    String.starts_with?(url, @base)
  end

  defp latest_successful(body) do
    candidates =
      body
      |> Enum.map(fn [url_key, timestamp, original, mimetype, status_code, digest, length] ->
        %{
          url_key: url_key,
          timestamp: timestamp,
          original: original,
          mimetype: mimetype,
          status_code: status_code,
          digest: digest,
          length: length
        }
      end)
      |> Enum.sort_by(& &1.timestamp)

    real_page =
      candidates
      |> Enum.reject(fn entry -> entry.status_code != "200" end)
      |> List.last()

    redirect =
      candidates
      |> Enum.reject(fn entry -> !(entry.status_code in ["301", "302"]) end)
      |> List.last()

    real_page || redirect || {:error, "search for this URL turned up no results"}
  end
end
