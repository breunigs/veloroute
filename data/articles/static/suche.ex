defmodule Data.Article.Static.Suche do
  use Article.Static

  def title(), do: "Suche"

  def summary(),
    do: "Suche nach Straßen und Artikeln"

  def tags(), do: []

  def text(assigns) do
    ~H"""
    <h3><label for="query">Suche 🔎</label></h3>
    <search>
      <form method="GET" action="/suche" onsubmit="return false">
        <input type="search" id="query" placeholder="z.B. Feldstraße, StadtRAD, Baustelle…" phx-keyup="search" phx-debounce="250" phx-hook="FocusSearchField" autofocus="autofocus" name="search_query" value={@search_query}/>
      </form>

      <.noindex>
        <.async_result :let={results} assign={@search_results}>
          <:loading><.render query={@search_query} loading={true}/></:loading>
          <:failed :let={error}>
            <p>Fehler in der Suchfunktion:</p>
            <tt><%= inspect(error) %></tt>
          </:failed>
          <.render results={results} query={@search_query} loading={!!@search_results.loading}/>
        </.async_result>
      </.noindex>
    </search>
    """
  end

  defp render(%{results: sr} = assigns) when is_list(sr) and sr != [] do
    ~H"""
    <ul class="spaced" role="list" aria-label="Suchergebnisse">
      <%= for result <- @results do %>
        <li>
          <!-- <%= if debug?(), do: {:safe, (result.source)} %> -->
          <%= Search.Result.to_html(result) %>
        </li>
      <% end %>
    </ul>
    """
  end

  defp render(%{query: ""} = assigns) do
    ~H{}
  end

  defp render(%{loading: true} = assigns) do
    ~H{<p>Lädt…</p>}
  end

  defp render(assigns) do
    ~H{<p>Leider keine Ergebnisse.</p>}
  end

  defp debug?() do
    Application.get_env(:veloroute, :env) != :prod
  end
end
