defmodule Article.Renderer do
  use Phoenix.Component
  import Guards
  require Logger

  @spec render(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :video_hash, :string, required: true
  attr :video_start, :string, required: true
  attr :map_bounds, :any
  attr :lang, :string, required: true
  attr :search_query, :string
  attr :search_results, :any
  attr :appointments, :any
  attr :enable_drawing_tools, :boolean, default: false
  attr :limit_to_map_bounds, :boolean, default: false
  attr :show_map_image, :boolean, default: false
  attr :device_os, :string, default: ""

  def render(%{ref: art} = assigns) when is_module(art) do
    try_render(assigns, fn ->
      body = art.text(assigns)
      has_title = assigns.ref.title() != ""
      assigns = assign(assigns, %{body: body, insert_h3: !has_header?(body) && has_title})

      ~H"""
        <article {@ref.microdata(:wrapper)}>
          <h3 {@ref.microdata(:title)} :if={@insert_h3}><%= @ref.title() %></h3>
          <Components.TagHelpers.construction_duration_header ref={@ref}/>

          <%= @body %>
          <Components.TagHelpers.construction_duration_paragraph ref={@ref} lang={@lang}/>
          <Components.TagHelpers.article_updated_at ref={@ref} lang={@lang}/>
          <meta itemprop="image" content={"/images/thumbnails/#{@video_hash}/#{@video_start}"} :if={@ref.microdata?()}/>
        </article>

        <Components.RelatedArticlesHelper.related_articles ref={@ref} lang={@lang}/>
      """
    end)
  end

  defp has_header?(body) do
    start = List.first(body.static)

    String.starts_with?(start, "<h3") ||
      (String.starts_with?(start, "<!--") && String.contains?(start, "<h3"))
  end

  # only ignore the errors in development to avoid reloading the page. Always
  # rendering in other environments should yield errors during (integration)
  # testing.
  defp try_render(assigns, callback, env \\ Application.get_env(:veloroute, :env))

  defp try_render(%{ref: art} = assigns, callback, :dev) do
    try do
      _ = Article.Decorators.html(art, assigns)
      callback.()
    rescue
      e ->
        pretty = Exception.format(:error, e, __STACKTRACE__)
        Logger.error(pretty)

        assigns = assign(assigns, pretty: pretty)

        ~H"""
        <h4>failed to render article</h4>
        <tt><%= @ref %></tt>
        <br><br>
        <pre><%= @pretty %></pre>
        """
    end
  end

  defp try_render(_assigns, callback, _env), do: callback.()
end
