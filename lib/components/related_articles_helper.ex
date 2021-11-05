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
    dated = Map.get(grouped, false, [])

    render_list(static, dated)
  end

  def list_articles(assigns) do
    arts = Article.List.category('Blog')

    arts =
      if assigns[:type] do
        require IEx
        IEx.pry()
        type = String.to_existing_atom(assigns[:type])
        Stream.filter(arts, fn art -> art.type() == type end)
      else
        arts
      end

    arts =
      case assigns[:sort] do
        "start" -> Article.List.sort(arts, :asc, :start)
        "date" -> Article.List.sort(arts)
        nil -> arts
      end

    arts =
      case assigns[:range] do
        "recent" -> slice_recent(arts)
        nil -> arts
      end

    assigns = %{items: article_list(arts, years: true, time_format: :date)}

    ~H"""
      <ol class="hide-bullets">
      <%= for item <- @items do %>
        <%= item %>
      <% end %>
      <%=  %></ol>
    """
  end

  @recent_article_min 4
  @recent_article_max 20
  @recent_article_days 14
  defp slice_recent(arts) do
    min = Stream.take(arts, @recent_article_min)

    next =
      arts
      |> Stream.drop(@recent_article_max)
      |> Stream.take(@recent_article_max - @recent_article_max)
      |> Stream.take_while(fn art ->
        Article.Decorators.updated_n_days_ago(art) <= @recent_article_days
      end)

    Stream.concat(min, next)
  end

  defp render_list(static, dated)
  defp render_list([], []), do: empty()

  defp render_list(static, dated) do
    assigns = %{items: article_list(dated, years: true, time_format: :date)}

    ~H"""
    <TagHelpers.noindex>
      <h3>Verwandte Artikel</h3>
      <%= to_soft_list(static) %>
      <ol class="hide-bullets">
      <%= for item <- @items do %>
        <%= item %>
      <% end %>
      <%=  %></ol>
    </TagHelpers.noindex>
    """
  end

  defp to_soft_list([]), do: empty()

  defp to_soft_list([art]) do
    assigns = %{link: Article.Decorators.link(art)}
    ~H"<p>Übersicht: <strong><%= @link %></strong></p>"
  end

  defp to_soft_list(art_list) do
    assigns = %{links: Enum.map(art_list, &Article.Decorators.link(&1))}

    ~H"""
    <ul>
    <%= for link <- @links do %>
      <li><%= link %></li>
    <% end %>
    </ul>
    """
  end

  defp empty(assigns \\ %{}), do: ~H""

  @doc """
  List articles grouped by year in descending order.
  """
  @spec article_list(Article.Behaviour.t(),
          years: boolean(),
          time_format: :date | :range
        ) :: [Phoenix.LiveView.Rendered.t()]
  defp article_list([], years: _years, time_format: _time_format), do: []

  defp article_list(articles, years: true, time_format: time_format) do
    current_year = DateTime.utc_now().year

    articles
    |> Enum.group_by(& &1.created_at.year)
    |> Enum.sort_by(fn {year, _list} -> year end, :desc)
    |> Enum.map(fn {year, art_list} ->
      art_list = Enum.sort_by(art_list, & &1.created_at(), {:desc, Date})

      assigns = %{year: year, art_list: art_list}

      ~H"""
      <%= if @year != current_year do %>
        <li class="separator"><%= @year %></li>
      <% end %>
      <%= for art <- @art_list do %>
        <li>
          <%= to_list_time(art, time_format) %>
          <%= Article.Decorators.link(art) %>
        </li>
      <% end %>
      """
    end)
  end

  # TODO: used?
  # defp to_list_time(art, :range),
  #   do: floki_content_tag(:span, Article.range(art), class: "duration")

  def to_list_time(art, :date) do
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
