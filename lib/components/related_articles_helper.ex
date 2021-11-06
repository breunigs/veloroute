defmodule RelatedArticlesHelper do
  use Phoenix.Component

  @spec related_articles(map()) :: Phoenix.LiveView.Rendered.t()
  def related_articles(assigns) do
    art = assigns.current_page

    grouped =
      art
      |> Article.List.related()
      |> Enum.group_by(fn rel -> rel.created_at() == nil end)

    assigns =
      assign(assigns, %{
        related_static: Map.get(grouped, true, []),
        related_dated:
          Map.get(grouped, false, [])
          |> Article.List.sort(:desc, :updated_at)
      })

    related_list(assigns)
  end

  defp related_list(%{related_static: [], related_dated: []} = assigns), do: empty(assigns)

  defp related_list(assigns) do
    ~H"""
    <TagHelpers.noindex>
      <h3>Verwandte Artikel</h3>
      <%= to_soft_list(@related_static) %>
      <ol class="hide-bullets">
        <TagHelpers.list_articles let={art} articles={@related_dated}>
          <TagHelpers.updated_at_time article={art} />
          <TagHelpers.article_link article={art}/>
        </TagHelpers.list_articles>
      </ol>
    </TagHelpers.noindex>
    """
  end

  defp to_soft_list([]), do: ""

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

  defp empty(assigns), do: ~H""

  # @doc """
  # List articles grouped by year in descending order.
  # """
  # @spec article_list([Article.Behaviour.t()],
  #         years: boolean(),
  #         full_title: boolean(),
  #         time_format: :date | :range
  #       ) :: [Phoenix.LiveView.Rendered.t()]
  # defp article_list([], sort_by: _, full_title: _, time_format: _), do: []

  # defp article_list(articles,
  #        sort_by: sort_by,
  #        full_title: full_title,
  #        time_format: time_format
  #      ) do
  #   current_year = DateTime.utc_now().year

  #   articles
  #   |> Enum.group_by(fn art ->
  #     date = apply(art, sort_by)
  #     if date, do: date.year, else: nil
  #   end)
  #   |> Enum.sort_by(fn {year, _list} -> year end, :desc)
  #   |> Enum.map(fn {year, art_list} ->
  #     art_list = Enum.sort_by(art_list, &apply(&1, sort_by), {:desc, Date})

  #     assigns = %{year: year, art_list: art_list, full_title: full_title}

  #     ~H"""
  #     <%= if @year != current_year do %>
  #       <li class="separator"><%= @year %></li>
  #     <% end %>
  #     <%= for art <- @art_list do %>
  #       <li>
  #         <%= to_list_time(art, time_format) %>
  #         <%= if @full_title,
  #           do: Article.Decorators.link(art),
  #         else: Article.Decorators.link(art, art.title())
  #         %>
  #       </li>
  #     <% end %>
  #     """
  #   end)
  # end

  # defp to_list_time(art, :range) do
  #   assigns = %{
  #     range: Data.RoughDate.range(art.start(), art.stop())
  #   }

  #   ~H"""
  #   <span class="duration"><%= @range %></span>
  #   """
  # end

  # defp to_list_time(art, :date) do
  #   if art.created_at() == nil do
  #     empty()
  #   else
  #     assigns = %{
  #       long: VelorouteWeb.VariousHelpers.long_date(art.created_at()),
  #       short: VelorouteWeb.VariousHelpers.short_date(art.created_at()),
  #       machine: Date.to_string(art.created_at())
  #     }

  #     ~H"""
  #     <time title={@long} datetime={@machine}><%= @short %></time>
  #     """
  #   end
  # end

  # defp list_time(assigns) do
  #   assigns =
  #     assign(assigns, %{
  #       long: VelorouteWeb.VariousHelpers.long_date(art.created_at()),
  #       short: VelorouteWeb.VariousHelpers.short_date(art.created_at()),
  #       machine: Date.to_string(art.created_at())
  #     })

  #   ~H"""
  #   <time title={@long} datetime={@machine}><%= @short %></time>
  #   """
  # end
end
