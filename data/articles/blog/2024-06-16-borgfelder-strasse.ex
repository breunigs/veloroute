defmodule Data.Article.Blog.BorgfelderStrasse do
  use Article.Default

  def title(), do: "Borgfelder Straße"

  def summary(),
    do:
      "Beidseitig asphaltierte Radwege mit meist 2,0m, ein Stück mit 1,60m. Straße behält ihren heutigen Charakter als Durchgangstrasse."

  def type(), do: :planned
  def start(), do: ~d[2025Q3]

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :forward,
        from: "Berlinertordammbrücke",
        to: "Burgstraße",
        parent_ref: __MODULE__,
        text: "Borgfelder Straße stadtauswärts",
        historic: %{
          "61516ed210f2dca0e5fadc96e7082f1e" => ~d[2024-06]
        },
        videos: [
          {"2024-06-16-13im-14gg/GX017703", "00:00:45.045", :end},
          {"2024-06-16-13im-14gg/GX017704", :start, :end},
          {"2024-06-16-13im-14gg/GX017705", :start, :end},
          {"2024-06-16-13im-14gg/GX017706", :start, "00:00:18.085"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "x",
        direction: :backward,
        from: "Burgstraße",
        to: "Berlinertordammbrücke",
        parent_ref: __MODULE__,
        text: "Borgfelder Straße stadteinwärts",
        historic: %{
          "eb5838d068d5a6ecdd8c9891d2c66f4f" => ~d[2024-06]
        },
        videos: [
          {"2024-06-16-13im-14gg/GX017703", :start, "00:00:37.604"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Änderungen am fertigen Entwurf – Erläuterungen", ~d[2024-12],
       "https://lsbg.hamburg.de/resource/blob/998900/0a714e029c71ebcdcd72becab92d1290/borgfelder-strasse-abgestimmte-planung-bericht-anpassung--data.pdf"},
      {"Änderungen am fertigen Entwurf – Karte", ~d[2024-12],
       "https://lsbg.hamburg.de/resource/blob/998902/6ed15872840d47caa8b0c7577e74cb31/borgfelder-strasse-abgestimmte-planung-plan-anpassung--data.pdf"},
      {"fertiger Entwurf – Erläuterungen", "Mai 2024",
       "https://lsbg.hamburg.de/resource/blob/903400/ce4fd5c347d38c644abe9bd506f1da66/borgfelder-strasse-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf – Karte", "Mai 2024",
       "https://lsbg.hamburg.de/resource/blob/903404/f2afdee1c610aece9d487e4e620d78cf/borgfelder-strasse-abgestimmte-planung-plan-data.pdf"},
      {"1. Entwurf (Karten und Erläuterung)", "August 2023",
       "https://fragdenstaat.de/anfrage/borgfelder-strasse/#nachricht-906941"},
      {"Schiene Plus – Präsentation", "April 2024",
       "https://schiene-plus.hamburg/onewebmedia/Schiene_Plus.pdf"},
      {"Schiene Plus – Zeitungsartikel", "April 2024",
       "https://www.abendblatt.de/hamburg/politik/article242114306/Ueberraschende-Idee-Hamburg-soll-neuen-Hauptbahnhof-bauen.html"}
    ]
  end

  @attrib {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}
  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, "1_v2", {
        %{lat: 53.554491595, lon: 10.027009572},
        %{lat: 53.554939950, lon: 10.032493115},
        %{lat: 53.554036991, lon: 10.032704084},
        %{lat: 53.553588636, lon: 10.027220541}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "2_v2", {
        %{lat: 53.554944313, lon: 10.032408556},
        %{lat: 53.555159984, lon: 10.035144007},
        %{lat: 53.553393071, lon: 10.035538982},
        %{lat: 53.553177400, lon: 10.032803531}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "3_v2", {
        %{lat: 53.555273336, lon: 10.034836419},
        %{lat: 53.555699270, lon: 10.040239274},
        %{lat: 53.554795901, lon: 10.040443742},
        %{lat: 53.554369967, lon: 10.035040887}
      })
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Dezember 2024</h4>
    <p>Der LSBG hat kleine Änderungen am fertigen Entwurf gemacht. Die <.v bounds="10.032231,53.553198,10.038117,53.55626" lon={10.034298} lat={53.554676} dir="forward" ref={@ref}>Bushaltestelle Richtung Hamm</.v> verschiebt sich etwas nach Osten. In der Gegenrichtung ist der Radweg an der <.v bounds="10.032481,53.554253,10.034364,53.555209" lon={10.033491} lat={53.554722} dir="backward" ref={@ref}>Treppe zum Park</.v>  nicht mehr unterbrochen. Der Artikel wurde entsprechend angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>In der <.v bounds="10.027296,53.553345,10.041322,53.556451" lon={10.027684} lat={53.553833} dir="forward" ref={@ref}>Borgfelder Straße</.v> gibt es beidseitig schmale <.ref>Hochbordradwege</.ref> mit vielen Unebenheiten.</p>

    <p>Stadtauswärts wird der Radverkehr ab <.v bounds="10.029329,53.553425,10.035212,53.555305" lon={10.031095} lat={53.554367} dir="forward" ref={@ref}>Hausnummer 26</.v> stattdessen über einen KFZ-Parkplatz aus Kopfsteinpflaster geführt. <.v bounds="10.025193,53.552685,10.041028,53.556389" lon={10.039108} lat={53.555437} dir="backward" ref={@ref}>Auf der Parkseite</.v> gibt keinen Gehweg.</p>

    <p>Die <.m bounds="10.030929,53.553185,10.036076,53.555407">Anckelmannstraße</.m> und der <.m bounds="10.030929,53.553185,10.036076,53.555407">Ausschläger Weg</.m> haben keine Radwege. Die im Kreuzungsbereich vorhandenen Wege beginnen bzw. enden im Nichts.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p>Stadtauswärts ist ein 2,0m breiter <.ref>Hochbordradweg</.ref> aus Asphalt geplant. Er befindet sich stets rechts der KFZ-Parkplätze und wird an kleinen Nebenstraßen durchgängig. Im <.v bounds="10.030929,53.553185,10.036076,53.555407" lon={10.033339} lat={53.554509} dir="forward" ref={@ref} highlight="Ausschläger Weg">Kreuzungsbereich am Ausschläger Weg</.v> erhält der Radverkehr ein kurzes Stück <.ref>Protected-Bike-Lane</.ref>, wird im Anschluss aber direkt auf einem ungeschützten <.ref>Radfahrstreifen</.ref> durch die <.v bounds="10.031865,53.553661,10.036258,53.555605" lon={10.034315} lat={53.554638} dir="forward" ref={@ref}>Bushaltestelle</.v> geleitet. Wer nicht hinter dem Bus warten möchte, muss sich unter die KFZ Mischen.</p>

    <p>In <.v bounds="10.025193,53.552685,10.041028,53.556389" lon={10.039108} lat={53.555437} dir="backward" ref={@ref}>Richtung Innenstadt</.v> ist zunächst ebenfalls ein 2,0m breiter, asphaltierter Hochbordradweg vorgesehen. Dessen Breite verringert sich ab <.v bounds="10.026229,53.552893,10.034302,53.555383" lon={10.031295} lat={53.554563} dir="backward" ref={@ref}>ca. Hausnummer 26</.v> auf 1,62m. Im Kreuzungsbereich des Ausschläger Weg führt der Radweg direkt an der <.v bounds="10.032481,53.554253,10.034364,53.555209" lon={10.033491} lat={53.554722} dir="backward" ref={@ref}>Treppe zum Park</.v> vorbei. Ein Gehweg wird auch bei der Neuplanung nicht angelegt.</p>

    <p><.m bounds="10.030911,53.553857,10.035072,53.555592">Im Kreuzungsbereich</.m> sind für die Aufstellflächen jeweils Protected-Bike-Lanes vorgesehen. Es bleibt möglich aus jeder Straße in jede Andere abzubiegen. Teilweise werden die Wege dazu direkter. Im <.m bounds="10.030929,53.553185,10.036076,53.555407">Ausschläger Weg</.m> und <.m bounds="10.030929,53.553185,10.036076,53.555407">Anckelmannstraße</.m> werden die Radwege in den <.ref>Mischverkehr</.ref> übergeleitet.</p>

    <h4>Meinung</h4>
    <p>Mit der Planung werden erstmals wieder brauchbare Radwege hergestellt. Dazu passt, dass sie in den <.m bounds="10.030929,53.553185,10.036076,53.555407" highlight="Ausschläger Weg,Anckelmannstraße">abgehenden Straßen</.m> nicht einfach im Nichts enden. Mit gut geschalteten Ampeln könnte sich der schnelle Radverkehr aus dem <.v bounds="10.024759,53.552686,10.041598,53.556463" lon={10.028616} lat={53.554214} dir="forward" ref="8">überlasteten Park (Radroute 8)</.v> hier her verlagern – daran muss sich die Planung messen.</p>

    <p>Leider hat man für die <.v bounds="10.032481,53.554253,10.034364,53.555209" lon={10.033491} lat={53.554722} dir="backward" ref={@ref}>Treppe zum Park</.v> keine Lösung gefunden. Weder der ursprüngliche Vorschlag (Radweg unterbrechen und als Gehweg ausschildern) noch die aktuelle Idee (Radweg durchgängig, Treppe endet direkt im Radweg) erlauben die notwendigen Sichtbeziehungen.</p>

    <p>Auch städtebaulich bleibt die Trasse unattraktiv und ohne Aufenthaltscharakter. Angesichts des <.v bounds="10.022456,53.55179,10.029609,53.555869" lon={10.024973} lat={53.553725} dir="backward" ref={@ref}>Berliner Tors</.v> als wichtigen Bahnknoten eine vertane Chance. Zumal dieser das Potential hätte, den überlasteten Hauptbahnhof zu ersetzen und Skandinavien besser erreichbar zu machen (Vorschlag „<.a href="https://schiene-plus.hamburg/onewebmedia/Schiene_Plus.pdf">Schiene Plus</.a>“ des <.a href="https://www.vcd.org/">VCD</.a>).</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
