defmodule Data.Article.Static.ErweiterteFunktionen do
  use Article.Static
  import Guards

  def title(), do: "Erweiterte Funktionen"

  def summary(),
    do: "Erweiterte und experimentelle Funktionen für fortgeschrittene Nutzer"

  def tags(), do: []

  def text(assigns) do
    assigns = assign(assigns, download_assigns(assigns))

    ~H"""
    <h4>Video-Bilder</h4>
    <p><a href={@download_url} download={@download_name}>Aktuelles Video-Bild in guter Qualität herunterladen</a></p>

    <p>Lizenz ist <.a href="https://de.wikipedia.org/wiki/Gemeinfreiheit">gemeinfrei</.a>, aber über Namensnennung zu „veloroute.hamburg“ freue ich mich. Höhere Qualität <.mailto>auf Anfrage</.mailto>.</p>

    <p>Videos lassen sich mit den Tasten , und . (Komma und Punkt) um Einzelbilder vor- bzw. zurückspulen. Ggf. mehrmals drücken, die verwendete Technik dazu ist nicht ganz ausgereift. Wenn es immer noch nicht klappt, einmal von Hand das Video kurz abspielen und wieder pausieren – danach sollte es gehen.</p>

    <h4>Karten-Bilder</h4>
    <p><a onmousedown="map.redraw();this.href=map.getCanvas().toDataURL('image/webp');this.download=`veloroute.hamburg_karte_${map.getCenter()}.webp`" rel="nofollow">Aktuellen Karten-Ausschnitt herunterladen</a></p>

    <p>
      Die Lizenz vom gewählten Karten-Hintergrund ab:
      <a href="#" onclick="let hrefs=[...document.querySelectorAll('.maplibregl-ctrl-attrib-inner a')].map(l => l.href);let text=document.querySelector('.maplibregl-ctrl-attrib-inner').innerText;alert(`${text}\n${hrefs.join('\n')}`);return false" rel="nofollow">Aktuellen Lizenztext anzeigen</a>
    </p>

    <p>Die Angabe des Lizenz-Texts ist verpflichtend, für Details siehe Link(s) im Lizenz-Text. Die Routen von veloroute.hamburg selbst sind gemeinfrei und bedürfen keiner weiteren Angaben. Über Namensnennung zu „veloroute.hamburg“ freue ich mich.</p>
    """
  end

  defp download_assigns(%{video_hash: hash, video_start: timestamp}) do
    video = Video.Generator.get(hash)

    text =
      if is_module(video) do
        "#{video.name} #{recording_date(video, timestamp)}"
      else
        "unbekannt"
      end
      |> String.replace(~r/[^a-zA-ZäüößÄÜÖẞ0-9_.-]+/, "_")

    %{
      download_name: "veloroute.hamburg_foto_#{text}.webp",
      download_url: "/images/thumbnails/#{hash}/#{timestamp}"
    }
  end

  defp download_assigns(_assigns),
    do: %{
      download_name: "veloroute.hamburg_foto_unbekannt.webp",
      download_url: "/images/video_poster.svg"
    }

  defp recording_date(video, timestamp) do
    Enum.reduce(video.recording_dates(), "", fn %{text: text, timestamp: ts}, acc ->
      if ts <= timestamp, do: text, else: acc
    end)
  end
end
