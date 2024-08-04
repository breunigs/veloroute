defmodule Mix.Tasks.Velo.Links.Check do
  use Mix.Task
  use Tesla
  use Memoize
  import Guards

  @requirements ["app.start"]

  @shortdoc "Check structured links for 404s"
  def run(_) do
    Article.List.all()
    |> Stream.flat_map(fn art ->
      art
      |> Article.Decorators.apply_with_assigns(:links)
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
        result = head_or_get(new_path)

        if !match?(@success, result) do
          Map.merge(entry, %{
            archive: Util.ArchiveOrg.mirror(url),
            reason: "broken redirect chain (→ #{abs_location_header(resp, url)})"
          })
        end

      {:ok, %{status: 301} = resp} ->
        Map.merge(entry, %{
          new_url: abs_location_header(resp, url),
          reason: "perma redirect"
        })

      {:ok, %{status: status}} ->
        Map.merge(entry, %{
          archive: Util.ArchiveOrg.mirror(url),
          reason: "unexpected status: #{status}"
        })

      {:error, reason} ->
        Map.merge(entry, %{
          archive: Util.ArchiveOrg.mirror(url),
          reason: "unexpected error: #{reason}"
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
    path = path(module)
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
    entry = Map.put(entry, :path, path(entry.source))
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

  defp path(module) when is_module(module) do
    module.__info__(:compile) |> Keyword.get(:source) |> to_string
  end
end
