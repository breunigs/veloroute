defmodule Components.RelatedArticlesHelper do
  use Phoenix.Component
  alias Components.TagHelpers

  @spec related_articles(map()) :: Phoenix.LiveView.Rendered.t()
  def related_articles(%{article: art} = assigns) do
    grouped =
      art
      |> Article.List.related()
      |> Enum.group_by(fn rel -> rel.created_at() == nil end)

    assigns =
      assign(assigns, %{
        related_static:
          Map.get(grouped, true, [])
          |> Article.List.sort(:asc, :title),
        related_dated:
          Map.get(grouped, false, [])
          |> Article.List.sort(:desc, :updated_at)
      })

    related_list(assigns)
  end

  defp related_list(%{related_static: [], related_dated: []} = assigns), do: ~H""

  defp related_list(assigns) do
    ~H"""
    <TagHelpers.noindex>
      <h3>Verwandte Artikel</h3>
      <.soft_list articles={@related_static}/>
      <ol class="hide-bullets">
        <TagHelpers.list_articles let={art} articles={@related_dated}>
          <TagHelpers.updated_at_time article={art} />
          <TagHelpers.article_link article={art}/>
        </TagHelpers.list_articles>
      </ol>
    </TagHelpers.noindex>
    """
  end

  defp soft_list(%{articles: []} = assigns), do: ~H""

  defp soft_list(%{articles: [_art]} = assigns) do
    ~H"<p>Übersicht: <strong><TagHelpers.article_link article={hd(@articles)}/></strong></p>"
  end

  defp soft_list(assigns) do
    ~H"""
    <ul>
    <%= for art <- @articles do %>
      <li><TagHelpers.article_link article={art}/></li>
    <% end %>
    </ul>
    """
  end
end
