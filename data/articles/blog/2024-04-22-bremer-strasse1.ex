defmodule Data.Article.Blog.BremerStrasse1 do
  use Article.Default

  def title(), do: "Bremer Straße (Eissendorf/Marmstorf)"
  def updated_at(), do: ~D[2024-10-01]

  def summary(),
    do:
      "Meist 2,0m breite Radfahrstreifen mit 1,6m breiten Engstellen. Stadteinwärts teilweise 3,5m breite Fahrradstraße als Nebenfahrbahn. Problemstelle vorm Neuen Friedhof Harburg wird nicht umgebaut."

  def type(), do: :planned
  def start(), do: ~d[2025-10]
  def stop(), do: ~d[2027Q2]

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

  def map_image do
    # Schlussverschickung
    {name(),
     [
       {"Sweco GmbH", "https://www.sweco-gmbh.de/kontakt/kontakt-verkehr-und-infrastruktur/"},
       {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
     ]}
  end

  def links(_assigns) do
    [
      {"Detailänderungen des fertigen Entwurfs", ~d[2024-10],
       "https://lsbg.hamburg.de/resource/blob/972270/6f29a61b304bf6e8b8fe0bc9f7fbc62d/bremer-strasse-aenderung-zur-schlussverschickung-bericht-data.pdf"},
      {"Lagepläne mit den Detailänderungen", ~d[2024-10],
       "https://lsbg.hamburg.de/resource/blob/972286/532882e94025e592e7318c74769c2abd/bremer-strasse-aenderung-zur-schlussverschickung-plan-data.pdf"},
      {"Pressemitteilung zum Umbaustart", ~d[2024-08],
       "https://www.hamburg.de/politik-und-verwaltung/behoerden/bvm/aktuelles/pressemeldungen/2024-08-27-bvm-bremer-strasse-959526"},
      {"Infoseite Harburgs",
       "https://www.hamburg.de/politik-und-verwaltung/bezirke/harburg/themen/verkehr/grunderneuerung-bremer-strasse-943366"},
      {"Infoseite des LSBG", "https://lsbg.hamburg.de/bremer-strasse"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Oktober 2024</h4>
    <p>Der LSBG hat den fertigen Entwurf nochmal geändert. Der Artikel wurde angepasst. Die wesentlichen Änderungen für den Radverkehr sind:</p>
    <ul>
      <li>Engstellen beim <.v bounds="9.944484,53.440216,9.947501,53.441495" lon={9.945176} lat={53.440607} dir="backward" ref={@ref}>Schafshagenberg</.v>: statt Bäume zu fällen enden die <.ref>Hochbordradwege</.ref> jeweils in einem gemeinsamen Geh- und Radweg. Wer auf der <.ref>Fahrbahn</.ref> radelt ist nicht betroffen.</li>
      <li>Asphaltierung soll geprüft werden: Im besten Fall wäre ein knappes Fünftel asphaltiert, und der Rest gepflastert.</li>
    </ul>

    <h4>Alter Zustand</h4>
    <p>Der Radverkehr hat teils eigene <.ref>Hochbordradwege</.ref>, teils gemeinsame Rad- und Gehwegen und teils gar keine Wege. Letztere sind als Gehweg mit <.ref>Fahrrad frei</.ref> ausgeschildert. Die Führung legt das Gehwegradeln nahe, da Überleitungen von bzw. auf die <.ref>Fahrbahn</.ref> fehlen.</p>

    <p>Die Oberflächen und Breiten wechseln. Es gibt <.v bounds="9.967399,53.449284,9.974333,53.45404" lon={9.971418} lat={53.451649} dir="forward" ref={@ref}>2,0m breite, gepflasterte Abschnitte</.v>, aber auch <.v bounds="9.943741,53.438894,9.956166,53.445528" lon={9.946879} lat={53.441342} dir="backward" ref={@ref}>1,7m breite, asphaltierte Rad/Gehwege</.v> in der <.ref>Dooring-Zone</.ref>.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <h5>bis Neuer Friedhof Harburg</h5>
    <p>Vom <.v bounds="9.954521,53.444409,9.976924,53.454795" lon={9.971621} lat={53.451763} dir="forward" ref={@ref}>Gottschalkring</.v> bis <.v bounds="9.954521,53.444409,9.976924,53.454795" lon={9.959158} lat={53.447298} dir="forward" ref={@ref} highlight="Dahlengrund">Höhe Dahlengrund</.v> sind durchgängige, meist 2,0m breite, gepflasterte <.ref>Hochbordradwege</.ref> geplant. An Bushaltestellen verbleiben Engstellen mit rund 1,6m.</p>

    <p>In der Gegenrichtung ist das Prinzip ähnlich. Allerdings beginnt ab <.v bounds="9.958645,53.446194,9.966269,53.449968" lon={9.960051} lat={53.447418} dir="backward" ref={@ref}>Höhe Hausnummer 211</.v> eine 3,5m breite Fahrradstraße, über die auch KFZ-Parkplätze bzw. die Einfahrten zu den Häusern erreicht werden.  Seitenstraßen erhalten eigene Zufahrten von der Hauptfahrbahn. Die Fahrradstraße endet <.v bounds="9.966401,53.449398,9.970293,53.451701" lon={9.967841} lat={53.450196} dir="backward" ref={@ref}>Höhe Hausnummer 153</.v> und geht wieder in einen Hochbordradweg über. Wer weiter der Bremer Straße folgen möchte, biegt wie heute <.v bounds="9.968401,53.450016,9.970071,53.451548" lon={9.969252} lat={53.450553} dir="backward" ref={@ref}>an der Ampel</.v> links ab.</p>

    <h5>um Neuer Friedhof Harburg</h5>
    <p>Das <.v bounds="9.95055,53.442254,9.961845,53.448776" lon={9.955736} lat={53.445898} dir="forward" ref={@ref}>Teilstück</.v> wird nicht umgebaut. An den Rändern sind Auf- und Ableitungen geplant, damit man von der <.ref>Fahrbahn</.ref> auf den Radweg kommt und umgekehrt. Die Gestaltung legt die Benutzung der Fahrbahn nahe. Gehwegradeln (<.ref>Fahrrad frei</.ref>) ist weiterhin möglich und erlaubt.</p>

    <h5>ab Neuer Friedhof Harburg</h5>
    <p>Es sind mit einer Ausnahme durchgehende, gepflasterte Hochbordradwege geplant. Sie werden teils 2,0m breit, haben aber auch längere Abschnitte mit nur 1,6m. Das ist z.B. ab <.v bounds="9.937128,53.438698,9.941566,53.440117" lon={9.940432} lat={53.439541} dir="forward" ref={@ref} highlight="Langenberg">Einmündung Langenberg</.v> auf beiden Seiten so.</p>

    <h4>Meinung</h4>
    <p>Ansprechend breite und (fast) durchgängige Hochbordradwege? Super, gerade im Vergleich zum aktuellen Flickwerk. Das macht es auch verschmerzbar, dass größtenteils minderwertiges Pflaster verbaut wird, statt die Wege komfortabel zu asphaltieren. Immerhin soll jetzt überhaupt geschaut werden, wo das möglich ist.</p>

    <p>Ob das Stück Fahrradstraße eine gute Idee ist, wird sich mit der Zeit zeigen. Einen Versuch ist es aber wert.</p>

    <p>Offensichtlicher Kritikpunkt ist die fehlende Lösung um den Friedhof herum. Leider wird der bereits 2015 umgebaute Abschnitt nicht nochmal angefasst. Jeder Verkehrsart eigene Wege zu geben wird von <em>allen</em> bevorzugt – Verkehrsexperten, Vereine im Verkehrsbereich und Laien sind da einer Meinung. Mit drei statt vier Fahrspuren wäre genug Platz für Radwege.</p>

    <p>Die Begründung „Baumerhalt“ für die Radweg-Lücken am <.v bounds="9.944484,53.440216,9.947501,53.441495" lon={9.945176} lat={53.440607} dir="backward" ref={@ref}>Schafshagenberg</.v> ist fraglich. Für LKW wird auch ein ähnlicher Baum gefällt, um eine Gefahrenstelle aufzulösen. Für den Fuß- und Radverkehr wird dagegen eine Neue geschaffen. Viel eher will man die 8,5m breite Fahrbahn am Schafshagenberg behalten, damit KFZ den haltenden Bus überholen können.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
