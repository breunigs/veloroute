defmodule Data.Article.Blog.Rothenbaumchaussee do
  use Article.Default

  def created_at(), do: ~D[2022-01-15]
  def title(), do: "Rothenbaumchaussee"

  def start(), do: ~d[2022-07-18]
  def stop(), do: ~d[2023-06-30]
  def construction_site_id_hh(), do: [86476]

  def type(), do: :finished

  def summary(),
    do:
      "Lückenschluss Rothenbaumchaussee: zwischen Moorweiden- und Hallerstraße sollen Radfahrstreifen aufgemalt werden"

  def tags(), do: []

  def tracks(),
    do: [
      %Video.Track{
        renderer: 2,
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
        renderer: 2,
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
      {"Baustelleninfo", "Juli 2022",
       "https://lsbg.hamburg.de/resource/blob/634726/61be8b78c1656b833a227282e5c6adc6/rothenbaumchaussee-anliegerinformation-juli-2022-data.pdf"},
      {"Pressemitteilung zum Umbau", "Juli 2022",
       "https://www.hamburg.de/bvm/medien/16344462/2022-07-14-bvm-rothenbaumchaussee/"},
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/resource/blob/634592/1b72a8b74784c288ff08de56d9b6d75b/rothenbaumchaussee-hallerstrasse-bis-moorweidenstrasse-abstimmungsunterlage-bericht-data.pdf"},
      {"Lageplan",
       "https://lsbg.hamburg.de/resource/blob/634594/1f7e78d3b4122fe20a8d02fcb9323c2b/rothenbaumchaussee-hallerstrasse-bis-moorweidenstrasse-abstimmungsunterlage-plan-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Im Bauabschnitt in Fahrtrichtung Norden gibt es stellenweise schmale, unebene <.ref>Hochbordradwege</.ref>. Vor dem <.v bounds="9.98783,53.567592,9.989415,53.569216" lon={9.988588} lat={53.567933} dir="forward" ref={@ref}>Museum für Völkerkunde</.v> endet dieser ohne ersichtliche Alternative. In Fahrtrichtung Süden muss mit den KFZ im <.ref>Mischverkehr</.ref> gefahren werden.</p>

    <h4>Planung</h4>
    <p>Die <.ref>Radfahrstreifen</.ref> die in den anderen Teilen der Rothenbaumchaussee umgesetzt wurden werden fortgeführt. Sie werden mindestens 2,0m breit, stellenweise einige Zentimeter breiter. An den Bushaltestellen enden die Radspuren jeweils und man muss entweder warten, oder sich unter die Autos mischen. Auch bei Gegenverkehr sollte genug Platz bleiben um an einem wartenden Bus vorbeifahren zu können.</p>

    <p>Eine Ausnahme bildet der Weg nach Norden kurz nach dem <.v bounds="9.988288,53.570811,9.989124,53.572625" lon={9.988611} lat={53.571121} dir="forward" ref={@ref}>Turmweg</.v>. Hier bleibt der Hochbordradweg rechts der Baumreihe erhalten, der aber vor der Kreuzung mit der <.v bounds="9.988288,53.570811,9.989124,53.572625" lon={9.988719} lat={53.572355} dir="forward" ref={@ref}>Hallerstraße</.v> wieder zu einem Radfahrstreifen wird. Man darf aber auch weiterhin die <.ref>Fahrbahn</.ref> nutzen.</p>

    <p>Linksabbiegen ist kompliziert. An vielen Kreuzungen sind z.B. keine Aufstelltaschen eingezeichnet, die verdeutlichen wo <.ref>indirekt</.ref> links abgebogen werden kann. <.ref>Direktes Linksabbiegen</.ref> wird ebenfalls nicht angezeigt und ist stellenweise auch nicht vorgesehen, da die durchgezogene Linie ein Verlassen der Radfahrstreifen verbietet.</p>

    <p>An der Kreuzung mit der Hallerstraße ist <.v bounds="9.988255,53.571937,9.989017,53.573284" lon={9.988594} lat={53.572969} dir="backward" ref={@ref}>von Norden kommend</.v> ein <.ref>Radfahrstreifen in Mittellage</.ref> geplant.</p>

    <h4>Meinung</h4>
    <p>Die Planung ist im Groben okay. Der Radfahrstreifen in Mittellage dürfte dem Alter der Planung geschuldet sein: als sie gemacht wurde war diese Führung noch das Maß der Dinge.</p>

    <p>Die fehlenden Hinweise wie links abgebogen werden kann sind jedoch fragwürdig. Es ist davon auszugehen Unerfahrene illegal auf den Fußweg fahren werden um die Fußampel zu nutzen. Erfahrenen wird das direkte Linksabbiegen jedoch erschwert, weil der Radfahrstreifen kaum legal verlassen werden darf. Dabei wäre hier in den meisten Fällen nur eine Anpassung der Markierungen notwendig, und damit sehr einfach.</p>

    <p>Da man auch an den KFZ-Parkplätzen zwischen den Bäumen festhält, lässt sich keine ordentliche Trennung vom KFZ-Verkehr herstellen. An ähnlichen Straßen führt dies zu gefährdendem Falschparken auf den Radwegen. Es ist zu hoffen das diese zumindest noch an den Kreuzungsbereichen nachgerüstet wird.</p>

    <h4>Umbau</h4>
    <p>Der Umbau war ursprünglich für 2021 vorgesehen, was allerdings nicht passiert ist. Man ging von einer 14 monatigen Bauzeit aus. Ein neuer Termin ist mir noch nicht bekannt.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
