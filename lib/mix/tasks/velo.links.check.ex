defmodule Mix.Tasks.Velo.Links.Check do
  use Mix.Task
  use Tesla

  plug Tesla.Middleware.Headers, [
    {"user-agent", "Mozilla/5.0 (X11; Linux x86_64; rv:130.0) Gecko/20100101 Firefox/130.0"}
  ]

  use Memoize
  import Guards

  # URLs that indicate a "404" but send a different status code
  @fake_404s ["fbhh-evergabe.web.hamburg.de/evergabe.bieter/ErrorMessage.aspx"]

  @timeout_ms 2 * 60 * 1_000
  plug Tesla.Middleware.Timeout, timeout: @timeout_ms
  adapter(Tesla.Adapter.Hackney, recv_timeout: @timeout_ms)

  @requirements ["app.start"]

  @shortdoc "Check structured links for 404s"
  def run(_) do
    Article.List.all()
    |> Stream.flat_map(fn art ->
      links = Article.Decorators.apply_with_assigns(art, :links)

      map_image =
        art.map_image()
        |> Kernel.||([])
        |> List.wrap()
        |> Enum.map(& &1.attribution)
        |> List.flatten()
        |> Enum.uniq()

      (links ++ map_image)
      |> Enum.flat_map(&extract/1)
      |> Enum.map(&Map.put(&1, :source, art))
    end)
    |> Stream.reject(&archive_org?/1)
    |> Stream.map(&check/1)
    |> Stream.reject(&is_nil/1)
    |> iterate()
  end

  defp iterate(stream) do
    {entries, stream} = StreamSplit.take_and_drop(stream, 1)

    with [entry] <- entries do
      task = Task.async(fn -> StreamSplit.peek(stream, 1) end)

      case entry do
        %{new_url: new_url} ->
          show(entry)
          auto_replace_ask(entry, new_url, "Automatically update URL?")

        %{archive: {:ok, archive_url}} ->
          show(entry)
          auto_replace_ask(entry, archive_url, "Replace with archived version?")

        entry ->
          show(entry)
          Util.IO.yes?("Continue?")
      end

      {_preloaded, stream} = Task.await(task, :infinity)
      iterate(stream)
    end
  end

  defp extract({name, _extra, url}), do: [%{name: name, url: url}]
  defp extract({name, url}), do: [%{name: name, url: url}]
  defp extract({_text}), do: []

  defp extract(%Phoenix.LiveView.Rendered{} = heex) do
    Util.extract_links_from_heex(heex)
    |> Enum.with_index()
    |> Enum.map(fn {href, index} -> %{name: "nested_heex_#{index}", url: href} end)
  end

  defp archive_org?(%{url: url}), do: Util.ArchiveOrg.archive_url?(url)

  @success {:ok, %{status: 200}}

  # Twitter prevents checks via bot, so don't even try
  defp check(%{url: "https://twitter.com/" <> _rest}), do: nil
  # ignore internal URLs
  defp check(%{url: "/" <> _rest}), do: nil

  defp check(%{url: url} = entry) do
    case head_or_get(url) do
      {:ok, %{status: 200}} ->
        nil

      {:ok, %{status: 302} = resp} ->
        new_path = Tesla.get_header(resp, "location")
        is_fake_404 = Enum.any?(@fake_404s, &String.contains?(new_path, &1))

        if is_fake_404 do
          Map.merge(entry, %{
            archive: Util.ArchiveOrg.mirror(url),
            reason: "not found (→ #{abs_location_header(resp, url)})"
          })
        else
          result = head_or_get(new_path)

          if !match?(@success, result) do
            Map.merge(entry, %{
              archive: Util.ArchiveOrg.mirror(url),
              reason: "broken redirect chain (→ #{abs_location_header(resp, url)})"
            })
          end
        end

      {:ok, %{status: 301} = resp} ->
        Map.merge(entry, %{
          new_url: abs_location_header(resp, url),
          reason: "perma redirect"
        })

      {:ok, %{status: 429}} ->
        IO.puts("got 429 on #{url}, sleeping 5")
        Process.sleep(5_000)
        check(entry)

      {:ok, %{status: status}} ->
        Map.merge(entry, %{
          archive: Util.ArchiveOrg.mirror(url),
          reason: "unexpected status: #{status}"
        })

      {:error, reason} ->
        Map.merge(entry, %{
          archive: Util.ArchiveOrg.mirror(url),
          reason: "unexpected error: #{inspect(reason)}"
        })
    end
  end

  defmemop head_or_get(url) do
    result = head(url)
    if match?(@success, result), do: result, else: get(url)
  rescue
    err -> {:error, err}
  end

  defp abs_location_header(response, redirect_from) do
    source = URI.parse(redirect_from)
    target = URI.parse(Tesla.get_header(response, "location"))
    URI.merge(source, target) |> to_string()
  end

  defp auto_replace_ask(entry, new_url, question) do
    if Util.IO.yes?("\n" <> question) do
      case auto_replace(entry.source, entry.url, new_url) do
        :ok ->
          :ok

        {:error, reason} ->
          IO.puts("replacing failed: #{reason}")
          Util.IO.yes?("Continue?")
      end
    end
  end

  @spec auto_replace(module(), binary(), binary()) ::
          :ok | {:error, File.posix()} | {:error, binary()}
  defp auto_replace(module, original, replacement)
       when is_module(module) and is_binary(original) and
              is_binary(replacement) do
    path = Util.module_source_path(module)
    input = File.read!(path)
    url_replace_regex = ~r/(?<=[\s"{(])#{Regex.escape(original)}(?=[\s"})])/
    output = String.replace(input, url_replace_regex, replacement)

    if input != output do
      File.write(path, output)
    else
      {:error, "URL not found in source"}
    end
  end

  defp show(entry) do
    entry = Map.put(entry, :path, Util.module_source_path(entry.source))
    entry = Map.put(entry, :status, entry.source.type())

    keys = Map.keys(entry)
    len = keys |> Enum.map(&String.length("#{&1}")) |> Enum.max()

    special = [:reason]
    default = [:source, :name, :url, :status, :path]
    order = (default ++ (keys -- default)) -- special

    IO.puts("\n\n")
    IO.puts(entry.reason)

    Enum.each(order, fn key ->
      prefix = String.pad_leading(String.upcase("#{key}"), len)

      suffix =
        case entry[key] do
          x when is_binary(x) -> x
          x when is_atom(x) -> x
          {:ok, x} when is_binary(x) -> x
          x -> inspect(x)
        end

      IO.puts("#{prefix}: #{suffix}")
    end)
  end
end
