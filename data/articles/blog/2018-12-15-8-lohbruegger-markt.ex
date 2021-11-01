defmodule Data.Article.Blog.LohbrueggerMarkt do
  use Article.Default

  def name(), do: "#{created_at()}-8-lohbruegger-markt"
  def created_at(), do: ~D[2018-12-15]

  def title(), do: "Doppelknoten Lohbrügger Markt (Veloroute 8)"

  def start(), do: ~d[2021-01-18]
  def stop(), do: ~d[2021-12-31]

  def type(), do: :construction
  def construction_site_id_hh(), do: [14337]
  def tags(), do: ["8"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand Dezember 2020:</strong> Nach den Anliegerinformationen des LSBG soll der Umbau des Lohbrügger Marktes ab Januar 2021 starten und bis ca. Ende 2021 dauern. Dieser Bauabschnitt erstreckt sich von der <.m bounds="10.198948,53.489895,10.205421,53.492601">Bergedorfer Straße</.m> bis zur <.m bounds="10.205696,53.495533,10.209847,53.497268">Leuschnerstraße</.m>. Eine Fahrt durch die Baustelle soll mit dem Rad weiterhin möglich sein, Details finden sich in der <.a href="https://lsbg.hamburg.de/contentblob/14725214/8ff975b0b8ca79a008e02d2713ac4171/data/sander-damm-lohbruegger-markt-sanierung-01-21-bis-12-21.pdf">Anliegerinfo</.a>.</p>
    <p>Bisher ist es eher unbequem der Veloroute 8 über den <.m bounds="10.20634,53.494537,10.208279,53.495923">Lohbrügger Markt</.m> zu folgen: man kann jeweils nicht direkt abbiegen, sondern muss einen Umweg Richtung Fußgängerüberweg machen. Da man die Ampeln nicht sehen kann, ist es auch nur schwer abschätzbar ob man sich beeilen oder lieber ausrollen lassen sollte.</p> <p>Nach dem Umbau wird das besser: der Radverkehr kann künftig der Spur folgend direkt abbiegen. Die Hochbordradwege werden dabei aufgegeben und die Fahrräder fahren stattdessen auf einer Radfahrspur auf der Fahrbahn. Der Zweirichtungsradweg in der <.m bounds="10.177159,53.494537,10.206479,53.508947">Lohbrügger Landstraße</.m> bleibt erhalten und es werden entsprechend Abbiegemöglichkeiten vorgesehen.</p> <p>Auf dem <.m bounds="10.204098,53.491447,10.2091,53.495089">Ludwig-Rosenberg-Ring</.m> fährt man Richtung Bahnhof (bergab) im Mischverkehr. Die Gegenrichtung erhält ab der <.m bounds="10.208507,53.494421,10.21053,53.495388">Walter-Freitag-Straße</.m> einen Radfahrstreifen der an der Bushaltestelle vorbeiführt um im Anschluss zwischen KFZ-Linksabbieger und Rechtsabbiegerstreifen zur Kreuzung zu führen.</p> <p>Unverständlich ist jedoch, warum man aus der <.m bounds="10.177159,53.494537,10.206479,53.508947">Lohbrügger Landstraße</.m> eine Bettelampel vorsieht: gerade hier könnte man sich ideal rollen lassen, um die Kreuzung zu queren. Auch beim indirekten Abbiegen aus dem <.m bounds="10.20158,53.484302,10.209056,53.49459">Sander Damm</.m> in die <.m bounds="10.177159,53.494537,10.206479,53.508947">Lohbrügger Landstraße</.m> sind Bettelampeln vorgesehen.</p> <p>Die Planung betrachtet den gesamten Straßenzug <.m bounds="10.20158,53.484302,10.209056,53.49459">Sander Damm</.m> bis <.m bounds="10.205293,53.503051,10.220365,53.504907">Binnenfeldredder</.m> und sieht eine dreijährige Bauzeit ab 2019 vor.</p> <ul>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/14725214/8ff975b0b8ca79a008e02d2713ac4171/data/sander-damm-lohbruegger-markt-sanierung-01-21-bis-12-21.pdf">Anliegerinfo Februar 2021</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11963520/22966e4064a5af6bfefa2dac2ee1df3b/data/sander-damm-bis-binnenfeldredder-landesgrenze-abgestimmte-planung-plaene.pdf">vorläufiger Lageplan</.a>
    </li>
    <li>
    <.a href="https://lsbg.hamburg.de/contentblob/11963508/81fd0bff567e7cf3ae27609c9d5f0a48/data/sander-damm-bis-binnenfeldredder-landesgrenze-abgestimmte-planung-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a>
    </li>
    </ul>
    """
  end
end
