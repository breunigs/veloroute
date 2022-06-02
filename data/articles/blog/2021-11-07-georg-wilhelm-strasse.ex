defmodule Data.Article.Blog.GeorgWilhelmStrasse do
  use Article.Default

  def created_at(), do: ~D[2021-11-07]
  def updated_at(), do: ~D[2022-01-03]

  def title(), do: "Georg-Wilhelm-Straße (Freizeitroute 6)"

  def summary(),
    do:
      "Radweg Richtung Norden wird neu gepflastert, in der Gegenrichtung ein Radfahrstreifen aufgemalt (von Mengestraße bis Pollhornweg)"

  def start(), do: ~d[2021-08-02]
  def stop(), do: ~d[2023-11-12]
  def construction_site_id_hh(), do: [13785]

  def type(), do: :construction
  def tags(), do: ["FR6"]

  def links(_assigns) do
    [
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/contentblob/10111408/9277a6b41d043d6468c5ca3a642198ee/data/georg-wilhelm-strasse-abgestimmte-planung-bericht.pdf"},
      {"Änderungen der überarbeiteten Fassung",
       "https://lsbg.hamburg.de/contentblob/15717754/4c10155fedce8a2737d5420dfc93ab1b/data/georg-wilhelm-strasse-ueberarbeitete-abgestimmte-planung-bericht.pdf"},
      {"überarbeitete Lagepläne",
       "https://lsbg.hamburg.de/contentblob/15717756/8e8fdb8c33110bed40c07befe279ec90/data/georg-wilhelm-strasse-ueberarbeitete-abgestimmte-planung-plaene.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand 2022</h4>
    <p>Es wurde eine überarbeitete Planung veröffentlicht. Dort wo es einfach genug möglich war, werden Rad- und Fußwege etwas verbreitert. Teilweise erhält der Radfahrstreifen Richtung Süden trennende Bordsteine. Der Artikel wurde dem neuesten Entwurf angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>In Fahrtrichtung Süden gibt es ab der <.m bounds="9.989831,53.498059,9.993479,53.502053" lon="9.991347" lat="53.500837" dir="forward" ref="FR6">Mengestraße</.m> keine eigene Radspur und man muss mit den Autos im <.ref>Mischverkehr</.ref> fahren. Bei Gegenverkehr wird man auch häufig ohne ausreichenden Sicherheitsabstand überholt. In Richtung Norden gibt es einen <.ref>Hochbordradweg</.ref>, der jedoch von Vielen falsch herum befahren wird. An den Bushaltestellen führt der Radweg entweder knapp hinter dem Bushäuschen oder mitten durch den Wartebereich der Fahrgäste.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen in Fahrtrichtung Süden einen <.ref>Radfahrstreifen</.ref> mit mindestens 1,60m Breite aufzumalen. Häufig sind 2,0m vorgesehen. Der Radfahrstreifen ist nicht ganz durchgängig, da er durch die Haltebereiche der Busse führt. An wartenden Bussen kann mit einem einfachen Fahrrad vorbeigefahren werden, ohne in den Gegenverkehr ausweichen zu müssen. An wenigen Stellen ist zusätzlich ein 30cm breiter Bordstein zur Abtrennung vom KFZ-Verkehr vorgesehen.</p>

    <p>In Fahrtrichtung Norden wird meist der vorhandene Radweg neu gepflastert. Seine Breite beträgt meistens 1,60m; wo keine Bäume es verhindern soll der Radweg 2,0m breit werden. An den Bushaltestellen wird der Radweg zu einem Radfahrstreifen abgeleitet und führt wie in der Gegenrichtung durch den Wartebereich der Busse. Je nach Lage passiert dies bereits vor den einmündenden Straßen. Ab der <.m bounds="9.990723,53.498059,9.991977,53.50046" lon="9.991233" lat="53.498092" dir="backward" ref="FR6">Ziegelerstraße</.m> bleibt es ein Radfahrstreifen.</p>
    <p>Gebaut werden soll in mehreren Abschnitten, von Süden nach Norden.</p>

    <h4>Meinung</h4>
    <p>Es ist gut, das die Georg-Wilhelm-Straße endlich überhaupt Radwege in beide Richtungen erhält. Die nachträgliche Verbreiterung und trennenden Bordsteine machen den Radfahrstreifen in Richtung Süden halbwegs akzeptabel. Dennoch bleiben große Lücken wo mit Mindestbreite ohne Bordsteine kein Sicherheitsabstand zu überholenden Autos bleibt. In der Gegenrichtung entsteht durch die kurzen Stücke an den Bushaltestellen das gleiche Problem.</p>

    <p>Für geübte Alltagsradler ist der Umbau sicher vertretbar, für eine Freizeitroute aber völlig unangebracht. Es empfiehlt sich in diesem Bereich stattdessen weiter die <.a name="alltagsroute-11">Alltagsroute 11</.a> zu nutzen.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
