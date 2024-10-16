defmodule Data.Article.Blog.GeorgWilhelmStrasse do
  use Article.Default

  def created_at(), do: ~D[2021-11-07]
  def updated_at(), do: ~D[2022-01-03]

  def title(), do: "Georg-Wilhelm-Straße (Freizeitroute 6)"

  def summary(),
    do:
      "Radweg Richtung Norden wird neu gepflastert, in der Gegenrichtung ein Radfahrstreifen aufgemalt (von Mengestraße bis Pollhornweg)"

  def start(), do: ~d[2021-08-02]
  def stop(), do: ~d[2025-08-29]
  def construction_site_id_hh(), do: [13785, 292_964, 303_875, 477_228, 967_714]

  def type(), do: :construction
  def tags(), do: ["FR6"]

  def links(_assigns) do
    [
      {"Baustelleninfo: Mengestraße bis Neuhöfer Straße", "September 2023",
       "https://web.archive.org/web/20230921083029if_/https://lsbg.hamburg.de/resource/blob/688502/cbd7324b28143d931e98fbac3969be35/georg-wilhelm-strasse-mengestrasse-bis-neuhoefer-strasse-anliegerinformation-september-2023-data.pdf"},
      {"Pressemitteilung zum Umbau", "Februar 2023",
       "https://www.hamburg.de/bvm/medien/16946456/2023-02-28-bvm-willhemsburg/"},
      {"Baustelleninfo: Neuhöfer Straße bis Harburger Chaussee", "Februar 2023",
       "https://web.archive.org/web/20230410130958if_/https://lsbg.hamburg.de/resource/blob/664806/07473997d201a9f92dd6a6dca1ff0aa3/georg-wilhelm-strasse-neuhoefer-strasse-bis-harburger-chaussee-anliegerinformation-februar-2023-data.pdf"},
      {"Baustelleninfo: Pollhornweg bis Mengestraße", "Januar 2023",
       "https://lsbg.hamburg.de/resource/blob/784446/3f79359ca9dfb4c2001dd380892e7b84/georg-wilhelm-strasse-pollhornweg-bis-mengestrasse-anliegerinformation-januar-2023-data.pdf"},
      {"Pressemitteilung zum Baustart",
       "https://www.hamburg.de/bvm/medien/16828174/2023-01-11-bvm-georg-wilhelm-strasse/"},
      {"Erläuterungsbericht",
       "https://lsbg.hamburg.de/resource/blob/784168/7d1503a0485f2ca10b1da559f16c61b9/georg-wilhelm-strasse-abgestimmte-planung-bericht-data.pdf"},
      {"Änderungen der überarbeiteten Fassung",
       "https://lsbg.hamburg.de/resource/blob/784164/1258e0913eda7992fbf84489850b8d01/georg-wilhelm-strasse-abgestimmte-planung-nachtrag-bericht-data.pdf"},
      {"überarbeitete Lagepläne",
       "https://lsbg.hamburg.de/resource/blob/784166/8c18e6d959eb1654987d047ca3478d17/georg-wilhelm-strasse-abgestimmte-planung-nachtrag-plaene-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand 2022</h4>
    <p>Es wurde eine überarbeitete Planung veröffentlicht. Dort wo es einfach genug möglich war, werden Rad- und Fußwege etwas verbreitert. Teilweise erhält der Radfahrstreifen Richtung Süden trennende Bordsteine. Der Artikel wurde dem neuesten Entwurf angepasst.</p>

    <h4>Alter Zustand</h4>
    <p>In Fahrtrichtung Süden gibt es ab der <.v bounds="9.989831,53.498059,9.993479,53.502053" lon={9.991347} lat={53.500837} dir="forward" ref="FR6">Mengestraße</.v> keine eigene Radspur und man muss mit den Autos im <.ref>Mischverkehr</.ref> fahren. Bei Gegenverkehr wird man auch häufig ohne ausreichenden Sicherheitsabstand überholt. In Richtung Norden gibt es einen <.ref>Hochbordradweg</.ref>, der jedoch von Vielen falsch herum befahren wird. An den Bushaltestellen führt der Radweg entweder knapp hinter dem Bushäuschen oder mitten durch den Wartebereich der Fahrgäste.</p>

    <h4>Planung</h4>
    <p>Es ist vorgesehen in Fahrtrichtung Süden einen <.ref>Radfahrstreifen</.ref> mit mindestens 1,60m Breite aufzumalen. Häufig sind 2,0m vorgesehen. Der Radfahrstreifen ist nicht ganz durchgängig, da er durch die Haltebereiche der Busse führt. An wartenden Bussen kann mit einem einfachen Fahrrad vorbeigefahren werden, ohne in den Gegenverkehr ausweichen zu müssen. An wenigen Stellen ist zusätzlich ein 30cm breiter Bordstein zur Abtrennung vom KFZ-Verkehr vorgesehen.</p>

    <p>In Fahrtrichtung Norden wird meist der vorhandene Radweg neu gepflastert. Seine Breite beträgt meistens 1,60m; wo keine Bäume es verhindern soll der Radweg 2,0m breit werden. An den Bushaltestellen wird der Radweg zu einem Radfahrstreifen abgeleitet und führt wie in der Gegenrichtung durch den Wartebereich der Busse. Je nach Lage passiert dies bereits vor den einmündenden Straßen. Ab der <.v bounds="9.990723,53.498059,9.991977,53.50046" lon={9.991233} lat={53.498092} dir="backward" ref="FR6">Ziegelerstraße</.v> bleibt es ein Radfahrstreifen.</p>
    <p>Gebaut werden soll in mehreren Abschnitten, von Süden nach Norden.</p>

    <h4>Meinung</h4>
    <p>Es ist gut, das die Georg-Wilhelm-Straße endlich überhaupt Radwege in beide Richtungen erhält. Die nachträgliche Verbreiterung und trennenden Bordsteine machen den Radfahrstreifen in Richtung Süden halbwegs akzeptabel. Dennoch bleiben große Lücken wo mit Mindestbreite ohne Bordsteine kein Sicherheitsabstand zu überholenden Autos bleibt. In der Gegenrichtung entsteht durch die kurzen Stücke an den Bushaltestellen das gleiche Problem.</p>

    <p>Für geübte Alltagsradler ist der Umbau sicher vertretbar, für eine Freizeitroute aber völlig unangebracht. Es empfiehlt sich in diesem Bereich stattdessen weiter die <.a name="alltagsroute-11">Alltagsroute 11</.a> zu nutzen.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
