defmodule Video.Components do
  import Phoenix.Component
  import Guards

  @spec alternatives(Video.Track.hash(), non_neg_integer()) :: Phoenix.LiveView.Rendered.t()
  def alternatives(hash, start_in_ms) when valid_hash(hash) and is_integer(start_in_ms) do
    variants = variants(hash)

    assigns = %{
      variants: variants,
      main_url: "/#{Settings.video_serve_path()}/#{hash}/stream.m3u8",
      first_url: if(length(variants) > 0, do: variants |> List.first() |> elem(0)),
      start: start_in_ms / 1000.0
    }

    ~H"""
    <link rel="preload" as="fetch" crossorigin="anonymous" fetchpriority="low" href={@first_url} :if={@first_url}>
    <link rel="preload" as="fetch" crossorigin="anonymous" fetchpriority="low" href={@main_url} id="hlsJsUrl">
    <source src={"#{@main_url}#t=#{@start}"} type="application/x-mpegURL">
    <%= for {url, codec} <- @variants do %>
      <source src={"#{String.replace_suffix(url, ".m3u8", ".m4s")}#t=#{@start}"} type={"video/mp4; codecs=#{codec}"}>
    <% end %>
    <p>Abspielen im Browser klappt wohl nicht. Du kannst das <a href={@first_url} target="_blank">Video herunterladen</a> und anderweitig anschauen.</p>
    """
  end

  use Memoize

  defmemop variants(hash) do
    prefix = "/#{Settings.video_serve_path()}/#{hash}/"

    with path = Path.join([Settings.video_target_dir_abs(), hash, "stream.m3u8"]),
         {:ok, tokens} <- M3U8.Tokenizer.read_file(path),
         variants when is_list(variants) <- M3U8.Utils.variants(tokens) do
      Enum.map(variants, fn var -> {prefix <> var.url, var.codec} end)
    else
      _ -> []
    end
  end
end
