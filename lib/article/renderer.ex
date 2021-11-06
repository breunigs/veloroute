defmodule Article.Renderer do
  use Phoenix.LiveView

  def render(%{current_page: p} = assigns) when not is_nil(p) and is_atom(p) do
    body = assigns.current_page.text(assigns)
    has_header = body.static |> List.first() |> String.starts_with?("<h3")
    header = if !has_header, do: ~H"<h3><%= @current_page.title() %></h3>"

    assigns =
      assign(assigns, %{
        body: body,
        header: header,
        related_articles: RelatedArticlesHelper.related_articles(assigns),
        construction_time: construction_time(assigns.current_page),
        updated_at: updated_at(assigns.current_page)
      })

    ~H"""
      <%= @header %>
      <%= @construction_time %>

      <%= @body %>
      <%= @updated_at %>

      <%= @related_articles %>
    """
  end

  defp construction_time(art) do
    range = Data.RoughDate.range(art.start(), art.stop())
    assigns = %{}

    cond do
      range == "" ->
        nil

      art.type() == :finished ->
        ~H{<span class="duration">Umbau abgeschlossen (Bauzeit <%= range %>)</span>}

      true ->
        ~H{<span class="duration">vermutete Bauzeit: <%= range %></span>}
    end
  end

  defp updated_at(art) do
    d = art.updated_at()
    assigns = %{}

    if d do
      ~H"""
        <time class="updated">Letzte Änderung <%= d.day %>.<%= d.month %>.<%= d.year %></time>
      """
    end
  end
end
