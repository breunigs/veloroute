defmodule Allris do
  @districts ~w(altona eimsbuettel hamburg-mitte hamburg-nord wandsbek bergedorf harburg)
  @bhvv_prefix "https://bv-hh.de/"

  def districts, do: @districts

  def url(district, type, id)

  def url(district, "VOLFDNR", id) when district in @districts do
    "https://sitzungsdienst-#{district}.hamburg.de/bi/vo020.asp?VOLFDNR=#{id}"
  end

  def url(district, "TOLFDNR", id) when district in @districts do
    "https://sitzungsdienst-#{district}.hamburg.de/bi/to020.asp?TOLFDNR=#{id}"
  end

  def url(district, "SILFDNR", id) when district in @districts do
    "https://sitzungsdienst-#{district}.hamburg.de/bi/to010.asp?SILFDNR=#{id}"
  end

  def url_bv_hh(district, type, id)

  def url_bv_hh(district, "VOLFDNR", id) when district in @districts do
    "#{@bhvv_prefix}#{district}/documents/allris?allris_id=#{id}"
  end

  def url_bv_hh(district, "TOLFDNR", id) when district in @districts do
    "#{@bhvv_prefix}#{district}/agenda_items/allris?allris_id=#{id}"
  end

  def url_bv_hh(district, "SILFDNR", id) when district in @districts do
    "#{@bhvv_prefix}#{district}/meetings/allris?allris_id=#{id}"
  end

  def url_bv_hh(district, _type, _id) when district in @districts do
    nil
  end

  def url_bv_hh(%{"district" => d, "type" => t, "id" => i}), do: url_bv_hh(d, t, i)

  @sitzungsdienst_regex ~r|^https://sitzungsdienst-*(?<district>[^.]+).hamburg.de/bi/.*?\?(?<type>[A-Z]+)=(?<id>\d+)$|

  @spec convert_url_to_bvhh(binary) :: binary() | nil
  def convert_url_to_bvhh(url) do
    with match when is_map(match) <- Regex.named_captures(@sitzungsdienst_regex, url),
         url when is_binary(url) <- url_bv_hh(match),
         :ok <- attachment_status(url) do
      url
    else
      _ -> nil
    end
  end

  @cache_path "data/auto_generated/bv_hh_attachment_cache.json"

  defp read_cache() do
    with {:ok, data} <- File.read(@cache_path),
         {:ok, cache} <- Jason.decode(data) do
      Enum.into(cache, %{}, fn {k, v} -> {k, String.to_existing_atom(v)} end)
    else
      _ -> %{}
    end
  end

  @spec attachment_status(binary()) :: :ok | :missing | :unknown
  if Application.compile_env(:veloroute, :env) == :prod do
    use Memoize

    defmemop read_cache_once() do
      read_cache()
    end

    defp attachment_status(@bhvv_prefix <> _rest = url) do
      read_cache_once()[url] || :unknown
    end
  else
    use Agent
    require Logger
    use Tesla
    plug Tesla.Middleware.FollowRedirects
    @spec attachment_status_uncached(binary()) :: :ok | :missing | :unknown
    defp attachment_status_uncached(url) do
      Logger.debug("checking BV HH URL for attachments (#{url})")

      with {:ok, %{status: 200, body: body}} <- get(url) do
        if String.contains?(body, "Anhänge"), do: :ok, else: :missing
      else
        _ -> :unknown
      end
    end

    defp attachment_status(@bhvv_prefix <> _rest = url) do
      Agent.start_link(fn -> read_cache() end, name: __MODULE__)

      Agent.get_and_update(
        __MODULE__,
        fn
          %{^url => result} = cache ->
            {result, cache}

          cache ->
            result = attachment_status_uncached(url)
            cache = Map.put(cache, url, result)

            clean =
              cache
              |> Map.filter(fn {_key, val} -> val != :unknown end)
              |> Jason.encode!()

            File.write(@cache_path, clean)

            {result, cache}
        end,
        :infinity
      )
    end
  end
end
