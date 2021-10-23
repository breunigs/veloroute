defmodule TagHelpers do
  use Phoenix.Component

  def mailto(assigns) do
    ~H"""
    <a href={Settings.email()}><%= render_block(@inner_block) %></a>
    """
  end

  def ref(assigns) do
    body = ~H" <%= render_block(@inner_block) %>"

    # todo find by tags through
    # Article.Dectorators.html(body)

    ~H"""
    <a href="/FIXME"><%= body %></a>
    """
  end

  #   def ref(attrs, children) do
  #   attrs_as_hash(attrs)[:name]
  #   |> Kernel.||(Floki.text(children))
  #   |> Cache.Articles.find()
  #   |> case do
  #     art when is_map(art) ->
  #       url = VariousHelpers.article_path(art)

  #       {"a",
  #        [
  #          {"data-phx-link-state", "push"},
  #          {"data-phx-link", "patch"},
  #          {"class", "ref"},
  #          {"href", url}
  #        ], children}

  #     _ ->
  #       raise("Cannot find reference for #{inspect(children)}")
  #   end
  # end
end
