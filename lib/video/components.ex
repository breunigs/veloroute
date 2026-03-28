defmodule Video.Components do
  require Logger
  use Phoenix.Component
  import Guards

  attr :lang, :string, required: true
  attr :video_reversible, :boolean, required: true
  @spec reverse_button(map()) :: Phoenix.LiveView.Rendered.t()
  def reverse_button(assigns) do
    is_en = assigns.lang == "en"
    rev = assigns.video_reversible

    {text, class, title} =
      cond do
        rev && is_en ->
          {"Reverse", "", "Reverse cycling direction"}

        rev && !is_en ->
          {"Umdrehen", "", "Fahrtrichtung umdrehen"}

        !rev && is_en ->
          {"", "disabled", "Video in the opposite direction not available"}

        !rev && !is_en ->
          {"", "disabled", "Video in die andere Fahrtrichtung leider nicht verfügbar"}
      end

    assigns = assign(assigns, %{title: title, text: text, class: class})

    ~H"""
    <button id="reverse" type="button" title={@title} class={@class}><%= @text %></button>
    """
  end

  attr :hash, :string, required: true
  attr :start, :integer, required: true

  def alternatives(%{hash: hash, start: start} = assigns)
      when valid_hash(hash) and is_integer(start) do
    variants = variants_timeout(hash)
    url = "#{Settings.r(:video_serve_host)}/#{Settings.r(:video_serve_path)}"

    assigns =
      assign(assigns, %{
        prefix: "#{url}/#{hash}/",
        variants: variants,
        first_stream: if(variants != [], do: variants |> List.first() |> elem(0)),
        start: to_string(start / 1000.0)
      })

    ~H"""
    <link rel="preload" as="fetch" crossorigin="anonymous" fetchpriority="low" href={"#{@prefix}#{@first_stream}"} :if={@first_stream}>
    <link rel="preload" as="fetch" crossorigin="anonymous" fetchpriority="low" href={"#{@prefix}stream.m3u8"} id="hlsJsUrl">
    <source src={"#{@prefix}stream.m3u8#t=#{@start}"} type="application/x-mpegURL">
    <%= for {path, codec} <- @variants do %>
      <source src={"#{@prefix}#{path}#t=#{@start}"} type={"video/mp4; codecs=#{codec}"}>
    <% end %>
    <p>Abspielen im Browser klappt wohl nicht. Du kannst das <a href={"#{@prefix}#{@first_stream}"} target="_blank">Video herunterladen</a> und anderweitig anschauen.</p>
    """
  end

  def alternatives(assigns) do
    Logger.error("#{__MODULE__}.alternatives: got invalid assigns: #{inspect(assigns)}")
    ~H{}
  end

  @variant_timeout_ms 10
  @spec variants_timeout(Video.Track.hash()) :: list()

  if Application.compile_env(:veloroute, :env) == :test do
    def variants_timeout(_hash), do: []
  else
    def variants_timeout(hash), do: variants_timeout_real(hash)
  end

  def variants_timeout_real(hash) do
    Task.async(fn -> variants(hash) end)
    |> Task.yield(@variant_timeout_ms)
    |> case do
      {:ok, variants} ->
        variants

      {:exit, reason} ->
        Logger.warning("loading variants for #{hash} failed with #{inspect(reason)}")
        []

      nil ->
        Logger.warning("loading variants #{hash} took longer than #{@variant_timeout_ms}ms")
        []
    end
  end

  use Memoize

  defmemo variants(hash) do
    with path = Path.join([Settings.r(:video_target_dir_abs), hash, "stream.m3u8"]),
         {:ok, tokens} <- M3U8.Tokenizer.read_file(path),
         variants when is_list(variants) <- M3U8.Utils.variants(tokens) do
      Enum.map(variants, fn var -> {var.url, var.codec} end)
    else
      _ -> []
    end
  end
end
