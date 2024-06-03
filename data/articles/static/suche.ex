defmodule Data.Article.Static.Suche do
  use Article.Static

  def title(), do: "Suche"

  def summary(),
    do: "Suche nach Straßen und Artikeln"

  def tags(), do: []

  def text(assigns) do
    ~H"""
    <h3><label for="query">Suche 🔎</label></h3>
    <form method="GET" action="/suche" onsubmit="return false">
      <input type="search" id="query" placeholder="z.B. Feldstraße, StadtRAD, Baustelle…" phx-keyup="search" phx-debounce="250" phx-hook="FocusSearchField" autofocus="autofocus" name="search_query" value={@search_query}/>
    </form>

    <.noindex>
      <.async_result :let={search_results} assign={@search_results}>
        <:loading><p>Lädt…</p></:loading>
        <:failed :let={error}>
          <p>Fehler in der Suchfunktion:</p>
          <tt><%= inspect(error) %></tt>
        </:failed>
        <.results results={search_results} query={@search_query}/>
      </.async_result>
    </.noindex>
    """
  end

  defp results(%{results: sr, query: sq} = assigns) when sr == [] and sq != "" do
    ~H{<p>Leider keine Ergebnisse.</p>}
  end

  defp results(%{results: sr} = assigns) when is_list(sr) do
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

  defp debug?() do
    Application.get_env(:veloroute, :env) != :prod
  end
end
