defmodule Mix.Tasks.Velo.Links.Mirror do
  use Mix.Task
  use Tesla

  @path "data/auto_generated/link_mirror/"
  @requirements ["app.start"]

  @type entry :: {atom(), binary(), binary()}

  @shortdoc "Mirrors structured links for articles"
  def run(_) do
    mirrored = already_mirrored()

    Article.List.all()
    |> Stream.flat_map(fn art ->
      seen = mirrored[art.name()] || []

      Article.Decorators.apply_with_assigns(art, :links)
      |> Stream.reject(&seen?(&1, seen))
      |> Stream.flat_map(&extract/1)
      |> Stream.reject(&seen?(&1, seen))
      |> Stream.map(&absolute_path(&1, art))
      |> Stream.reject(fn {_, file, _} -> File.exists?(file) end)
      |> Stream.each(&ensure_target_folder_exists(&1))
    end)
    |> Parallel.map(2, &grab(&1))
    |> Parallel.map(4, &wayback(&1))
  end

  @spec already_mirrored() :: %{binary() => [binary()]}
  def already_mirrored() do
    Path.join(@path, "*/*/")
    |> Path.wildcard()
    |> Enum.map(&Path.relative_to(&1, @path))
    |> Enum.map(fn relpath ->
      [dir, file] = Path.split(relpath)
      # we expect the md5 hash to be in 2nd place:
      # <date> <md5> <method> <name>.<ext>
      {dir, Enum.at(String.split(file, " "), 1)}
    end)
    |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
  end

  @spec extract({binary(), binary()}) :: [entry()]
  defp extract({name, "https://lsbg.hamburg.de/contentblob" <> _rest = url}) do
    [{:download, "#{name} #{name_from_url(url)}", url}]
  end

  defp extract({name, "https://via-bus.hamburg.de/contentblob" <> _rest = url}) do
    [{:download, "#{name} #{name_from_url(url)}", url}]
  end

  defp extract({_name, "https://www.hamburg.de/" <> _rest} = entry),
    do: extract_contentblob(entry)

  defp extract({_name, "https://metropolregion.hamburg.de/" <> _rest} = entry),
    do: extract_contentblob(entry)

  defp extract({_name, "https://sitzungsdienst-altona.hamburg.de/" <> _rest} = entry),
    do: extract_sitzungsdienst(entry)

  defp extract({_name, "https://sitzungsdienst-eimsbuettel.hamburg.de/" <> _rest} = entry),
    do: extract_sitzungsdienst(entry)

  defp extract({_name, "https://sitzungsdienst-hamburg-mitte.hamburg.de/" <> _rest} = entry),
    do: extract_sitzungsdienst(entry)

  defp extract({_name, "https://sitzungsdienst-hamburg-nord.hamburg.de/" <> _rest} = entry),
    do: extract_sitzungsdienst(entry)

  defp extract({_name, "https://sitzungsdienst-wandsbek.hamburg.de/" <> _rest} = entry),
    do: extract_sitzungsdienst(entry)

  defp extract({_name, "https://sitzungsdienst-bergedorf.hamburg.de/" <> _rest} = entry),
    do: extract_sitzungsdienst(entry)

  defp extract({_name, "https://sitzungsdienst-harburg.hamburg.de/" <> _rest} = entry),
    do: extract_sitzungsdienst(entry)

  @evergabe_base "https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/"
  defp extract({name, @evergabe_base <> "eva/supplierportal/fhh/subproject/" <> rest = url}) do
    # page: https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/eva/supplierportal/fhh/subproject/e88e2ab6-cea1-4adf-898e-08f8f7e1ca86/details
    # PDFs: https://fbhh-evergabe.web.hamburg.de/evergabe.bieter/api/supplier/subproject/e88e2ab6-cea1-4adf-898e-08f8f7e1ca86/projectFilesZip
    zips =
      @evergabe_base <>
        "api/supplier/subproject/" <>
        String.replace(rest, "/details", "/projectFilesZip")

    [{:download, "evergabe #{name}.zip", zips}, {:capture, "evergabe #{name}", url}]
  end

  defp extract(%Phoenix.LiveView.Rendered{} = heex) do
    heex
    |> Util.render_heex()
    |> Util.extract_href_from_html()
    |> Enum.with_index()
    |> Enum.flat_map(fn {href, index} ->
      extract({"nested_heex_#{index}", href})
    end)
  end

  # ignores
  defp extract({_name, "https://www.komoot.de" <> _rest}), do: []
  defp extract({_name, "https://www.openstreetmap.org" <> _rest}), do: []

  defp extract(other) do
    IO.puts("don't know how to extract links for: #{inspect(other)}")
    []
  end

  @spec extract_sitzungsdienst({binary(), binary()}) :: [entry()]
  defp extract_sitzungsdienst({name, url}) do
    given = URI.parse(url)

    extra =
      url
      |> hrefs_from_url()
      |> Enum.filter(&String.match?(&1, ~r{___tmp/tmp/.*\.(pdf|zip|jpe?g)}i))
      |> Enum.map(fn href ->
        known_url_parts = URI.parse(href) |> Map.from_struct() |> Util.compact()
        uri = Map.merge(given, known_url_parts)

        uri =
          if String.starts_with?(uri.path, "/"),
            do: uri,
            else: Map.put(uri, :path, "/bi/#{uri.path}")

        url = to_string(uri)
        {:download, name_from_url(url), url}
      end)

    # add the page capture last, to ensure we re-attempt to extract attachments
    # if any of the failed
    extra ++ [{:capture, name, url}]
  end

  @spec extract_contentblob({binary(), binary()}) :: [entry()]
  defp extract_contentblob({name, url}) do
    given = URI.parse(url)

    extra =
      url
      |> hrefs_from_url()
      |> Enum.filter(&String.match?(&1, ~r{/contentblob/.*\.(pdf|zip)}))
      |> Enum.map(fn href ->
        known_url_parts = URI.parse(href) |> Map.from_struct() |> Util.compact()
        url = Map.merge(given, known_url_parts) |> to_string()
        {:download, name_from_url(url), url}
      end)

    # add the page capture last, to ensure we re-attempt to extract attachments
    # if any of the failed
    extra ++ [{:capture, name, url}]
  end

  @spec hrefs_from_url(binary() | URI.t()) :: [binary()]
  def hrefs_from_url(url) do
    {:ok, response} = get(url)

    if response.status == 200 do
      Util.extract_href_from_html(response.body)
    else
      []
    end
  end

  defp name_from_url("" <> url), do: name_from_url(URI.parse(url))

  defp name_from_url(%URI{path: path}) do
    path |> String.split("/") |> List.last()
  end

  defp seen?({_name, url}, seen) when is_list(seen) do
    Enum.member?(seen, Util.md5(url))
  end

  defp seen?({_method, name, url}, seen), do: seen?({name, url}, seen)
  defp seen?(_other, _seen), do: false

  @spec absolute_path(entry(), Article.t()) :: entry()
  defp absolute_path({method, name, url}, art) do
    filename =
      "#{Date.utc_today()} #{Util.md5(url)} #{method} #{name}"
      |> String.replace(~r/[^äöüÄÖÜßa-z0-9_\s.-]+/i, "_")

    file = Path.join([@path, art.name(), filename])
    {method, file, url}
  end

  @spec ensure_target_folder_exists(entry()) :: :ok
  defp ensure_target_folder_exists({_method, file, _url}) do
    File.mkdir_p!(Path.dirname(file))
  end

  @spec grab(entry()) :: entry()
  defp grab({:download, file, url} = entry) do
    log(file, Path.basename(file))

    {:ok, response} = get(url)

    if response.status != 200 do
      log(file, "got a #{response.status} trying to download '#{Path.basename(file)}': #{url}")
    else
      File.write!(file, response.body)
    end

    entry
  end

  defp grab({:capture, file, url} = entry) do
    log(file, "#{Path.basename(file)}.pdf")
    {out, exit_code} = System.cmd("cutycapt", ["--url=#{url}", "--out=#{file}.pdf"])

    if exit_code != 0,
      do: log(file, "page capture failed:\n#{out}\n\n\n")

    entry
  end

  @spec wayback(entry()) :: entry()
  defp wayback({_method, file, url} = entry) do
    case get("https://web.archive.org/save/#{url}") do
      {:ok, %{status: 302}} -> log(file, "wayback: ✓ #{url}")
      {:ok, resp} -> log(file, "wayback: FAILED (#{resp.status}): #{url}")
      other -> log(file, "wayback: FAILED #{url} (#{inspect(other)})")
    end

    entry
  end

  defp log(file, text) do
    name = file |> Path.dirname() |> Path.basename()
    IO.puts(:stderr, "#{name}: #{text}")
  end
end
