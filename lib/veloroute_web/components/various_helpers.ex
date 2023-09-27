defmodule VelorouteWeb.VariousHelpers do
  use VelorouteWeb, :verified_routes
  use Phoenix.HTML
  import Guards
  import Phoenix.Component

  def display_route(nil), do: nil

  def display_route(%VelorouteWeb.Live.VideoState{} = state) do
    %Video.Track{parent_ref: ref, text: text} = VelorouteWeb.Live.VideoState.current_track(state)

    if is_module(ref) do
      assigns = %{
        href: Article.Decorators.path(ref),
        title: "Du folgst: #{ref.title()} #{text}",
        icon: route_icon(ref),
        text: text
      }

      ~H"""
      <.link patch={@href} title={@title} id="videoRoute">
        <%= @icon %> <%= @text %>
      </.link>
      """
    end
  end

  def video_metadata(nil), do: nil

  def video_metadata(%VelorouteWeb.Live.VideoState{} = state) do
    track = VelorouteWeb.Live.VideoState.current_track(state)
    %Video.Track{parent_ref: ref, text: text} = track

    {title, desc} =
      if is_module(ref) && ref.route_group() != nil do
        desc = Article.Decorators.text(ref, ["table.routing", ".links"])
        desc = if String.length(desc) > 100, do: desc
        {"#{ref.title()}: #{text}", desc}
      else
        {text, ""}
      end

    rendered = Video.Generator.get(track)
    third = round(rendered.length_ms() / 3)
    date = track |> Video.Track.recording_date_max() |> Date.to_iso8601()

    meta = %{
      "@context": "https://schema.org",
      "@type": "VideoObject",
      name: title,
      description: desc,
      thumbnailUrl: [
        ~p"/images/thumbnails/#{rendered.hash()}/0",
        ~p"/images/thumbnails/#{rendered.hash()}/#{third * 1}",
        ~p"/images/thumbnails/#{rendered.hash()}/#{third * 2}"
      ],
      uploadDate: "#{date}T10:00:00+02:00",
      duration: Video.Timestamp.as_iso8601(rendered.length_ms()),
      contentUrl: "/#{Settings.video_serve_path()}/#{rendered.hash()}/stream.m3u8",
      potentialAction: %{
        "@type": "SeekToAction",
        target:
          Article.Decorators.url(ref) <>
            "/?video=#{rendered.hash()}&pos_sec={seek_to_second_number}",
        "startOffset-input": "required name=seek_to_second_number"
      }
    }

    assigns = %{json: meta |> Util.compact() |> Jason.encode!()}

    ~H"""
    <script type="application/ld+json"><%= Phoenix.HTML.raw(@json) %></script>
    """
  end

  @short_month_names [
    "Jan",
    "Feb",
    "Mär",
    "Apr",
    "Mai",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Okt",
    "Nov",
    "Dez"
  ]

  # TODO: unify with RoughDate?
  @long_month_names [
    "Januar",
    "Februrar",
    "März",
    "April",
    "Mai",
    "Juni",
    "Juli",
    "August",
    "September",
    "Oktober",
    "November",
    "Dezember"
  ]
  def short_date(%Date{day: day, month: month}) do
    "#{day}. #{Enum.at(@short_month_names, month - 1)}"
  end

  def long_date(%Date{day: day, month: month, year: year}) do
    "#{day}. #{Enum.at(@long_month_names, month - 1)} #{year}"
  end

  def route_icon(id) when is_binary(id) do
    ref =
      Article.List.find_exact(id) ||
        raise("Tried to find route icon for #{id}, but there is no such article")

    route_icon(ref)
  end

  def route_icon(nil), do: nil

  @max_route_icon_chars 5
  def route_icon(article) when is_module(article) do
    id = article.display_id()

    if id && String.length(id) <= @max_route_icon_chars do
      content_tag(:span, id,
        style: "background: #{article.color()}",
        class: "icon #{article.route_group()}"
      )
    else
      ""
    end
  end

  @doc """
  Converts the given bounds into a center-zoom variant suitable for bounds
  fitting.
  """
  def to_string_center_zoom(bounds) do
    cz = Geo.CheapRuler.bounds_to_center_zoom(bounds)
    zoom = min(Basemap.Constants.bounds_fitting_max_zoom(), round(cz.zoom))
    Enum.join([cz.lon, cz.lat, zoom], ",")
  end

  def to_string_bounds(bounds) when is_binary(bounds) and bounds != "" do
    bounds
  end

  def to_string_bounds([[minLon, minLat], [maxLon, maxLat]]),
    do: "#{r(minLon)},#{r(minLat)},#{r(maxLon)},#{r(maxLat)}"

  def to_string_bounds([minLon, minLat, maxLon, maxLat]),
    do: "#{r(minLon)},#{r(minLat)},#{r(maxLon)},#{r(maxLat)}"

  def to_string_bounds(%{
        minLat: minLat,
        minLon: minLon,
        maxLat: maxLat,
        maxLon: maxLon
      }),
      do: "#{r(minLon)},#{r(minLat)},#{r(maxLon)},#{r(maxLat)}"

  @precision 6
  defp r(float), do: Float.round(float, @precision)
end
