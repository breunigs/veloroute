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

  @max_redirects 10

  @timeout_ms 2 * 60 * 1_000
  plug Tesla.Middleware.Timeout, timeout: @timeout_ms
  adapter(Tesla.Adapter.Hackney, recv_timeout: @timeout_ms)

  @requirements ["app.start"]

  @shortdoc "Check structured links for 404s"
  def run(_) do
    Article.List.all()
    |> Stream.flat_map(fn art ->
      links = Article.Decorators.apply_with_assigns(art, :links)

      map_image = art.map_image() |> Data.MapImage.attribution()

      (links ++ map_image)
      |> Enum.flat_map(&extract/1)
      |> Enum.map(&Map.put(&1, :source, art))
    end)
    |> Stream.reject(&archive_org?/1)
    |> Stream.map(&check/1)
    |> Stream.reject(&is_nil/1)
    |> iterate(%{})
  end

  defp iterate(stream, decisions) do
    {entries, stream} = StreamSplit.take_and_drop(stream, 1)

    with [entry] <- entries do
      task = Task.async(fn -> StreamSplit.peek(stream, 1) end)

      decisions =
        case entry do
          %{new_url: new_url} ->
            show(entry)
            auto_replace_ask(entry, new_url, "Automatically update URL?", decisions)

          %{archive: {:ok, archive_url}} ->
            show(entry)
            auto_replace_ask(entry, archive_url, "Replace with archived version?", decisions)

          entry ->
            show(entry)
            Util.IO.yes?("Continue?")
            decisions
        end

      {_preloaded, stream} = Task.await(task, :infinity)
      iterate(stream, decisions)
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

  # these prevents checks via bot, so don't even try
  defp check(%{url: "https://twitter.com/" <> _rest}), do: nil
  defp check(%{url: "https://www.komoot.com/" <> _rest}), do: nil
  defp check(%{url: "https://komoot.com/" <> _rest}), do: nil
  # known to 404 quickly, and don't archive well
  defp check(%{url: "https://fbhh-evergabe.web.hamburg.de/" <> _rest}), do: nil
  # ignore internal URLs
  defp check(%{url: "/" <> _rest}), do: nil
  defp check(%{url: "mailto:" <> _email}), do: nil

  defp check(%{url: url} = entry) do
    case head_or_get(url) do
      {:ok, %{status: 200}} ->
        nil

      {:ok, %{status: status} = resp} when status in [301, 302, 307, 308] ->
        first_target = abs_location_header(resp, url)
        is_permanent = status in [301, 308]

        case follow_redirects(first_target, is_permanent, 1, [url]) do
          {:ok, _final_url, false} ->
            # pure temporary redirect chain that resolves to 200: leave URL alone
            nil

          {:ok, final_url, true} ->
            # chain contains at least one permanent redirect → treat as permanent
            Map.merge(entry, %{
              new_url: final_url,
              reason: "perma redirect"
            })

          {:fake_404, offending_url} ->
            Map.merge(entry, %{
              archive: Util.ArchiveOrg.mirror(url),
              reason: "not found (→ #{offending_url})"
            })

          {:broken, detail} ->
            Map.merge(entry, %{
              archive: Util.ArchiveOrg.mirror(url),
              reason: "broken redirect chain: #{detail} (→ #{first_target})"
            })
        end

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

  # Follows redirects up to @max_redirects hops. Returns:
  #   {:ok, final_url, has_permanent} - chain reached 200
  #   {:fake_404, url}                - a hop target is a known fake-404 URL
  #   {:broken, detail}               - chain failed, looped, or exceeded depth
  defp follow_redirects(url, has_permanent, redirects_followed, visited)

  defp follow_redirects(_url, _has_permanent, redirects_followed, _visited)
       when redirects_followed >= @max_redirects do
    {:broken, "exceeded #{@max_redirects} redirects"}
  end

  defp follow_redirects(url, has_permanent, redirects_followed, visited) do
    cond do
      url in visited ->
        {:broken, "redirect loop at #{url}"}

      Enum.any?(@fake_404s, &String.contains?(url, &1)) ->
        {:fake_404, url}

      true ->
        case head_or_get(url) do
          {:ok, %{status: 200}} ->
            {:ok, url, has_permanent}

          {:ok, %{status: status} = resp} when status in [301, 302, 307, 308] ->
            next_url = abs_location_header(resp, url)
            next_permanent = has_permanent or status in [301, 308]
            follow_redirects(next_url, next_permanent, redirects_followed + 1, [url | visited])

          {:ok, %{status: 429}} ->
            IO.puts("got 429 on #{url}, sleeping 5")
            Process.sleep(5_000)
            follow_redirects(url, has_permanent, redirects_followed, visited)

          {:ok, %{status: status}} ->
            {:broken, "status #{status} at #{url}"}

          {:error, reason} ->
            {:broken, "error at #{url}: #{inspect(reason)}"}
        end
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
    merged = URI.merge(source, target)
    # URI.merge follows RFC 3986 and always takes the fragment from the target,
    # which drops client-side anchors across redirects. Carry them forward when
    # the redirect target does not specify its own fragment.
    merged = if is_nil(merged.fragment), do: %{merged | fragment: source.fragment}, else: merged
    to_string(merged)
  end

  defp auto_replace_ask(entry, new_url, question, decisions) do
    original = entry.url

    case Map.fetch(decisions, original) do
      {:ok, nil} ->
        decisions

      {:ok, ^new_url} ->
        IO.puts("\nAuto-applying remembered decision: #{original} → #{new_url}")
        auto_replace(entry.source, original, new_url)
        decisions

      _ ->
        if Util.IO.yes?("\n" <> question) do
          case auto_replace(entry.source, original, new_url) do
            :ok ->
              Map.put(decisions, original, new_url)

            {:error, reason} ->
              IO.puts("replacing failed: #{reason}")
              Util.IO.yes?("Continue?")
              decisions
          end
        else
          Map.put(decisions, original, nil)
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
