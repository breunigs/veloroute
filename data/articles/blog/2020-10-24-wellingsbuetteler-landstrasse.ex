defmodule Data.Article.Blog.WellingsbuettelerLandstrasse do
  use Article.Default

  def created_at(), do: ~D[2020-10-24]
  def updated_at(), do: ~D[2021-06-07]
  def title(), do: "Wellingsbütteler Landstraße"

  def type(), do: :planned

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 2,
        group: "Wellingsbütteler Landstraße",
        direction: :forward,
        from: "Fuhlsbütteler Straße",
        to: "Grundlachs Twiete",
        parent_ref: __MODULE__,
        text: "Wellingsbütteler Landstraße",
        videos: [
          {"2022-01-29-rickling/GX013208", "00:01:10.103", "00:02:15.441"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Informationsseite der Stadt",
       "https://lsbg.hamburg.de/wellingsbuetteler-landstrasse/14247548/wellingsbuetteler-landstrasse/"},
      {"Erläuterungsbericht (2. Entwurf)",
       "https://lsbg.hamburg.de/contentblob/15137380/3b55516f4cce539646078a61cbb4db44/data/wellingsbuetteler-landstrasse-abstimmungsunterlage-2-verschickung)-bericht.pdf"},
      {"Lagepläne (2. Entwurf)",
       "https://lsbg.hamburg.de/contentblob/15137384/6074c525bf53e8f5a18cc6319de7b110/data/wellingsbuetteler-landstrasse-abstimmungsunterlage-2-verschickung)-plan.pdf"},
      {"Präsentation zum 2. Entwurf", "enthält auch Abschätzungen zur Bauzeit",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1010724"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Januar 2023</h4>
    <p>Die Baustellen-Planung wird anhand weiterer Verkehrszählungen neu bewertet und ggf. überarbeitet. Die Auswertung soll im Frühjahr 2023 vorliegen.</p>

    <h4>Alter Zustand</h4> <p>In der <.m bounds="10.031161,53.625658,10.057393,53.636639">Wellingsbütteler Landstraße</.m> selbst gibt es im Stadtteil <.m bounds="10.033141,53.628026,10.049216,53.6317">Klein Borstel</.m> keine eigenen Radwege. Es stehen die Optionen offen auf der Fahrbahn mit den KFZ zu fahren oder auf den Fußwegen (<.ref>Fahrrad frei</.ref>). Die Höchstgeschwindigkeit beträgt 50 km/h. Im <.m bounds="10.029983,53.62536,10.032621,53.626527">Kreuzungsbereich mit der Fuhlsbütteler Landstraße</.m> gibt es schmale <.ref>Hochbordradwege</.ref>, die mit engen Kuren durch die Kreuzung führen.</p>
    <h4>Planung</h4> <h5>Wesentliche Änderungen des zweiten Entwurfs:</h5> <ul>
    <li>Die <.ref>Radfahrstreifen</.ref> werden bis zur <.m bounds="10.032924,53.629069,10.041573,53.631069">Einmündung Stübeheide</.m> verlängert. Dies erfordert die Fällung aller Bäume auf der Südseite zwischen U-Bahn und Stübeheide.</li>
    <li>Die <.ref>Schutzstreifen</.ref> ab Stübeheide entfallen ersatzlos.</li>
    <li>Baubeginn frühestens März 2022.</li>
    </ul> <p><em>Der nachfolgende Artikel beschreibt den zweiten Entwurf.</em></p>
    <p>Die Wellingsbütteler Landstraße soll komplett saniert werden – Kanäle, Versorgungsleitungen und Straßenbelag gemeinsam. Es ist vorgesehen dem Radverkehr zwischen <.m bounds="10.027247,53.625691,10.039097,53.630037">Fuhlsbütteler Straße und Stübeheide</.m> je einen <.ref>Radfahrstreifen</.ref> mit rund 1,60m Breite anzubieten. Die Regenrinne zählt dabei zum Radweg; zu Parkplätzen ist nochmal zusätzlicher Sicherheitsabstand vorgesehen.</p>
    <p>Die Einmündung in die <.m bounds="10.032924,53.629069,10.041573,53.631069">Stübeheide</.m> wird so gestaltet, dass der Radverkehr diese leichter als Alternative verwenden kann. Ab der Stübeheide bleibt es wie heute bei <.ref>Mischverkehr</.ref> mit Tempo 50.</p>
    <p>Im <.m bounds="10.028903,53.625167,10.033771,53.626293">Kreuzungsbereich mit der Fuhlsbütteler Straße</.m> orientiert sich die Führung an den vorhandenen Hochbordradwegen, welche jedoch so gut wie möglich verbreitert werden. Auch ist eine gut sichtbare Trennung vom Fußweg durch den Einbau von weißen Noppenplatten vorgesehen.</p>
    <p>Zur U-Bahn Station Klein Borstel und in den <.m bounds="10.046698,53.633591,10.056424,53.63584">Kornweg</.m> sind jeweils Aufstellflächen für das <.ref>indirekte Linksabbiegen</.ref> vorgesehen. Anschließmöglichkeiten für Fahrräder werden im gesamten Baugebiet aufgestellt.</p>
    <h4>Meinung</h4> <p>Die Planung holt noch mit das Beste aus einer schwierigen Situation. Eine KFZ-Einbahnstraße ist unrealistisch, weil die Strecke auch für Verbesserungen im Nahverkehr („Hamburg-Takt“) eingeplant sind. Die Hälfte der Bäume zu fällen ist auch wenig attraktiv.</p>
    <p>Man fällt also nur die Bäume auf einem Teilstück, kann dadurch aber die Radfahrstreifen bis zu einer weniger befahrenen Straße verlängern. Diese ist offensichtlich als Alternativstrecke für diejenigen gedacht, die sich im Mischverkehr nicht wohlfühlen. Hier gilt zwar Tempo 30, aber eine Fahrradstraße ist momentan nicht geplant.</p>
    <p>Abseits der groben Planung hat der zweite Entwurf noch Detailverbesserungen für den Radverkehr an einigen Stellen erreicht. Zum Beispiel wird die Querung am U-Bahnhof vergrößert um dem geplanten Radschnellweg gerecht zu werden. Zum Linksabbiegen in die Fuhlsbütteler Straße gibt's nun eine zweite Auffahrt, sodass die Kurven weniger eng ausfallen. Gut, auch wenn die Rampe nur auf mangelhafte Radwege führt.</p>
    <h4>Quellen</h4>
    <.structured_links/>
    """
  end
end
