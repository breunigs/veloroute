defmodule Data.Article.Static.Suche do
  use Article.Static

  def title(), do: "Suche"

  def summary(),
    do: "Suche nach Straßen und Artikeln"

  def tags(), do: []

  def text(assigns) do
    assigns = assign(assigns, :search_results, combined_search(assigns))

    ~H"""
    <h3><label for="query">Suche 🔎</label></h3>
    <form method="GET" action="/suche" onsubmit="return false">
      <input type="search" id="query" placeholder="z.B. Feldstraße, StadtRAD, Baustelle…" phx-keyup="search" phx-debounce="500" phx-hook="FocusSearchField" autofocus="autofocus" name="search_query" value={@search_query}/>
    </form>

    <.noindex>
      <%= if @search_results == [] && @search_query != "" do %>
        <p>Leider keine Ergebnisse.</p>
      <% else %>
      <ul>
        <%= for result <- @search_results do %>
          <li>
            <div>
              <!-- relevance: <%= result.relevance %> type: <%= result.type %> -->
              <%= SearchResult.to_html(result) %>
              <%= if result.subtext do %>
                <div class="aside"><%= result.subtext %></div>
              <% end %>
            </div>
          </li>
        <% end %>
      </ul>
      <% end %>
    </.noindex>
    """
  end

  defp combined_search(%{search_query: query, search_bounds: bounds}) do
    [
      fn ->
        Esri.Search.search(query, bounds)
        |> Enum.reject(fn %{type: type} -> type == "StreetName" end)
      end,
      fn -> Maptiler.search(query, bounds) end,
      fn -> Article.Search.search(Article.List.all(), query) end
    ]
    |> Task.async_stream(& &1.(), ordered: true, timeout: 5_000)
    |> Stream.flat_map(fn {:ok, list} -> list end)
    |> Stream.reject(&is_nil/1)
    |> SearchResult.sort()
    |> Enum.take(15)
  end
end
