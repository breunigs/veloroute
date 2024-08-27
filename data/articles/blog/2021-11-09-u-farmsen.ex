defmodule Data.Article.Blog.UFarmsen do
  use Article.Default

  def updated_at(), do: ~D[2024-04-18]

  def title(),
    do: "Straßen um U-Bahnhof Farmsen (Radroute 6, Freizeitroute 2, Bezirksrouten W5 und W8)"

  def type(), do: :planned
  def tags(), do: ["FR2", "6", "br-wandsbek-w5", "br-wandsbek-w8"]

  def start(), do: ~d[2026]
  def stop(), do: ~d[2028]

  def links(_assigns) do
    [
      {"fertiger Entwurf, Lageplan und Erläuterungsbericht", "April 2024",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1020762"},
      {"1. Entwurf, Lageplan und Erläuterungsbericht", "Oktober 2023",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1019655"},
      {"Präsentation zum Umbau",
       "https://web.archive.org/web/20240518131205/https://via-bus.hamburg.de/contentblob/15542692/738ee06d41a71392fa2108465cedcd68/data/praesentation-online-dialogrunde-vom-11-08-2021.pdf"},
      {"Dokumentation zur Online-Dialogrunde",
       "https://web.archive.org/web/20240517235009/https://via-bus.hamburg.de/contentblob/15542682/aee1379cbb674d255d0dcc376ea1b401/data/dokumentation-online-dialogrunde-vom-11-08-2021.pdf"}
    ]
  end

  def map_image do
    Data.MapImage.new(
      __MODULE__,
      {"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"},
      {
        %{lat: 53.608514700, lon: 10.116357685},
        %{lat: 53.606766183, lon: 10.121572328},
        %{lat: 53.605360886, lon: 10.120233261},
        %{lat: 53.607109356, lon: 10.115019048}
      }
    )
  end

  def summary(),
    do:
      "Durchgängige Radwege geplant; auf der Nordseite in beide Richtungen. Fokus aufs Auto verhindert Entzerrung Fuß/Rad."

  def text(assigns) do
    assigns =
      assign(assigns,
        checkbox_attr: if(assigns.show_map_image, do: [checked: "checked"]) || []
      )

    ~H"""
    <h4>Alter Zustand</h4>
    <p>Entlang der <.a name="alltagsroute-6">Alltagsroute 6</.a> fährt man größtenteils geradlinig über die Kreuzung mit der August-Krohmann-Straße. Ausnahme ist eine <.v bounds="10.118968,53.605945,10.119893,53.606486" lon={10.119556} lat={53.606425} dir="backward" ref="6">Dreiecksinsel</.v> in Fahrtrichtung Innenstadt, wo der Radweg verschwenkt wird.</p>
    <p>Die Führung der <.a name="freizeitroute-2">Freizeitroute 2</.a> ist unklar. Eine direkte Querungsmöglichkeit gibt es nicht, es sind entweder lange Umwege erforderlich oder es muss geschoben werden.</p>
    <p>An der <.v bounds="10.115564,53.605793,10.120876,53.608256" lon={10.117747} lat={53.607121} dir="forward" ref="br-wandsbek-w5">August-Krogmann-Straße</.v> gibt es teilweise <.ref>Hochbordradwege</.ref>, die in jedem Fall aber durch die Wartebereich der Busfahrgäste führen. In Fahrtrichtung Osten gibt es <.v bounds="10.115564,53.605793,10.120876,53.608256" lon={10.117375} lat={53.607033} dir="backward" ref="br-wandsbek-w5">unter der Bahnbrücke</.v> gar keinen eigenen Radweg.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}/>
    <p><.v bounds="10.117184,53.604829,10.122262,53.608175" lon={10.119636} lat={53.605719} dir="forward" ref="6">Entlang der Alltagsroute</.v> ändert sich wenig: es bleibt möglich mit dem Rad rechts abzubiegen, ohne an der Ampel halten zu müssen. Die <.v bounds="10.118968,53.605945,10.119893,53.606486" lon={10.119556} lat={53.606425} dir="backward" ref="6">Dreiecksinsel</.v> entfällt, sodass der Radweg hier geradlinig wird. Linksabbiegen ist jeweils nur <.ref>indirekt</.ref> möglich.</p>

    <p>Auf der <.v bounds="10.115564,53.605793,10.120876,53.608256" lon={10.117747} lat={53.607121} dir="forward" ref="br-wandsbek-w5" highlight="August-Krogmann-Straße">Nordseite der August-Krogmann-Straße</.v> ist ein Zweirichtungsradweg vorgesehen. Er beginnt bzw. endet jeweils nach den Kreuzungen des <.v bounds="10.118368,53.605486,10.121078,53.607438" lon={10.120191} lat={53.606331} dir="forward" ref="br-wandsbek-w5">Rahlstedter Weg</.v> bzw. <.v bounds="10.115051,53.606518,10.117844,53.608271" lon={10.116671} lat={53.607525} dir="backward" ref="FR2">Am Luisenhof</.v>, sodass in beide Richtungen gequert werden darf. An den Bushaltestellen führt er zwischen Ein-/Ausstiegsbereich und Fußweg hindurch. Der Hintergrund ist, das es auf dieser Seite hohe Bedarfe Richtung Osten gibt, gerade durch Schulkinder.</p>

    <p>Für die <.v bounds="10.116203,53.606849,10.118599,53.607964" lon={10.116761} lat={53.607201} dir="forward" ref="FR2">Wegbeziehung der Freizeitroute</.v> kann auf der Nordseite der erwähnte Zweirichtungsradweg genutzt werden. Die <.v bounds="10.115771,53.606637,10.118392,53.608235" lon={10.116711} lat={53.607238} dir="backward" ref="FR2">Treppe auf der Südseite</.v> bleibt in dieser Maßnahme unverändert. Auch eine befahrbare Anbindung müsste in einer weiteren Planung erfolgen.</p>

    <p>Auf <.v bounds="10.115564,53.605793,10.120876,53.608256" lon={10.117375} lat={53.607033} dir="backward" ref="br-wandsbek-w5" highlight="August-Krogmann-Straße">Südseite der August-Krogmann-Straße</.v> soll der Radweg erstmals durchgängig werden und geradliniger ausfallen. Unter der Brücke verläuft der Radweg rechts an der Wand. <.v bounds="10.115752,53.605808,10.121063,53.608226" lon={10.118241} lat={53.606739} dir="backward" ref="br-wandsbek-w5">Im Anschluss</.v> führt er dann wie im Norden zwischen Bus Ein-/Ausstieg links und Fußweg rechts.</p>

    <p>Die <.v bounds="10.116068,53.606367,10.118835,53.608015" lon={10.117615} lat={53.606928} dir="backward" ref="br-wandsbek-w5">Ampel östlich des U-Bahnhofs</.v> wird um eine Radfurt ergänzt.</p>

    <h4>Meinung</h4>
    <p>Es sind gute Ansätze erkennbar: bei der Alltagsroute entfällt eine Schikane, die ein Verringern der Geschwindigkeit nötig machte. Auch die direkte Erreichbarkeit des U-Bahnhofs über den Zweirichtungsradweg ist praktisch.</p>

    <p>Allerdings wird das Auto weiterhin als das Maß der Dinge genommen, was ausreichende Gehwege verhindert und es nötig macht die Radwege irgendwie zwischen Bushalt und Fußweg hindurchzuführen. Man führt wenig überzeugend an, das ein KFZ-Rückstau auch Busse behindern würde und das es ggf. zu Ausweichverkehren in Wohngebieten kommt.</p>

    <p>Insgesamt wird die Situation für den Radverkehr besser. Der starke Fokus auf den Autoverkehr zeigt aber die Rückwärtsgewandtheit der Planung.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
