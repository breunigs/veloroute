defmodule Article.Dectorators do
  use Phoenix.Component
  import Guards

  @spec html(Article.Behaviour.t(), Article.Behaviour.assigns()) :: binary()
  def html(art, assigns) do
    art.text(assigns) |> Phoenix.HTML.Safe.to_iodata() |> IO.iodata_to_binary()
  end

  @spec full_title(Article.Behaviour.t()) :: binary()
  def full_title(art) do
    tn = type_name(art)

    cond do
      String.contains?(art.title(), ":") -> art.title()
      tn != nil -> "#{tn}: #{art.title()}"
      true -> art.title()
    end
  end

  @spec gpx_links(module()) :: Phoenix.LiveView.Rendered.t()
  def gpx_links(art) when is_module(art) do
    assigns = %{name: art.name()}

    ~H"""
    Route im
    <a href={"/geo/#{@name}.gpx"} download={"#{@name}.gpx"}>GPX-Format</a>
    bzw.
    <a href={"/geo/#{@name}.kml"} download={"#{@name}.kml"}>KML-Format</a>
    """
  end

  @doc """
  Returns the canonical path for a given article
  """
  @spec path(Article.Behaviour.t()) :: binary()
  def path(art) do
    case art.created_at() do
      nil -> "/#{art.name()}"
      date -> "/article/#{date}-#{art.name()}"
    end
  end

  @doc """
  Returns the HTML link to the article, using the full title (with type prefix)
  as text if no content is given
  """
  @spec link(Article.Behaviour.t(), binary | Phoenix.LiveView.Rendered.t() | nil) ::
          Phoenix.LiveView.Rendered.t()
  def link(art, content \\ nil) do
    assigns = %{href: path(art), content: content || full_title(art)}
    ~H"<a href={@href}><%= @content %></a>"
  end

  @type_names %{
    construction: "Baustelle",
    planned: "Planung",
    changed_routing: "Routenänderung",
    ampel: "Unfaire Ampel",
    intent: "Vorhaben",
    issue: "Problemstelle",
    finished: "Abgeschlossen"
  }

  @spec type_name(Article.Behaviour.t()) :: binary() | nil
  def type_name(art), do: Map.get(@type_names, art.type(), nil)
end
