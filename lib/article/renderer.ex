defmodule Article.Renderer do
  use Phoenix.LiveView
  import Guards

  def render(%{current_page: art} = assigns) when is_module(art) do
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
        <h3 {@microdata[:title] || %{}} :if={!@has_header}><%= @current_page.title() %></h3>
        <Components.TagHelpers.construction_duration_header article={@current_page}/>

        <%= @body %>
        <Components.TagHelpers.article_updated_at article={@current_page}/>
        <meta itemprop="image" content={"/images/thumbnails/#{@video_hash}/#{@video_start}"} :if={@microdata != %{}}/>
      </div>

      <Components.RelatedArticlesHelper.related_articles article={@current_page}/>
    """
  end
end
