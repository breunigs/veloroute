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

  @attrib [
    {"Sweco GmbH", "https://www.sweco-gmbh.de/kontakt/kontakt-verkehr-und-infrastruktur/"},
    {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
  ]
  def map_image do
    [
      # Schlussverschickung
      # Data.MapImage.new(__MODULE__, @attrib, 0, {
      #   %{lat: 53.439149306, lon: 9.937228884},
      #   %{lat: 53.443013454, lon: 9.948000977},
      #   %{lat: 53.441807974, lon: 9.949219075},
      #   %{lat: 53.437944450, lon: 9.938446852}
      # }),
      # Data.MapImage.new(__MODULE__, @attrib, "1a", {
      #   %{lat: 53.443454625, lon: 9.947558149},
      #   %{lat: 53.446279696, lon: 9.955436978},
      #   %{lat: 53.444973079, lon: 9.956758804},
      #   %{lat: 53.442146336, lon: 9.948880655}
      # }),
      # Data.MapImage.new(__MODULE__, @attrib, "1b", {
      #   %{lat: 53.446279696, lon: 9.955436978},
      #   %{lat: 53.448988819, lon: 9.963020395},
      #   %{lat: 53.447679948, lon: 9.964339629},
      #   %{lat: 53.444973079, lon: 9.956758804}
      # }),
      # Data.MapImage.new(__MODULE__, @attrib, 2, {
      #   %{lat: 53.448910706, lon: 9.963101003},
      #   %{lat: 53.452066884, lon: 9.971946596},
      #   %{lat: 53.451539537, lon: 9.972475263},
      #   %{lat: 53.448382503, lon: 9.963632605}
      # })

      # Schlussverschickung – Änderungen
      Data.MapImage.new(__MODULE__, @attrib, "v2_1", {
        %{lat: 53.439148284, lon: 9.937209861},
        %{lat: 53.441322592, lon: 9.943391202},
        %{lat: 53.440211287, lon: 9.944492916},
        %{lat: 53.438036979, lon: 9.938311575}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "v2_2", {
        %{lat: 53.440547973, lon: 9.943566177},
        %{lat: 53.442392210, lon: 9.948654191},
        %{lat: 53.441903067, lon: 9.949154270},
        %{lat: 53.440058831, lon: 9.944066257}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "v2_3", {
        %{lat: 53.442921246, lon: 9.948115732},
        %{lat: 53.445208320, lon: 9.954475937},
        %{lat: 53.444467696, lon: 9.955226788},
        %{lat: 53.442180622, lon: 9.948866584}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "v2_4", {
        %{lat: 53.445432662, lon: 9.953795810},
        %{lat: 53.447099303, lon: 9.958469111},
        %{lat: 53.446475529, lon: 9.959096725},
        %{lat: 53.444808887, lon: 9.954423424}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "v2_5", {
        %{lat: 53.446911047, lon: 9.957668971},
        %{lat: 53.448874082, lon: 9.963146782},
        %{lat: 53.448529989, lon: 9.963495017},
        %{lat: 53.446566955, lon: 9.958017206}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "v2_6", {
        %{lat: 53.448839919, lon: 9.963182248},
        %{lat: 53.450404901, lon: 9.967558662},
        %{lat: 53.450074092, lon: 9.967892628},
        %{lat: 53.448509110, lon: 9.963516214}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "v2_7", {
        %{lat: 53.450335783, lon: 9.967366206},
        %{lat: 53.452004297, lon: 9.972031503},
        %{lat: 53.451506253, lon: 9.972534257},
        %{lat: 53.449837738, lon: 9.967868960}
      })
    ]
  end

  def links(_assigns) do
    [
      {"Detailänderungen des fertigen Entwurfs", ~d[2024-10],
       "https://lsbg.hamburg.de/resource/blob/972270/6f29a61b304bf6e8b8fe0bc9f7fbc62d/bremer-strasse-aenderung-zur-schlussverschickung-bericht-data.pdf"},
      {"Lagepläne mit den Detailänderungen", ~d[2024-10],
       "https://lsbg.hamburg.de/resource/blob/972286/532882e94025e592e7318c74769c2abd/bremer-strasse-aenderung-zur-schlussverschickung-plan-data.pdf"},
      {"Pressemitteilung zum Umbaustart", ~d[2024-08],
       "https://www.hamburg.de/politik-und-verwaltung/behoerden/bvm/aktuelles/pressemeldungen/2024-08-27-bvm-bremer-strasse-959526"},
      {"Infoseite der Stadt", "https://lsbg.hamburg.de/bremer-strasse"}
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
