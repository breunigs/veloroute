defmodule Data.Article.Blog.RodigalleeUndBarsbuettlerStrasse do
  use Article.Default

  def created_at(), do: ~D[2022-03-17]

  def title(), do: "Rodigallee (Ost) und Barsbüttler Straße"

  def summary(),
    do: "Ost-West: 2,0m Radfahrstreifen, Busspur stadteinwärts. Nord-Süd: Planung wirkt unfertig."

  def type(), do: :planned
  def tags(), do: ["14", "rodigallee"]

  def start(), do: ~d[2023Q3]
  def stop(), do: ~d[2025Q3]

  def links(_assigns) do
    [
      {"Erläuterungsbericht", "1. Entwurf",
       "https://lsbg.hamburg.de/contentblob/15996822/b8417d2dc48e67460fbb1ad0b7111708/data/rodigallee-von-jenfelder-allee-bis-oejendorfer-damm-abstimmungsunterlage-bericht.pdf"},
      {"Lageplan", "1. Entwurf",
       "https://lsbg.hamburg.de/contentblob/15996824/c2766f5efb5f47659d5c45ef94236b1d/data/rodigallee-von-jenfelder-allee-bis-oejendorfer-damm-abstimmungsunterlage-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Planungsgebiet wird der Radverkehr auf <.ref>Hochbordradwegen</.ref> geführt.</p>

    <h4>Planung – Ost/West Richtung</h4>
    <p>Es ist vorgesehen beidseitig <.ref>Radfahrstreifen</.ref> von rund 2,0m Breite zu schaffen. Richtung Innenstadt wird eine Busspur eingerichtet. Die Fußwege erhalten unterschiedliche Breiten. KFZ steht mit zwei durchgängigen Spuren auch künftig weiterhin der meiste Platz zu.</p>

    <p>An den Bushaltestellen <.m bounds="10.123115,53.570816,10.124599,53.571297">Schiffsbeker Weg</.m> und <.m bounds="10.133964,53.570931,10.135377,53.57131">Jenfeld-Zentrum</.m> wird der Radverkehr Richtung Innenstadt jeweils rechts an den Bussen vorbeigeführt. Der Radweg verläuft hier als Hochbordradweg zwischen dem Wartebereich der Bus-Fahrgäste und dem Fußweg. An den anderen Haltestellen gibt es eine Busbucht und der Radverkehr wird links an den Bussen auf dem Radfahrstreifen vorbeigeführt.</p>

    <p>An den Kreuzungen ist jeweils <.ref>indirektes Linksabbiegen</.ref> vorgesehen. Am <.m bounds="10.128955,53.570891,10.130915,53.571307">Denksteinweg</.m> hat man die Wahl; am <.m bounds="10.132638,53.570886,10.134468,53.571361">Grabkeweg</.m> muss <.ref>direkt</.ref> links abgebogen werden.</p>

    <p>Man entschied sich dagegen, die Radfahrstreifen als <.ref>Protected-Bike-Lane</.ref> auszuführen. Als Gründe werden der größere Platzbedarf genannt, der zu schmaleren Radwegen führen würde. Auch das Durchkommen von Einsatzfahrzeugen (Polizei, Feuerwehr, Krankenwagen) wird mit Trennelementen schlechter bewertet.</p>

    <h4>Planung – Schiffbeker Weg</h4>
    <p>Es wird nur die <.m bounds="10.123928,53.570192,10.124819,53.570958">Südseite der Kreuzung</.m> umgebaut. In Fahrtrichtung Norden wird ein geschätzt 1,60m breiter Radfahrstreifen einrichtet. In der Gegenrichtung gibt es ein kurzes Stück <.ref>Schutzstreifen</.ref>, bevor der Radverkehr durch die Busbucht geleitet wird. Wer an einem wartenden Bus vorbeifahren möchte, muss sich in den KFZ-Verkehr einordnen.</p>

    <h4>Planung – Öjendorfer Damm (Veloroute 14)</h4>
    <p>Folgt man der Veloroute <.m bounds="10.134848,53.570084,10.136912,53.571907" lon="10.135622" lat="53.570497" dir="backward" ref="14">Richtung Norden</.m>, weitet sich die Fahrbahn auf und man fährt auf einem grob 2,0m breiten Radfahrstreifen. <.m bounds="10.134848,53.570084,10.136912,53.571907" lon="10.136138" lat="53.571177" dir="backward" ref="14">Nach der Kreuzung</.m> fährt man wie bisher rechts der Bushaltestelle auf einem Hochbordradweg.</p>

    <p>In <.m bounds="10.134848,53.570084,10.136912,53.571907" lon="10.136164" lat="53.571616" dir="forward" ref="14">Fahrtrichtung Süden</.m> wird man vom Hochbordradweg auf einen Radfahrstreifen abgeleitet. <.m bounds="10.134848,53.570084,10.136912,53.571907" lon="10.135751" lat="53.570804" dir="forward" ref="14">Nach der Kreuzung</.m> wird man durch den Wartebereich der Busse geleitet. Wer an einem wartenden Bus vorbeifahren will, muss sich in den KFZ-Verkehr einordnen. Der zur Orientierung dienende Schutzstreifen endet an der Einmündung <.m bounds="10.134848,53.570084,10.136912,53.571907" lon="10.135519" lat="53.570426" dir="forward" ref="14">Am Jenfelder Bach</.m>.</p>

    <h4>Sonstiges</h4>
    <p>Es sollen weitere Radanlehnbügel aufgestellt werden. Es sollen Ladezonen eingerichtet werden, damit die Radfahrstreifen nicht illegal zugeparkt werden. Die Grünflächen werden mit Pfählen gegen Beschädigung durch Falschparker gesichert.</p>

    <p>Die Planung schließt nahtlos an den Abschnitt <.a href="/article/2022-02-16-juethornstrasse-und-rodigallee">zwischen Jenfelder Allee und Bovestraße</.a> an. Die Bauplanung und -koordinierung für beide Teile soll dann gemeinsam stattfinden.</p>

    <h4>Meinung</h4>
    <p>Die Ost-West Richtung erscheint durchdacht.</p>

    <p>Im <.m bounds="10.123928,53.570192,10.124819,53.570958">Schiffbeker Weg</.m> behält man jedoch die 6-KFZ Spuren bei und muss für die unzeitgemäßen Radwege sogar noch zwei Bäume fällen. Am <.m bounds="10.134848,53.570084,10.136912,53.571907" lon="10.135751" lat="53.570804" dir="forward" ref="14">Öjendorfer Damm</.m> scheinen die Radwege immerhin etwas breiter zu sein. Trotzdem ist eine Unterbrechung des Radweges durch eine Busbucht für eine Veloroute inakzeptabel.</p>

    <p>Es wirkt als ob nur die Ost-West-Richtung fertig geplant wurde. Die Querstraßen scheinen fast wie Platzhalter, die zu einem späteren Zeitpunkt nochmal ordentlich angegangen werden sollen. Es ist immerhin ein erster Entwurf, Änderungen also durchaus noch zu erwarten.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
