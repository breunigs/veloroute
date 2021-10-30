defmodule RelatedArticlesHelper do
  use Phoenix.Component

  @spec related_articles(map()) :: Phoenix.LiveView.Rendered.t()
  def related_articles(assigns) do
    art = assigns.current_page

    grouped =
      art
      |> Article.List.related()
      |> Enum.group_by(fn rel -> rel.created_at() == nil end)

    static = Map.get(grouped, true, [])
    dated = Map.get(grouped, false, []) |> Enum.sort_by(& &1.created_at(), :desc)

    render_list(static, dated)
  end

  defp render_list(static, dated)
  defp render_list([], []), do: empty()

  defp render_list(static, dated) do
    assigns = %{}

    ~H"""
    <TagHelpers.noindex>
      <h3>Verwandte Artikel</h3>
      <%= to_soft_list(static) %>
      <ol class="hide-bullets">
      <%= for item <- article_list(dated, years: true, time_format: :date) do %>
        <%= item %>
      <% end %>
      <%=  %></ol>
    </TagHelpers.noindex>
    """
  end

  defp to_soft_list([]), do: empty()

  defp to_soft_list([art]) do
    assigns = %{link: Article.Dectorators.link(art)}
    ~H"<p>Übersicht: <strong><%= @link %></strong></p>"
  end

  defp to_soft_list(art_list) do
    assigns = %{links: Enum.map(art_list, &Article.Dectorators.link(&1))}

    ~H"""
    <ul>
    <%= for link <- @links do %>
      <li><%= link %></li>
    <% end %>
    </ul>
    """
  end

  defp empty(assigns \\ %{}), do: ~H""

  @spec article_list(Article.Behaviour.t(),
          years: boolean(),
          time_format: :date | :range
        ) :: [Phoenix.LiveView.Rendered.t()]
  defp article_list([], years: _years, time_format: _time_format), do: []

  defp article_list(articles, years: true, time_format: time_format) do
    articles
    |> Enum.map(fn art -> {art.created_at.year, to_list_item(art, time_format)} end)
    |> Enum.group_by(&elem(&1, 0))
    |> Enum.flat_map(fn {year, art_links} ->
      assigns = %{year: year}
      [~H{<li class="separator"><%= @year %></li>} | art_links]
    end)
  end

  @spec to_list_item(Article.Behaviour.t(), atom()) :: Phoenix.LiveView.Rendered.t()
  defp to_list_item(art, time_format) do
    assigns = %{}

    ~H"""
    <li>
      <%= to_list_time(art, time_format) %>
      <%= Article.Dectorators.link(art) %>
    </li>
    """
  end

  # TODO: used?
  # defp to_list_time(art, :range),
  #   do: floki_content_tag(:span, Article.range(art), class: "duration")

  defp to_list_time(art, :date) do
    if art.created_at() == nil do
      empty()
    else
      assigns = %{
        long: VelorouteWeb.VariousHelpers.long_date(art.created_at()),
        short: VelorouteWeb.VariousHelpers.short_date(art.created_at()),
        machine: Date.to_string(art.created_at())
      }

      ~H"""
      <time title={@long} datetime={@machine}><%= @short %></time>
      """
    end
  end
end
