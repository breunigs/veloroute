defmodule Mix.Tasks.Velo.Links.Mirror do
  use Mix.Task
  use Tesla
  require Logger

  @path "link_mirror/"
  @requirements ["app.start"]

  @wayback_timeout 160_000
  @download_timeout 60_000

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
    |> Tqdm.tqdm(description: "mirroring", total: 0)
    |> Enum.map(&grab_and_archive(&1))
  end

  @spec already_mirrored() :: %{binary() => [binary()]}
  def already_mirrored() do
    Path.join(@path, "*/**/")
    |> Path.wildcard()
    |> Enum.map(&Path.relative_to(&1, @path))
    |> Enum.map(fn relpath ->
      dir = Path.dirname(relpath)
      file = Path.basename(relpath)
      # we expect the md5 hash to be in 2nd place:
      # <date> <md5> <method> <name>.<ext>
      {dir, Enum.at(String.split(file, " "), 1)}
    end)
    |> Enum.group_by(&elem(&1, 0), &elem(&1, 1))
  end

  @spec extract({binary(), binary(), binary()}) :: [entry()]
  defp extract({name, _extra, url}), do: extract({name, url})

  defp extract({_name}), do: []

  @spec extract({binary(), binary()}) :: [entry()]
  defp extract({name, "https://via-bus.hamburg.de/contentblob" <> _rest = url}) do
    [{:download, "#{name} #{name_from_url(url)}", url}]
  end

  defp extract({_name, "https://suche.transparenz.hamburg.de/dataset/" <> _rest} = entry),
    do: extract_transparenzportal(entry)

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

  defp extract({_name, "https://www.skyfish.com/p/fhh/" <> rest = url}) do
    ids = Regex.scan(~r/\d+/, rest) |> List.flatten() |> Enum.join("_")

    if String.contains?(rest, "/download/") do
      [{:download, "#{ids}.unknown", url}]
    else
      [{:capture, ids, url}]
    end
  end

  defp extract({_name, "https://fragdenstaat.de/anfrage/" <> _rest = url}) do
    attachments =
      url
      |> hrefs_from_url()
      |> Enum.filter(&String.contains?(&1, "/anhang/"))
      |> Enum.map(&("https://fragdenstaat.de" <> &1))
      |> Enum.flat_map(&hrefs_from_url/1)
      |> Enum.filter(&String.ends_with?(&1, "?download"))
      |> Enum.map(&{:download, Regex.split(~r{[/?]}, &1) |> Enum.at(-2), &1})

    name = url |> String.split("/") |> Enum.at(-2)
    [{:capture, name, url} | attachments]
  end

  defp extract({_name, "https://adfc-pinneberg.de/" <> _rest = url}) do
    last = url |> String.split("/") |> List.last()
    [{:capture, last, url}]
  end

  defp extract({name, "https://lsbg.hamburg.de/contentblob" <> _rest = url}) do
    [{:download, "#{name} #{name_from_url(url)}", url}]
  end

  defp extract({name, "https://lsbg.hamburg.de/resource/blob/" <> _rest = url}) do
    [{:download, "#{name} #{name_from_url(url)}", url}]
  end

  defp extract({_name, "https://lsbg.hamburg.de/" <> _rest = url}) do
    attachments =
      url
      |> hrefs_from_url()
      |> Enum.filter(&String.contains?(&1, "/resource/blob/"))
      |> Enum.map(fn
        "http://" <> _rest = all -> all
        "https://" <> _rest = all -> all
        "mailto:" <> _rest -> nil
        all -> "https://lsbg.hamburg.de/" <> all
      end)
      |> Util.compact()
      |> Enum.map(&{:download, name_from_url(&1), &1})

    [{:capture, name_from_url(url), url} | attachments]
  end

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
    |> Util.extract_links_from_heex()
    |> Enum.with_index()
    |> Enum.map(fn {href, index} -> {"nested_heex_#{index}", href} end)
    |> Enum.flat_map(&extract/1)
  end

  # ignores
  defp extract({_name, "https://www.komoot.de" <> _rest}), do: []
  defp extract({_name, "https://www.openstreetmap.org" <> _rest}), do: []
  defp extract({_name, "https://web.archive.org" <> _rest}), do: []
  # defp extract({_name, "https://twitter.com" <> _rest}), do: []

  defp extract({name, url}) do
    path = URI.new!(url).path || "/"

    if String.ends_with?(path, ".pdf") do
      [{:download, "#{name} #{name_from_url(url)}", url}]
    else
      # likely a normal website, just capture it
      [{:capture, "default #{name}", url}]
    end
  end

  @spec extract_transparenzportal({binary(), binary()}) :: [entry()]
  defp extract_transparenzportal({name, url}) do
    hrefs = hrefs_from_url(url)

    pdfs =
      hrefs
      |> Enum.filter(&String.ends_with?(&1, ".pdf"))
      |> Enum.map(&{:download, "#{name} #{name_from_url(&1)}", &1})

    [{:capture, name, url}] ++ pdfs
  end

  @spec extract_sitzungsdienst({binary(), binary()}) :: [entry()]
  defp extract_sitzungsdienst({name, url}) do
    given = URI.new!(url)

    pages = [{:capture, name, url}]
    bvhh = Allris.convert_url_to_bvhh(url)
    pages = if bvhh, do: [{:capture, name <> " BVHH", bvhh} | pages], else: pages

    extra =
      url
      |> hrefs_from_url()
      |> Enum.filter(&String.match?(&1, ~r{___tmp/tmp/.*\.(pdf|zip|jpe?g)}i))
      |> Enum.map(fn href ->
        known_url_parts = URI.new!(href) |> Map.from_struct() |> Util.compact()
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
    extra ++ pages
  end

  @spec extract_contentblob({binary(), binary()}) :: [entry()]
  defp extract_contentblob({name, url}) do
    given = URI.new!(url)

    extra =
      url
      |> hrefs_from_url()
      |> Enum.filter(&String.match?(&1, ~r{/contentblob/.*\.(pdf|zip)}))
      |> Enum.map(fn href ->
        known_url_parts = URI.new!(href) |> Map.from_struct() |> Util.compact()
        url = Map.merge(given, known_url_parts) |> to_string()
        {:download, name_from_url(url), url}
      end)

    # add the page capture last, to ensure we re-attempt to extract attachments
    # if any of the failed
    extra ++ [{:capture, name, url}]
  end

  @spec hrefs_from_url(binary() | URI.t()) :: [binary()]
  def hrefs_from_url(url) do
    with {:ok, %{status: 200} = response} <- get(url) do
      Util.extract_href_from_html(response.body)
    else
      resp ->
        IO.puts(:stderr, "failed to extract links from #{url} – #{inspect(resp)}")
        []
    end
  end

  defp name_from_url("" <> url), do: name_from_url(URI.new!(url))

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
      |> String.replace(~r/[^äöüÄÖÜßa-z0-9_\s.-]+/iu, "_")

    file = Path.join([@path, art.name(), filename])
    {method, file, url}
  end

  @spec ensure_target_folder_exists(entry()) :: :ok
  defp ensure_target_folder_exists({_method, file, _url}) do
    File.mkdir_p!(Path.dirname(file))
  end

  @spec grab(entry(), integer()) :: entry()
  defp grab(entry, retries \\ 3)

  defp grab({_type, file, _url} = entry, retries) when retries < 0 do
    log(file, "failed all retries, giving up")
    entry
  end

  defp grab({:download, file, url} = entry, retries) do
    base = Path.basename(file)
    log(file, base)

    case get(url, opts: [adapter: [recv_timeout: @download_timeout]]) do
      {:ok, %{status: 200} = response} ->
        File.write!(file, response.body)
        entry

      {:ok, %{status: 302} = response} ->
        location =
          response.headers
          |> Enum.find_value(fn {k, v} -> if String.downcase(k) == "location", do: v end)

        if location do
          grab({:download, file, location}, retries - 1)
        else
          log(file, "got a 302 without location while downloading '#{base}': #{url}")
        end

        entry

      {:ok, %{status: status}} ->
        log(file, "got a #{status} trying to download '#{base}': #{url}")
        entry

      {:error, reason} ->
        log(file, "failed to download '#{base}' because '#{inspect(reason)}': #{url}")
        entry
    end
  end

  defp grab({:capture, file, "https://twitter.com" <> _ = url} = entry, _retries) do
    log(file, "#{Path.basename(file)}.pdf")

    {out, exit_code} =
      System.cmd(
        "chromium",
        [
          "--temp-profile",
          "--headless",
          "--disable-gpu",
          "--run-all-compositor-stages-before-draw",
          "--print-to-pdf-no-header",
          "--virtual-time-budget=15000",
          "--print-to-pdf=#{file}.pdf",
          url
        ]
      )

    if exit_code != 0,
      do: log(file, "page capture failed:\n#{out}\n\n\n")

    entry
  end

  defp grab({:capture, file, url} = entry, _retries) do
    log(file, "#{Path.basename(file)}.pdf")

    {out, exit_code} =
      System.cmd("cutycapt", [
        "--url=#{url}",
        "--out=#{file}.pdf",
        "--delay=1000",
        "--print-backgrounds=on"
      ])

    if exit_code != 0,
      do: log(file, "page capture failed:\n#{out}\n\n\n")

    entry
  end

  @spec wayback(entry()) :: entry()
  defp wayback({_method, file, url} = entry, retry \\ 0) do
    Process.sleep(retry * 60_000)

    # skip sitzungsdienst tmp URLs since they expire very quickly, so we never
    # manage to archive them anyway :(
    if !String.match?(url, ~r{sitzungsdienst.*/bi/___tmp/tmp/}) do
      case get("https://web.archive.org/save/#{url}",
             opts: [adapter: [recv_timeout: @wayback_timeout]]
           ) do
        {:ok, %{status: 302}} -> log(file, "wayback: ✓ #{url}")
        {:ok, %{status: 429}} -> wayback(entry, retry + 1)
        {:ok, resp} -> log(file, "wayback: FAILED (#{resp.status}): #{url}")
        other -> log(file, "wayback: FAILED #{url} (#{inspect(other)})")
      end

      Process.sleep(10_000)
    end

    entry
  end

  @spec grab_and_archive(entry()) :: entry()
  defp grab_and_archive(entry) do
    entry |> grab() |> wayback()
  end

  defp log(file, text) do
    name = file |> Path.dirname() |> Path.basename()
    Logger.info("\n#{name}: #{text}")
  end
end