defmodule Data.Article.Blog.Rothenbaumchaussee do
  use Article.Default

  def created_at(), do: ~D[2022-01-15]
  def title(), do: "Rothenbaumchaussee"

  def start(), do: ~d[]
  def stop(), do: ~d[]

  def type(), do: :planned

  def summary(),
    do:
      "Lückenschluss Rothenbaumchaussee: zwischen Moorweiden- und Hallerstraße sollen Radfahrstreifen aufgemalt werden"

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        group: "Rothenbaumchaussee",
        direction: :forward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Rothenbaumchaussee Fahrtrichtung Norden",
        videos: [
          {"2022-01-08-rothenbaumchaussee/GX013123", "00:00:02.903", "00:00:26.393"},
          {"2022-01-08-rothenbaumchaussee/GX013124", :start, "00:00:21.321"},
          {"2022-01-08-rothenbaumchaussee/GX013125", :start, "00:00:31.732"}
        ]
      },
      %Video.Track{
        group: "Rothenbaumchaussee",
        direction: :backward,
        from: "",
        to: "",
        parent_ref: __MODULE__,
        text: "Rothenbaumchaussee Fahrtrichtung Süden",
        videos: [
          {"2022-01-08-rothenbaumchaussee/GX013107", "00:00:14.481", "00:00:57.024"},
          {"2022-01-08-rothenbaumchaussee/GX013108", :start, "00:00:16.850"},
          {"2022-01-08-rothenbaumchaussee/GX013109", :start, "00:00:24.625"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/contentblob/12777430/de77e54d58d93a46867b0b31cdd4a54a/data/rothenbaumchaussee-zwischen-hallerstrasse-und-moorweidenstrasse-abstimmungsunterlage-bericht.pdf"},
      {"Lageplan",
       "https://lsbg.hamburg.de/contentblob/12777432/3ae54b0589e1ca7a1e3dfea7b36a36a3/data/rothenbaumchaussee-zwischen-hallerstrasse-und-moorweidenstrasse-abstimmungsunterlage-plan.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Bauabschnitt in Fahrtrichtung Norden gibt es stellenweise schmale, unebene <.ref>Hochbordradwege</.ref>. Vor dem <.m bounds="9.98783,53.567592,9.989415,53.569216" lon="9.988588" lat="53.567933" dir="forward">Museum für Völkerkunde</.m> endet dieser ohne ersichtliche Alternative. In Fahrtrichtung Süden muss mit den KFZ im <.ref>Mischverkehr</.ref> gefahren werden.</p>

    <h4>Planung</h4>
    <p>Die <.ref>Radfahrstreifen</.ref> die in den anderen Teilen der Rothenbaumchaussee umgesetzt wurden werden fortgeführt. Sie werden mindestens 2,0m breit, stellenweise einige Zentimeter breiter. An den Bushaltestellen enden die Radspuren jeweils und man muss entweder warten, oder sich unter die Autos mischen. Auch bei Gegenverkehr sollte genug Platz bleiben um an einem wartenden Bus vorbeifahren zu können.</p>

    <p>Eine Ausnahme bildet der Weg nach Norden kurz nach dem <.m bounds="9.988288,53.570811,9.989124,53.572625" lon="9.988611" lat="53.571121" dir="forward">Turmweg</.m>. Hier bleibt der Hochbordradweg rechts der Baumreihe erhalten, der aber vor der Kreuzung mit der <.m bounds="9.988288,53.570811,9.989124,53.572625" lon="9.988719" lat="53.572355" dir="forward">Hallerstraße</.m> wieder zu einem Radfahrstreifen wird. Man darf aber auch weiterhin die <.ref>Fahrbahn</.ref> nutzen.</p>

    <p>Linksabbiegen ist kompliziert. An vielen Kreuzungen sind z.B. keine Aufstelltaschen eingezeichnet, die verdeutlichen wo <.ref>indirekt</.ref> links abgebogen werden kann. <.ref>Direktes Linksabbiegen</.ref> wird ebenfalls nicht angezeigt und ist stellenweise auch nicht vorgesehen, da die durchgezogene Linie ein Verlassen der Radfahrstreifen verbietet.</p>

    <p>An der Kreuzung mit der Hallerstraße ist <.m bounds="9.988255,53.571937,9.989017,53.573284" lon="9.988594" lat="53.572969" dir="backward">von Norden kommend</.m> ein <.ref>Radfahrstreifen in Mittellage</.ref> geplant.</p>

    <h4>Meinung</h4>
    <p>Die Planung ist im Groben okay. Der Radfahrstreifen in Mittellage dürfte dem Alter der Planung geschuldet sein: als sie gemacht wurde war diese Führung noch das Maß der Dinge.</p>

    <p>Die fehlenden Hinweise wie links abgebogen werden kann sind jedoch fragwürdig. Es ist davon auszugehen Unerfahrene illegal auf den Fußweg fahren werden um die Fußampel zu nutzen. Erfahrenen wird das direkte Linksabbiegen jedoch erschwert, weil der Radfahrstreifen kaum legal verlassen werden darf. Dabei wäre hier in den meisten Fällen nur eine Anpassung der Markierungen notwendig, und damit sehr einfach.</p>

    <p>Da man auch an den KFZ-Parkplätzen zwischen den Bäumen festhält, lässt sich keine ordentliche Trennung vom KFZ-Verkehr herstellen. An ähnlichen Straßen führt dies zu gefährdendem Falschparken auf den Radwegen. Es ist zu hoffen das diese zumindest noch an den Kreuzungsbereichen nachgerüstet wird.</p>

    <h4>Umbau</h4>
    <p>Der Umbau war ursprünglich für 2021 vorgesehen, was allerdings nicht passiert ist. Man ging von einer 14 monatigen Bauzeit aus. Ein neuer Termin ist mir noch nicht bekannt.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
