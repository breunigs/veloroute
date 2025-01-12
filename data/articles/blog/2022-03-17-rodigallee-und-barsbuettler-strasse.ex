defmodule Data.Article.Blog.RodigalleeUndBarsbuettlerStrasse do
  use Article.Default

  def updated_at(), do: ~D[2024-12-12]

  def title(), do: "Rodigallee (Ost) und Barsbüttler Straße"

  def summary(),
    do:
      "Meist Protected-Bike-Lanes mit 2,0m Breite. Bus-Spur stadteinwärts. Führung an Bushaltestellen unterschiedlich und nicht immer ideal."

  def type(), do: :planned
  def tags(), do: ["14", "rodigallee", "br-wandsbek-w8"]

  def start(), do: ~d[2025-05]
  def stop(), do: ~d[2029-09]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 3,
        group: "Rodigallee",
        direction: :forward,
        from: "Bovestraße",
        to: "Holsteiner Tor",
        parent_ref: __MODULE__,
        text: "Rodigallee Richtung Osten",
        videos: [
          {"2022-05-07-v10-v7-u-rodigallee/GX013771", "00:00:01.301", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013772", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013773", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013774", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013775", :start, "00:00:47.147"}
        ]
      },
      %Video.Track{
        renderer: 3,
        group: "Rodigallee",
        direction: :backward,
        from: "Holsteiner Tor",
        to: "Bovestraße",
        parent_ref: __MODULE__,
        text: "Rodigallee Richtung Westen",
        videos: [
          {"2022-05-07-v10-v7-u-rodigallee/GX013775", "00:00:48.682", :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013776", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013777", :start, :end},
          {"2022-05-07-v10-v7-u-rodigallee/GX013778", :start, "00:01:19.046"}
        ]
      }
    ]

  def map_image do
    {name(), [{"LSBG Hamburg", "https://lsbg.hamburg.de/ueber-uns/kontakt"}]}
  end

  def links(_assigns) do
    [
      {"fertiger Entwurf – Erläuterungsbericht", ~d[2024-12],
       "https://lsbg.hamburg.de/resource/blob/999388/a7354ccf6a0eeb48c004a282e14ae9c5/rodigallee-juethornstrasse-bovestrasse-bis-holstenhofweg-abgestimmte-planung-bericht-data.pdf"},
      {"fertiger Entwurf – Karte", ~d[2024-12],
       "https://lsbg.hamburg.de/resource/blob/999390/a8130323da78f7eab806ac323e7dc7fa/rodigallee-juethornstrasse-bovestrasse-bis-holstenhofweg-abgestimmte-planung-plaene-data.pdf"},
      {"1. Entwurf – Erläuterungsbericht", ~d[2021-11],
       "https://lsbg.hamburg.de/resource/blob/784288/cee75be37257daf04e8b394294923441/rodigallee-jenfelder-allee-bis-oejendorfer-damm-abstimmungsunterlage-bericht-data.pdf"},
      {"1. Entwurf – Karte", ~d[2021-11],
       "https://lsbg.hamburg.de/resource/blob/784290/01f2a38fb873d12ea687701fb103c1b4/rodigallee-jenfelder-allee-bis-oejendorfer-damm-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand Dezember 2024</h4>
    <p>Der fertige Entwurf wurde veröffentlicht. Die wichtigste Änderung ist, dass man mit <.ref>Protected-Bike-Lanes</.ref> Rad- und KFZ-Verkehr besser voneinander trennt. Der Artikel wurde entsprechend angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>Im Planungsgebiet wird der Radverkehr auf <.ref>Hochbordradwegen</.ref> geführt.</p>



    <.h4_planning ref={@ref} checked={@show_map_image}>Planung – Ost/West Richtung</.h4_planning>
    <p>Es ist vorgesehen beidseitig <.ref>Protected-Bike-Lanes</.ref> von rund 2,0m Breite zu schaffen. In der <.v bounds="10.135054,53.57031,10.138222,53.571464" lon={10.135915} lat={53.570863} dir="forward" ref={@ref}>Barsbütteler Straße</.v> werden sie etwas enger. Richtung Innenstadt wird eine Busspur eingerichtet. Die Fußwege erhalten unterschiedliche Breiten. KFZ steht mit zwei durchgängigen Spuren auch künftig weiterhin der meiste Platz zu.</p>

    <p>An den Bushaltestellen sind jeweils andere Lösungen vorgesehen:</p>
    <ul>
      <li><.v bounds="10.123579,53.570395,10.126669,53.571474" lon={10.125048} lat={53.570873} dir="forward" ref={@ref}>Schiffbeker Weg</.v>
        <ul>
          <li>Stadteinwärts: <.ref>Hochbordradweg</.ref> hinter der Wartefläche für Fahrgäste.</li>
          <li>Stadtauswärts: Gehwegradeln („Fahrrad frei“)</li>
        </ul>
      </li>
      <li><.v bounds="10.129111,53.570624,10.132784,53.571691" lon={10.130265} lat={53.571017} dir="forward" ref={@ref}>Denksteinweg</.v>
        <ul>
          <li>Stadteinwärts: <.ref>Radfahrstreifen</.ref> an der Busbucht vorbei.</li>
          <li>Stadtauswärts: Fahrt über die Haltefläche der Busse. Zum Überholen des Busses muss man sich in den KFZ-Verkehr einordnen.</li>
        </ul>
      </li>
      <li><.v bounds="10.133705,53.570495,10.137724,53.571443" lon={10.136115} lat={53.570832} dir="forward" ref={@ref}>Jenfeld-Zentrum</.v>
        <ul>
          <li>Stadteinwärts: Hochbordradweg hinter der Wartefläche für Fahrgäste.</li>
          <li>Stadtauswärts: Radfahrstreifen an der Busbucht vorbei.</li>
        </ul>
      </li>
    </ul>

    <p>An den Kreuzungen ist jeweils <.ref>indirektes Linksabbiegen</.ref> vorgesehen. Am <.v bounds="10.12915,53.570792,10.130917,53.571429" lon={10.129556} lat={53.570998} dir="forward" ref={@ref}>Denksteinweg</.v> hat man die Wahl; am <.v bounds="10.132605,53.57058,10.13532,53.571594" lon={10.133119} lat={53.571052} dir="forward" ref={@ref}>Grabkeweg</.v> muss <.ref>direkt</.ref> links abgebogen werden.</p>

    <h4>Planung – Schiffbeker Weg (<.a name="br-wandsbek-w8">Bezirksroute W8</.a>)</h4>
    <p>Es wird nur die <.m bounds="10.123928,53.570192,10.124819,53.570958">Südseite der Kreuzung</.m> umgebaut. In Fahrtrichtung Norden wird eine Protected-Bike-Lane einrichtet. In der Gegenrichtung ist jeweils nur kurz ein Stück Protected-Bike-Lane bzw. Radfahrstreifen vorgesehen, bevor der Radverkehr durch die Wartefläche der Busse geleitet wird. Wer an einem wartenden Bus vorbeifahren möchte, muss sich in den KFZ-Verkehr einordnen.</p>

    <h4>Planung – Öjendorfer Damm (<.a name="14">Radroute 14</.a>)</h4>
    <p>Folgt man der Radroute <.v bounds="10.134848,53.570084,10.136912,53.571907" lon={10.135622} lat={53.570497} dir="backward" ref="14">Richtung Norden</.v>, weitet sich die Fahrbahn auf und man fährt auf eine Protected-Bike-Lane. <.v bounds="10.134848,53.570084,10.136912,53.571907" lon={10.136138} lat={53.571177} dir="backward" ref="14">Nach der Kreuzung</.v> fährt man wie bisher rechts der Bushaltestelle auf einem Hochbordradweg.</p>

    <p>In <.v bounds="10.134848,53.570084,10.136912,53.571907" lon={10.136164} lat={53.571616} dir="forward" ref="14">Fahrtrichtung Süden</.v> wird man vom Hochbordradweg auf eine Protected-Bike-Lane abgeleitet. <.v bounds="10.134848,53.570084,10.136912,53.571907" lon={10.135751} lat={53.570804} dir="forward" ref="14">Nach der Kreuzung</.v> wird man durch den Wartebereich der Busse geleitet. Wer an einem wartenden Bus vorbeifahren will, muss sich in den KFZ-Verkehr einordnen. Der zur Orientierung dienende Schutzstreifen endet an der Einmündung <.v bounds="10.134848,53.570084,10.136912,53.571907" lon={10.135519} lat={53.570426} dir="forward" ref="14">Am Jenfelder Bach</.v>.</p>

    <h4>Sonstiges</h4>
    <p>Die Planung schließt nahtlos an den Abschnitt <.a name="2022-02-16-juethornstrasse-und-rodigallee">zwischen Jenfelder Allee und Bovestraße</.a> an. Der Umbau erfolgt gemeinsam bzw. koordiniert.</p>

    <h4>Meinung</h4>
    <p>Die Planung bringt gute Radwege. Größtes Manko ist die Führung an Bushaltestellen. Diese sind teilweise gut (Hochbordradweg rechts der Aufstellfläche für Fahrgäste), fehlen aber auch teilweise (Gehwegradeln, Führung durch Haltefläche der Busse).</p>

    <p>Das ist gerade im Verlauf der Radroute 14 unschön. Wenn man auf der Fahrrad-Hauptroute nicht weiter den Autoverkehr hofieren würde, wäre genug Platz für eine ordentliche Lösung. Immerhin gibt es an dieser Haltestelle nur wenige Busse.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
