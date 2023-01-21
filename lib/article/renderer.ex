defmodule Article.Renderer do
  use Phoenix.Component
  import Guards

  @spec render(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :video_hash, :string, required: true
  attr :video_start, :string, required: true
  attr :search_query, :string
  attr :search_bounds, :any
  attr :limit_to_map_bounds, :boolean, default: false

  def render(%{ref: art} = assigns) when is_module(art) do
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
      <div {@microdata[:wrapper] || %{}}>
        <h3 {@microdata[:title] || %{}} :if={!@has_header}><%= @ref.title() %></h3>
        <Components.TagHelpers.construction_duration_header article={@ref}/>

        <%= @body %>
        <Components.TagHelpers.article_updated_at article={@ref}/>
        <meta itemprop="image" content={"/images/thumbnails/#{@video_hash}/#{@video_start}"} :if={@microdata != %{}}/>
      </div>

      <Components.RelatedArticlesHelper.related_articles article={@ref}/>
    """
  end
end
