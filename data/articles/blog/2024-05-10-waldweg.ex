defmodule Data.Article.Blog.Waldweg do
  use Article.Default

  def title(), do: "Waldweg"

  def summary(),
    do:
      "Alte Planung sieht mehr Mischverkehr bei Tempo-50 und schmale Schutzstreifen vor. Es ist unwahrscheinlich, dass sie so umgesetzt wird."

  def type(), do: :planned

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :backward,
        from: "Halenreie",
        to: "Saseler Markt",
        parent_ref: __MODULE__,
        text: "Waldweg nach Sasel",
        historic: %{
          "3ab182a6c888c124bab9cf5f9d1f7f50" => ~d[2024-05]
        },
        videos: [
          {"2024-05-09-vr6/GX017478", "00:03:29.843", "00:04:54.161"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :forward,
        from: "Saseler Markt",
        to: "Halenreie",
        parent_ref: __MODULE__,
        text: "Waldweg nach Volksdorf",
        historic: %{
          "19a62e0a15b9037f787da0b44f004533" => ~d[2024-05]
        },
        videos: [
          {"2024-05-09-vr6/GX017480", :start, "00:01:19.646"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Hintergrund Aufhebung Gehwegradeln", "Januar 2024",
       "https://web.archive.org/web/20240511082742/https://sitzungsdienst-wandsbek.hamburg.de/bi/to020.asp?TOLFDNR=1058010"},
      {"1. Entwurf, Erläuterungen", "September 2018",
       "https://lsbg.hamburg.de/resource/blob/784398/a780bc938087942fa43e8887ecd1194e/waldweg-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf, Pläne", "September 2018",
       "https://lsbg.hamburg.de/resource/blob/784400/15aed617f75bfc5e1d8357e211b61348/waldweg-abstimmungsunterlage-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Es sind keine eigenen Radwege vorhanden.</p>

    <p>Es darf nur auf der asphaltierten <.ref>Fahrbahn</.ref> bei Tempo-50 im <.ref>Mischverkehr</.ref> gefahren werden.</p>

    <p>Die unterschiedlich breiten Gehwege <em>waren</em> mit <.ref>Fahrrad frei</.ref> beschildert und durften daher auch in Schrittgeschwindigkeit benutzt werden. Mit teilweise nur 1,5m Breite sind sie bereits für reinen Fußverkehr eher schmal. Sie sind teils gepflastert, teils mit feinem Schotter (Grand) befestigt.</p>

    <p>Die Freigabe für Gehwegradeln wurde 2024 nach Unfällen und Beschwerden aufgehoben.</p>

    <h4>Planung (2018)</h4>
    <p>Fahrbahn und Gehwege werden saniert. Letztere sollen teilweise breiter werden. Sie behalten ihre gemischten Beläge in Grand bzw. Pflastersteinen. Die Bushaltestellen werden barrierefrei ausgebaut.</p>

    <p>Für den Radverkehr sollen stellenweise 1,6m breite <.ref>Schutzstreifen</.ref> aufgemalt werden. Sie beginnen grob nach der <.v bounds="10.131293,53.654496,10.138052,53.657906" lon={10.135126} lat={53.65586} dir="forward" ref={@ref} highlight="Saselbekstraße">Einmündung der Saselbekstraße</.v> und enden <.v bounds="10.147972,53.651794,10.154655,53.654868" lon={10.150744} lat={53.653164} dir="forward" ref={@ref}highlight="Rögenfeld">Höhe Rögenfeld</.v>. Der Schutzstreifen in Richtung Sasel geht dabei aus den Geh- bzw. Radwegen hervor, die abgesetzt der Straße verlaufen. Der Schutzstreifen Richtung Volksdorf geht noch ein Stück weiter, etwa bis <.v bounds="10.15224,53.652547,10.159788,53.655749" lon={10.15433} lat={53.65339} dir="forward" ref={@ref} highlight="Am Reisenbrook">Höhe Am Reisenbrook</.v>.</p>

    <p>Nach der Bushaltestelle <.v bounds="10.139492,53.651332,10.146183,53.653902" lon={10.142207} lat={53.652508} dir="forward" ref={@ref}>Hültkoppel in Richtung Volksdorf</.v> wird der Schutzstreifen für rund 100m unterbrochen. Mittels Rampen wird der Radverkehr auf bzw. vom Gehweg geleitet.</p>

    <p>An Bushaltestellen wird der Schutzstreifen durch den Wartebereich der Busse geführt.</p>

    <p>An den jeweiligen Enden der Schutzstreifen sind keine Überleitungen auf den Gehweg vorgesehen, da der Radverkehr auf der Fahrbahn weiterfahren soll.</p>

    <p><.ref>Fahrrad frei</.ref> wird auch nach dem Umbau nicht mehr angeordnet. Einzige Ausnahme: die abgesetzten Geh- bzw. Wanderwege <.v bounds="10.148618,53.651374,10.162166,53.655242" lon={10.159397} lat={53.653543} dir="backward" ref={@ref}>auf der Nordseite ab Volksdorf</.v> bis <.v bounds="10.148618,53.651374,10.162166,53.655242" lon={10.151289} lat={53.653362} dir="backward" ref={@ref}>Bushalt Rögenfeld</.v>.</p>

    <h4>Meinung</h4>
    <p>Diese ältere, grauenhafte Planung zeigt wie sehr sich die Qualität für den Radverkehr in den letzten Jahren verbessert hat. 10-Jährige Kinder bei Tempo-50 in den Mischverkehr werfen würde heute niemand mehr ernsthaft bei einem Umbau vorschlagen. Das Schutzstreifen ungeeignet sind und knappes Überholen fördern hat sich dagegen noch nicht überall herumgesprochen.</p>

    <p>Wie könnte eine moderne Lösung für den Waldweg aussehen? Durch die Bäume im bzw. neben dem Straßenraum ist eine Verbreiterung kaum möglich.</p>

    <p>In den Niederlanden wurden gute Erfahrungen mit gepflasterten Mittelstreifen gemacht – das führt dort zu größeren Überholabständen. Kombiniert mit Tempo-30 könnte das auch hierzulande funktionieren.</p>

    <p>In den unbebauten Waldabschnitten könnten überbreite Gehwege mit „Fahrrad frei“ eine Option bleiben. Das ist nicht ideal, bei geringem Rad- und Fußverkehr aber verschmerzbar. Der schnelle Radverkehr würde vermutlich auf der Fahrbahn bleiben, sodass der Gehweg auch gar nicht für hohe Geschwindigkeiten hergerichtet werden sollte.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
