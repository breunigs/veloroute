defmodule Data.Article.Blog.GeorgWilhelmStrasse do
  use Article.Default

  def created_at(), do: ~D[2021-11-07]
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
      {"Lagepläne",
       "https://lsbg.hamburg.de/contentblob/10111410/39ab46eb0f2b9e33f7bfbdb21902387a/data/georg-wilhelm-strasse-abgestimmte-planung-plaene.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In Fahrtrichtung Süden gibt es ab der <.m bounds="9.989831,53.498059,9.993479,53.502053" lon="9.991347" lat="53.500837" dir="forward" ref="FR6">Mengestraße</.m> keine eigene Radspur und man muss mit den Autos im <.ref>Mischverkehr</.ref> fahren. Bei Gegenverkehr wird man auch häufig ohne ausreichenden Sicherheitsabstand überholt. In Richtung Norden gibt es einen <.ref>Hochbordradweg</.ref>, der jedoch von Vielen falsch herum befahren wird. An den Bushaltestellen führt der Radweg entweder knapp hinter dem Bushäuschen oder mitten durch den Wartebereich der Fahrgäste.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen in Fahrtrichtung Süden einen <.ref>Radfahrstreifen</.ref> mit 1,60m Breite aufzumalen. Dieser ist nicht ganz durchgängig, da er durch die Haltebereiche der Busse führt. An wartenden Bussen kann mit einem einfachen Fahrrad vorbeigefahren werden, ohne in den Gegenverkehr ausweichen zu müssen.</p>
    <p>In Fahrtrichtung Norden wird meist der vorhandene Radweg neu gepflastert. Seine Breite beträgt meistens 1,60m; wo keine Bäume es verhindern soll der Radweg 2,0m breit werden. An den Bushaltestellen wird der Radweg zu einem Radfahrstreifen abgeleitet und führt wie in der Gegenrichtung durch den Wartebereich der Busse. Je nach Lage passiert dies bereits vor den einmündenden Straßen. Ab der <.m bounds="9.990723,53.498059,9.991977,53.50046" lon="9.991233" lat="53.498092" dir="backward" ref="FR6">Ziegelerstraße</.m> bleibt es ein Radfahrstreifen.</p>
    <p>Gebaut werden soll in mehreren Abschnitten, von Süden nach Norden.</p>

    <h4>Meinung</h4>
    <p>Es ist gut, das die Georg-Wilhelm-Straße endlich überhaupt Radwege in beide Richtungen erhält. Angenehm wird der Radfahrstreifen in Richtung Süden dennoch nicht zu befahren sein. Mit Mindestbreite bietet er keinen Sicherheitsabstand zu überholenden Autos. Er kommt auch ohne jegliche Sicherung daher (Poller, Bordstein). In der Gegenrichtung entsteht durch die kurzen Stücke an den Bushaltestellen das gleiche Problem.</p>

    <p>Für geübte Alltagsradler ist der Umbau sicher vertretbar, für eine Freizeitroute aber völlig unangebracht. Es empfiehlt sich in diesem Bereich stattdessen weiter die <.a href="/alltagsroute-11">Alltagsroute 11</.a> zu nutzen.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
