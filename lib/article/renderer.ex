defmodule Article.Renderer do
  use Phoenix.Component
  import Guards
  require Logger

  @spec render(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :video_hash, :string, required: true
  attr :video_start, :string, required: true
  attr :map_bounds, :any
  attr :search_query, :string
  attr :search_bounds, :any
  attr :enable_drawing_tools, :boolean, default: false
  attr :limit_to_map_bounds, :boolean, default: false
  attr :show_map_image, :boolean, default: false

  def render(%{ref: art} = assigns) when is_module(art) do
    try_render(assigns, fn ->
      body = art.text(assigns)
      has_header = body.static |> List.first() |> String.starts_with?("<h3")

      microdata =
        if art.updated_at(),
          do: %{
            wrapper: [itemscope: "", itemtype: "https://schema.org/NewsArticle"],
            title: [itemprop: "headline"]
          }

      assigns = assign(assigns, %{body: body, has_header: has_header, microdata: microdata})

      ~H"""
        <article {@microdata[:wrapper] || %{}}>
          <h3 {@microdata[:title] || %{}} :if={!@has_header}><%= @ref.title() %></h3>
          <Components.TagHelpers.construction_duration_header ref={@ref}/>

          <%= @body %>
          <Components.TagHelpers.construction_duration_paragraph ref={@ref}/>
          <Components.TagHelpers.article_updated_at ref={@ref}/>
          <meta itemprop="image" content={"/images/thumbnails/#{@video_hash}/#{@video_start}"} :if={@microdata != %{}}/>
        </article>

        <Components.RelatedArticlesHelper.related_articles ref={@ref}/>
      """
    end)
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
