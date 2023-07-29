defmodule Data.Article.Blog.Krausestrasse do
  use Article.Default

  def created_at(), do: ~D[2021-10-08]
  def updated_at(), do: ~D[2023-07-28]

  def title(), do: "Krausestraße (Veloroute 6, Bezirksroute W1, Freizeitroute 2)"

  def summary(),
    do:
      "Umbau Krausestraße verschiebt sich. Stattdessen 2023 vielleicht Versuchsradweg (Pop-Up Bikelane)"

  def type(), do: :planned
  def start(), do: ~d[2026]

  def tags(), do: ["FR2", "6", "br-wandsbek-w1"]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Krausestraße",
        direction: :backward,
        from: "Hammer Straße",
        to: "Fuhlsbütteler Straße",
        parent_ref: __MODULE__,
        text: "Krausestraße (Hammer Straße → Fuhlsbütteler Straße)",
        videos: [
          {"2023-07-28-krause/GX016272", :start, :end},
          {"2023-07-28-krause/GX016273", :start, :end},
          {"2023-07-28-krause/GX016274", :start, :end},
          {"2023-07-28-krause/GX016275", :start, :end},
          {"2023-07-28-krause/GX016276", :start, :end},
          {"2023-07-28-krause/GX016277", :start, "00:00:10.143"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Krausestraße",
        direction: :forward,
        from: "Fuhlsbütteler Straße",
        to: "Hammer Straße",
        parent_ref: __MODULE__,
        text: "Krausestraße (Fuhlsbütteler Straße → Hammer Straße)",
        videos: [
          {"2023-07-28-krause/GX016279", :start, :end},
          {"2023-07-28-krause/GX016280", :start, :end},
          {"2023-07-28-krause/GX016281", :start, :end},
          {"2023-07-28-krause/GX016282", "00:00:02.936", :end},
          {"2023-07-28-krause/GX016283", :start, :end},
          {"2023-07-28-krause/GX016284", :start, :end},
          {"2023-07-28-krause/GX016285", :start, "00:00:14.281"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Projektseite des LSBG", "https://lsbg.hamburg.de/krausestrasse-bis-hammer-strasse"},
      {"Zwischenlösung – Erläuterung", "Juli 2023",
       "https://lsbg.hamburg.de/resource/blob/684746/4904d4bea86896f7d46dc00e7f56fc2d/krausestrasse-abgestimmte-planung-kenntnisnahmeverschickung-bericht-data.pdf"},
      {"Zwischenlösung – Pläne", "Juli 2023",
       "https://lsbg.hamburg.de/resource/blob/684744/4aaa9d8ee7e4c01cf20213fb1fd4f625/krausestrasse-abgestimmte-planung-kenntnisnahmeverschickung-plaene-data.pdf"},
      {"Verzögerung Umbau", "November 2022",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1012204"},
      {"Erläuterungsbericht", "Oktober 2021",
       "https://lsbg.hamburg.de/resource/blob/597782/66697a9cdddff36117b6b226e2f642ec/krausestrasse-bramfelder-strasse-bis-osterbekkanal-abgestimmte-planung-bericht-data.pdf"},
      {"Pläne/Karten", "Oktober 2021",
       "https://lsbg.hamburg.de/resource/blob/597784/7c7411d5f1ea2f7763146b4688271710/krausestrasse-bramfelder-strasse-bis-osterbekkanal-abgestimmte-planung-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In der Krausestraße gibt es im <.v bounds="10.050657,53.585279,10.053298,53.587277" lon={10.051643} lat={53.586266} dir="forward" ref={@ref}>nordwestlichen Teil</.v> bis zum Halbenkamp <.ref>Hochbordradwege</.ref>. Ab dort hat der Radverkehr keine eigenen Wege, sondern fährt im <.ref>Mischverkehr</.ref>. Erst ab <.v bounds="10.056431,53.574308,10.061279,53.578052" lon={10.058276} lat={53.576425} dir="forward" ref={@ref}>S-Bahnhof Friedrichsberg</.v> gibt es wieder Hochbordradwege, die häufig schmal und stark beschädigt daherkommen.</p>

    <p>In Fahrtrichtung Norden ist die Situation vergleichbar. Allerdings ist <.v bounds="10.056431,53.574308,10.061279,53.578052" lon={10.058878} lat={53.576435} dir="backward" ref={@ref}>die Führung am S-Friedrichsberg</.v> völlig unersichtlich.</p>

    <p>Da es kaum Abstellmöglichkeiten für Fahrräder gibt, werden Baumschutzbügel zweckentfremdet.</p>

    <h4>Zwischenlösung (2023)</h4>
    <p>Der vollständige Umbau wird nicht vor 2026 beginnen. Deswegen sollen bei einer anstehenden Erneuerung des Asphalts stellenweise Radwege aufgemalt werden. Die Führung wird an den Kreuzungen meist unterbrochen, weil hier der Aufwand für eine Zwischenlösung zu hoch wäre. Im Detail:</p>

    <ul>
      <li><.v bounds="10.051165,53.581863,10.056115,53.586195" lon={10.052382} lat={53.585571} dir="forward" ref={@ref}>Halbenkamp</.v> bis <.v bounds="10.051165,53.581863,10.056115,53.586195" lon={10.054894} lat={53.583048} dir="forward" ref={@ref}>Alter Teichweg</.v>: <.ref>Schutzstreifen</.ref>; 1,25m bis 1,40m; plus 50cm Sicherheitsabstand zu parkenden KFZ („<.ref>Dooring</.ref>“)</li>
      <li><.v bounds="10.052984,53.58126,10.058799,53.583078" lon={10.055462} lat={53.582609} dir="forward" ref={@ref}>Alter Teichweg</.v>: der Radfahrstreifen in Richtung Osten wird durchgängig. Dazu entfällt jeweils die eigene Linksabbiegerspur.</li>
      <li><.v bounds="10.057525,53.576299,10.060331,53.578615" lon={10.05792} lat={53.57855} dir="forward" ref={@ref}>Lauenburger Straße</.v> bis <.v bounds="10.057525,53.576299,10.060331,53.578615" lon={10.058371} lat={53.576964} dir="forward" ref={@ref}>Dithmarscher Straße</.v>: <.ref>Radfahrstreifen</.ref>; 1,85m</li>
      <li><.v bounds="10.056431,53.574308,10.061279,53.578052" lon={10.058878} lat={53.576435} dir="backward" ref={@ref}>Kreuzung S-Friedrichsberg</.v>: In Fahrtrichtung Norden wird der Hochbordradweg breiter und erhält eine klare Aufleitung für die Weiterfahrt auf der Krausestraße. Eine Verkehrsinsel sichert die Überleitung auf den Radfahrstreifen.</li>
      <li><.v bounds="10.058491,53.571356,10.062133,53.574315" lon={10.059046} lat={53.573794} dir="forward" ref={@ref}>Brauhausstraße</.v> bis <.v bounds="10.058491,53.571356,10.062133,53.574315" lon={10.059901} lat={53.571734} dir="forward" ref={@ref}>Brauhausstieg</.v>: <.ref>Protected-Bike-Lane</.ref> in Richtung Süden, Radfahrstreifen Richtung Norden. Beide ca. 2,50m breit.</li>
    </ul>

    <h5>Zwischenlösung (2023) – Meinung</h5>
    <p>Sie verbessert die Situation für den Radverkehr, aber sie ist zu stückhaft um sie als brauchbar zu bezeichnen. Der Komfort für KFZ wird weiterhin über die Sicherheit des Radverkehrs gestellt – die Kreuzungen werden nur ausgelassen, damit der KFZ-Durchsatz erhalten bleibt.</p>

    <h4>Planung – Abschnitt 1 – bis Osterbekkanal (nicht vor 2026)</h4>
    <p>Es ist vorgesehen durchgängige, meist 1,60m breite <.ref>Radfahrstreifen</.ref> zu bauen. In Richtung <.m bounds="10.050886,53.585427,10.052752,53.587292">Bramfelder Straße</.m> werden sie rund 2,0m breit. Die Radfahrstreifen verbleiben dabei jeweils rechts der KFZ-Spuren. Die ampelfreien Rechtsabbiegestreifen entfallen. Links abgebogen werden kann nur <.ref>indirekt</.ref>.</p>

    <p>An der Kreuzung mit dem <.v bounds="10.052607,53.584216,10.054338,53.585227" lon={10.053049} lat={53.584635} dir="forward" ref={@ref}>Lämmersieth</.v> kann <.ref>direkt</.ref> oder <.ref>indirekt</.ref> abgebogen werden. An den Bushaltestellen vor bzw. nach der Kreuzung muss sich der Radverkehr in den KFZ-Strom einordnen oder hinter den Bussen warten. Entlang der Freizeitroute werden jeweils Aufstellflächen vor den Autos aufgemalt. </p>

    <p>Es sind zahlreiche Fahrradanlehnbügel eingeplant. Auch die Fußwege werden etwas breiter.</p>

    <h4>Planung – weitere Abschnitte (nicht vor 2026)</h4>
    <p>Diese Planungen wurden noch nicht veröffentlicht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
