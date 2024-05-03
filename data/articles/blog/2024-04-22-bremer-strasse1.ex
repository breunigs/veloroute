defmodule Data.Article.Blog.BremerStrasse1 do
  use Article.Default

  def title(), do: "Bremer Straße (Eissendorf/Marmstorf)"

  def summary(),
    do:
      "Meist 2,0m breite Radfahrsteifen mit 1,6m breiten Engstellen. Stadteinwärts teilweise 3,5m breite Fahrradstraße als Nebenfahrbahn. Problemstelle vorm Neuen Friedhof Harburg wird nicht umgebaut."

  def type(), do: :planned
  def start(), do: ~d[2025-10]
  # def stop(), do: ~d[]

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :forward,
        from: "Krummholzberg",
        to: "Tötensen",
        parent_ref: __MODULE__,
        text: "Bremer Straße stadtauswärts",
        historic: %{
          "c0291d7b8e9f470e8b1db15e00285d36" => ~d[2024-04]
        },
        end_action: :reverse,
        videos: [
          {"2024-04-21-vr2-rand/GX017193", "00:00:08.876", :end},
          {"2024-04-21-vr2-rand/GX017194", :start, "00:02:03.432"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :backward,
        from: "Tötensen",
        to: "Krummholzberg",
        parent_ref: __MODULE__,
        text: "Bremer Straße stadteinwärts",
        end_action: :reverse,
        historic: %{
          "8b7daed6d89a59641a61e66ef895ef5e" => ~d[2024-04]
        },
        videos: [
          {"2024-04-21-vr2-rand/GX017194", "00:02:03.432", :end},
          {"2024-04-21-vr2-rand/GX017195", :start, "00:00:01.835"},
          {"2024-04-21-vr2-rand/GX017198", "00:00:02.035", :end},
          {"2024-04-21-vr2-rand/GX017199", :start, :end},
          {"2024-04-21-vr2-rand/GX017200", :start, :end},
          {"2024-04-21-vr2-rand/GX017201", :start, :end},
          {"2024-04-21-vr2-rand/GX017202", :start, "00:00:33.100"}
        ]
      }
    ]

  @attrib {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, 0, {
        %{lat: 53.439149306, lon: 9.937228884},
        %{lat: 53.443013454, lon: 9.948000977},
        %{lat: 53.441807974, lon: 9.949219075},
        %{lat: 53.437944450, lon: 9.938446852}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "1a", {
        %{lat: 53.443454625, lon: 9.947558149},
        %{lat: 53.446279696, lon: 9.955436978},
        %{lat: 53.444973079, lon: 9.956758804},
        %{lat: 53.442146336, lon: 9.948880655}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "1b", {
        %{lat: 53.446279696, lon: 9.955436978},
        %{lat: 53.448988819, lon: 9.963020395},
        %{lat: 53.447679948, lon: 9.964339629},
        %{lat: 53.444973079, lon: 9.956758804}
      }),
      Data.MapImage.new(__MODULE__, @attrib, 2, {
        %{lat: 53.448910706, lon: 9.963101003},
        %{lat: 53.452066884, lon: 9.971946596},
        %{lat: 53.451539537, lon: 9.972475263},
        %{lat: 53.448382503, lon: 9.963632605}
      })
    ]
  end

  def links(_assigns) do
    [{"Infoseite der Stadt", "https://lsbg.hamburg.de/bremer-strasse"}]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Radverkehr hat teils eigene <.ref>Hochbordradwegen</.ref>, teils gemeinsame Rad- und Gehwegen und teils gar keine Wege. Letztere sind als Gehweg mit <.ref>Fahrrad frei</.ref> ausgeschildert. Die Führung legt das Gehwegradeln nahe, da Überleitungen von bzw. auf die <.ref>Fahrbahn</.ref> fehlen.</p>

    <p>Die Oberflächen und Breiten wechseln. Es gibt <.v bounds="9.967399,53.449284,9.974333,53.45404" lon={9.971418} lat={53.451649} dir="forward" ref={@ref}>2,0m breite, gepflasterte Abschnitte</.v>, aber auch <.v bounds="9.943741,53.438894,9.956166,53.445528" lon={9.946879} lat={53.441342} dir="backward" ref={@ref}>1,7m breite, asphaltierte Rad/Gehwege</.v> in der <.ref>Dooring-Zone</.ref>.</p>

    <div class="headlineForm">
      <h4>Planung</h4>
      <.map_image_toggle checked={@show_map_image}/>
    </div>
    <h5>bis Neuer Friedhof Harburg</h5>
    <p>Vom <.v bounds="9.954521,53.444409,9.976924,53.454795" lon={9.971621} lat={53.451763} dir="forward" ref={@ref}>Gottschalkring</.v> bis <.v bounds="9.954521,53.444409,9.976924,53.454795" lon={9.959158} lat={53.447298} dir="forward" ref={@ref} highlight="Dahlengrund">Höhe Dahlengrund</.v> sind durchgängige, meist 2,0m breite, gepflasterte <.ref>Hochbordradwege</.ref> geplant. An Bushaltestellen verbleiben Engstellen mit rund 1,6m.</p>

    <p>In der Gegenrichtung ist das Prinzip ähnlich. Allerdings beginnt ab <.v bounds="9.958645,53.446194,9.966269,53.449968" lon={9.960051} lat={53.447418} dir="backward" ref={@ref}>Höhe Hausnummer 211</.v> eine 3,5m breite Fahrradstraße, über die auch KFZ-Parkplätze bzw. die Einfahrten zu den Häusern erreicht werden.  Seitenstraßen erhalten eigene Zufahrten von der Hauptfahrbahn. Die Fahrradstraße endet <.v bounds="9.966401,53.449398,9.970293,53.451701" lon={9.967841} lat={53.450196} dir="backward" ref={@ref}>Höhe Hausnummer 153</.v> und geht wieder in einen Hochbordradweg über. Wer weiter der Bremer Straße folgen möchte, biegt wie heute <.v bounds="9.968401,53.450016,9.970071,53.451548" lon={9.969252} lat={53.450553} dir="backward" ref={@ref}>an der Ampel</.v> links ab.</p>

    <h5>um Neuer Friedhof Harburg</h5>
    <p>Das <.v bounds="9.95055,53.442254,9.961845,53.448776" lon={9.955736} lat={53.445898} dir="forward" ref={@ref}>Teilstück</.v> wird nicht umgebaut. An den Rändern sind Auf- und Ableitungen geplant, damit man von der <.ref>Fahrbahn</.ref> auf den Radweg kommt und umgekehrt. Die Gestaltung legt die Benutzung der Fahrbahn nahe. Gehwegradeln (<.ref>Fahrrad frei</.ref>) ist weiterhin möglich und erlaubt.</p>

    <h5>ab Neuer Friedhof Harburg</h5>
    <p>Es sind durchgehende, gepflasterte Hochbordradwege geplant. Sie werden teils 2,0m breit, haben aber auch längere Abschnitte mit nur 1,6m. Das ist z.B. ab <.v bounds="9.937128,53.438698,9.941566,53.440117" lon={9.940432} lat={53.439541} dir="forward" ref={@ref} highlight="Langenberg">Einmündung Langenberg</.v> auf beiden Seiten so.</p>

    <h4>Meinung</h4>
    <p>Ansprechend breite, durchgängige Hochbordradwege? Super, gerade im Vergleich zum aktuellen Flickwerk. Das macht es auch verschmerzbar, dass wieder minderwertiges Pflaster verbaut wird, statt die Wege komfortabel zu asphaltieren.</p>

    <p>Ob das Stück Fahrradstraße eine gute Idee ist, wird sich mit der Zeit zeigen. Einen Versuch ist es aber wert.</p>

    <p>Offensichtlicher Kritikpunkt ist die fehlende Lösung um den Friedhof herum. Leider wird der bereits 2015 umgebaute Abschnitt nicht nochmal angefasst. Jeder Verkehrsart eigene Wege zu geben wird von <em>allen</em> bevorzugt – Verkehrsexperten, Vereine im Verkehrsbereich und Laien sind da einer Meinung. Mit drei statt vier Fahrspuren wäre genug Platz für Radwege.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
