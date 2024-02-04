defmodule Data.Article.Static.Suche do
  use Article.Static

  def title(), do: "Suche"

  def summary(),
    do: "Suche nach Straßen und Artikeln"

  def tags(), do: []

  def text(assigns) do
    assigns = assign(assigns, :search_results, search(assigns))

    ~H"""
    <h3><label for="query">Suche 🔎</label></h3>
    <form method="GET" action="/suche" onsubmit="return false">
      <input type="search" id="query" placeholder="z.B. Feldstraße, StadtRAD, Baustelle…" phx-keyup="search" phx-debounce="250" phx-hook="FocusSearchField" autofocus="autofocus" name="search_query" value={@search_query}/>
    </form>

    <.noindex>
      <%= if @search_results == [] && @search_query != "" do %>
        <p>Leider keine Ergebnisse.</p>
      <% else %>
      <ul class="spaced">
        <%= for result <- @search_results do %>
          <li>
            <!-- <%= if debug?(), do: {:safe, (result.source)} %> -->
            <%= Search.Result.to_html(result) %>
          </li>
        <% end %>
      </ul>
      <% end %>
    </.noindex>
    """
  end

  defp search(%{search_query: query, search_bounds: bbox}) do
    bbox = Geo.BoundingBox.parse(bbox) || Settings.initial()

    Search.Meilisearch.Runner.query(query, bbox)
    |> Enum.reject(&is_nil/1)
    |> Search.Result.merge_same()
    |> Search.Result.sort()
    |> Enum.take(15)
  end

  defp debug?() do
    Application.get_env(:veloroute, :env) != :prod
  end
end
