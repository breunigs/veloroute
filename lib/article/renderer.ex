defmodule Article.Renderer do
  use Phoenix.LiveView

  def render(%{current_page: p} = assigns) when not is_nil(p) and is_atom(p) do
    ~H"""
      <h3><%= @current_page.title() %></h3>
      <%= @current_page.text(assigns) %>

      <%= RelatedArticlesHelper.related_articles(assigns) %>
    """
  end
end
