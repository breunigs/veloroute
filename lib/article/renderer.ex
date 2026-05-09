defmodule Article.Renderer do
  use Phoenix.Component
  import Guards

  @spec render(map()) :: Phoenix.LiveView.Rendered.t()
  attr :ref, :atom, required: true
  attr :lang, :string, required: true
  attr :search_query, :string
  attr :video_hash, :string
  attr :video_start, :integer
  attr :search_results, :any
  attr :appointments, :any
  attr :enable_drawing_tools, :boolean, default: false
  attr :limit_to_map_bounds, :boolean, default: false
  attr :show_map_image, :boolean, default: false
  attr :device_os, :string, default: ""

  def render(%{ref: art} = assigns) when is_module(art) do
    body = art.text(assigns)
    has_title = assigns.ref.title() != ""
    has_header = art.detected_header() == "h3"

    assigns =
      assign(assigns, %{
        body: body,
        insert_h3: !has_header && has_title,
        image_url: if(art.microdata?(), do: Article.Decorators.start_image_path(art)),
        microdata_wrapper: art.microdata(:wrapper),
        microdata_title: art.microdata(:title),
        title: art.title()
      })

    ~H"""
      <article {@microdata_wrapper}>
        <h3 {@microdata_title} :if={@insert_h3}><%= @title %></h3>
        <Components.TagHelpers.construction_duration_header ref={@ref}/>

        <%= @body %>
        <Components.TagHelpers.construction_duration_paragraph ref={@ref} lang={@lang}/>
        <Components.TagHelpers.article_updated_at ref={@ref} lang={@lang}/>
        <meta itemprop="image" content={@image_url} :if={@image_url}/>
      </article>

      <Components.RelatedArticlesHelper.related_articles ref={@ref} lang={@lang}/>
    """
  end
end
