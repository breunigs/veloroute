defmodule Data.Article.Static.Datenexport do
  use Article.Static
  import Guards

  def title(), do: "Datenexport"

  def summary(),
    do: "Datenexport und ähnliche Funktionen für die Weiterverarbeitung des Materials."

  def tags(), do: []

  def text(assigns) do
    assigns =
      assigns
      |> assign(download_assigns(assigns))
      |> assign(video_assigns(assigns))
      |> assign(historic_video_assigns(assigns))

    ~H"""
    <h4>Video-Bilder</h4>
    <p><a href={@image_download_path} download={@image_download_name} rel="nofollow">Aktuelles Video-Bild in guter Qualität herunterladen</a></p>

    <p>Lizenz ist <.a href="https://de.wikipedia.org/wiki/Gemeinfreiheit">gemeinfrei</.a>, aber über Namensnennung zu „veloroute.hamburg“ freue ich mich.</p>

    <p>Videos lassen sich mit den Tasten , und . (Komma und Punkt) um Einzelbilder vor- bzw. zurückspulen. Ggf. mehrmals drücken, die verwendete Technik dazu ist nicht ganz ausgereift. Wenn es immer noch nicht klappt, einmal von Hand das Video kurz abspielen und wieder pausieren – danach sollte es gehen.</p>

    <h4>Ganze Videos</h4>
    <p><a href={@video_download_path} rel="nofollow" download={@video_download_name}>Aktuelles Video in guter Qualität herunterladen</a>. Bitte nicht übertreiben und die Videos nacheinander herunterladen. Die Webseite ist nicht für den Massen-Download optimiert, weil ich den Aufwand dazu lieber in andere Sachen stecke.</p>

    <h5>Historische Videos</h5>
    <%= if @historic_videos == [] do %>
      <p>Zu dieser Route sind keine älteren Aufnahmen bekannt.</p>
    <% else %>
      <p>Zu dieser Route (Abschnitt/Richtung) sind ältere Aufnahmen verfügbar:</p>
      <ul>
        <%= for {date, url, name} <- @historic_videos do %>
          <li><a href={url} rel="nofollow" download={name}><%= date %> in guter Qualität herunterladen</a></li>
        <% end %>
      </ul>
    <% end %>

    <p>Das Video-Format ist etwas ungewöhnlich. Mit <.a href="https://www.videolan.org/vlc/">VLC</.a> funktioniert es in jedem Fall.</p>

    <p>Lizenz ist <.a href="https://de.wikipedia.org/wiki/Gemeinfreiheit">gemeinfrei</.a>, aber über Namensnennung zu „veloroute.hamburg“ freue ich mich.</p>

    <h4>Karten-Bilder</h4>
    <p><a onmousedown="map.redraw();this.href=map.getCanvas().toDataURL('image/webp');this.download=`veloroute.hamburg_karte_${map.getCenter()}.webp`" rel="nofollow">Aktuellen Karten-Ausschnitt herunterladen</a></p>

    <p>
      Die Lizenz vom gewählten Karten-Hintergrund ab:
      <a href="#" onclick="let hrefs=[...document.querySelectorAll('.maplibregl-ctrl-attrib-inner a')].map(l => l.href);let text=document.querySelector('.maplibregl-ctrl-attrib-inner').innerText;alert(`${text}\n${hrefs.join('\n')}`);return false" rel="nofollow">Aktuellen Lizenztext anzeigen</a>
    </p>

    <p>Die Angabe des Lizenz-Texts ist verpflichtend, für Details siehe Link(s) im Lizenz-Text. Die Routen von veloroute.hamburg selbst sind gemeinfrei und bedürfen keiner weiteren Angaben. Über Namensnennung zu „veloroute.hamburg“ freue ich mich.</p>

    <h4>Karte bemalen</h4>
    <p>
      Es ist möglich sehr einfache Formen auf die Karte zu malen, die dann auch beim Karten-Bild-Export erhalten bleiben.
      <%= if @enable_drawing_tools do %>
        Die Zeichentools werden oben links auf der Karte angezeigt.
      <% else %>
        <a href={Article.Decorators.path(@ref, %{enable_drawing_tools: 1})} rel="nofollow">Zeichentools zeitweise aktivieren</a> (Seite lädt neu).
      <% end %>
    </p>

    <p>Der Mülleimer löscht <em>alle</em> Zeichnungen. Einzelne können markiert werden (= sind orange) und dann mit der ENTF Taste gelöscht werden.</p>

    <h4>Höhere Qualität?</h4>
    <p>Die Videos auf der Webseite sind stark komprimiert, damit sie für jeden gut abspielbar sind. Das geht nicht ohne Qualitätsverluste. <.mailto>Auf Anfrage</.mailto> kann ich hochwertigere Versionen erstellen. <.a href="/images/quality_compare.webp" target="_blank">Vergleichsbild öffnen</.a> (links: Originalqualität, rechts: wie auf der Webseite veröffentlicht).</p>
    """
  end

  defp video_assigns(assigns, fallback_title \\ "unbekannt")

  defp video_assigns(%{video_hash: hash}, fallback_title) when valid_hash(hash) do
    path = Video.RenderedTools.highest_quality_video_file(hash)
    path = Path.join(Settings.video_serve_path(), path)

    video = Video.Generator.find_by_hash(hash)

    title =
      if video do
        date = Video.RenderedTools.most_recent_recording_month(video)
        "#{video.name()} bis #{date}"
      else
        fallback_title
      end
      |> clean()

    %{
      video_download_path: path,
      video_download_name: "veloroute.hamburg_video_#{title}.m4s"
    }
  end

  defp video_assigns(_assigns, fallback_title),
    do: %{
      video_download_path: "",
      video_download_name: "veloroute.hamburg_video_#{fallback_title}.m4s"
    }

  defp download_assigns(%{video_hash: hash, video_start: timestamp}) do
    video = Video.Generator.get(hash)

    text =
      if is_module(video) do
        "#{video.name} #{recording_date(video, timestamp)} #{position(video, timestamp)}"
      else
        "unbekannt"
      end
      |> clean()

    %{
      image_download_name: "veloroute.hamburg_foto_#{text}.webp",
      image_download_path: "/images/thumbnails/#{hash}/#{timestamp}"
    }
  end

  defp download_assigns(_assigns),
    do: %{
      image_download_name: "veloroute.hamburg_foto_unbekannt.webp",
      image_download_path: "/images/video_poster.svg"
    }

  defp historic_video_assigns(%{video_hash: current_hash}) do
    hist =
      Article.List.all()
      |> Enum.flat_map(& &1.tracks())
      |> Enum.flat_map(fn track ->
        track
        |> Video.Track.historic_for(current_hash)
        |> Enum.map(fn {hash, date} -> {hash, date, track.text} end)
      end)
      |> Enum.uniq()
      |> Enum.map(fn {historic_hash, date, text} ->
        named = video_assigns(%{video_hash: historic_hash}, "#{date}-#{text}")
        {date, named.video_download_path, named.video_download_name}
      end)
      |> Enum.sort()

    %{historic_videos: hist}
  end

  defp historic_video_assigns(_assigns), do: %{historic_videos: %{}}

  defp recording_date(video, timestamp) do
    Enum.reduce(video.recording_dates(), "", fn %{text: text, timestamp: ts}, acc ->
      if ts <= timestamp, do: text, else: acc
    end)
  end

  defp position(video, timestamp) do
    Enum.find_value(video.coords(), fn %{lon: lon, lat: lat, time_offset_ms: ts} ->
      if ts >= timestamp, do: "lat#{lat} lon#{lon}"
    end)
  end

  defp clean(str), do: String.replace(str, ~r/[^a-zA-ZäüößÄÜÖẞ0-9_.-]+/u, "_")
end
