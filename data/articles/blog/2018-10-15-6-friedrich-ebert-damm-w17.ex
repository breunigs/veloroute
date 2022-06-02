defmodule Data.Article.Blog.FriedrichEbertDammW17 do
  use Article.Default

  def name(), do: "#{created_at()}-6-friedrich-ebert-damm-w17"
  def created_at(), do: ~D[2018-10-15]

  def title(), do: "Friedrich-Ebert-Damm (Veloroute 6, „Abschnitt W17“)"

  def start(), do: ~d[2019-10-07]
  def stop(), do: ~d[2020-07-31]

  def type(), do: :finished

  def tags(), do: ["6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Planungen für den <.m bounds="10.071479,53.583062,10.118882,53.605133">Friedrich-Ebert-Damm</.m> von der <.m bounds="10.092553,53.595499,10.118539,53.600648">Eckerkoppel</.m> (mit Kreuzung) bis zur <.m bounds="10.111,53.606248,10.11993,53.623563">August-Krogmann-Straße</.m> (ohne Kreuzung) sind ordentlich: die in die Jahre gekommenen Radwege werden beidseitig durch Radfahrstreifen ersetzt. Bis auf wenige Ausnahmestellen sind sie ca. 2,15m breit.</p> <p>Auch die Situation an den verschiedenen Kreuzungen und Einmündungen wurde gut überdacht. Sind nur wenige Autospuren vorhanden, können Radfahrende künftig direkt links abbiegen, indem sie sich in den KFZ-Verkehr einordnen. Wer das nicht möchte hat Aufstelllaschen für's indirekte Linkssabbiegen. Letzteres ist auch für alle großen Kreuzungen so vorgesehen.</p> <p>Wer als Radfahrende gerade aus möchte, verbleibt in der Regel auf seiner Spur. Rechtsabbiegende Radfahrende teilen sich die Spur mit den KFZ, wobei es Radfahrende bequemer haben: sie halten sich einfach rechts, während die Autos in Zukunft die Geradeausspur des Radverkehrs queren müssen.</p> <p>An der Einmündung <.m bounds="10.115994,53.603949,10.117653,53.605939">An der Walddörferbahn</.m> wird es künftig sowohl vor als auch nach der Kreuzung eine Zufußgehende- bzw. Fahrradampel zur Querung geben. Aus Richtung Süden kommend muss der Radverkehr den linksseitigen Radweg nutzen, was sich mit dem Umbau auch nicht ändern wird. Immerhin gibt es in Zukunft eine ordentliche Querungsmöglichkeit, die verdeutlicht das der Zweirichtungsradweg an der <.m bounds="10.092553,53.595499,10.118539,53.600648">Eckerkoppel</.m> endet. Die Furt wird dabei diagonal über die Kreuzung geführt, was die Kurvenradien für den Radverkehr deutlich angenehmer macht.</p> <p>Die Kreuzung mit dem Rahlstedter Weg wird in <.a name="2019-03-19-6-berner-heerweg">Berner Heerweg (Abschnitt W18)</.a> betrachtet.</p> <p>
    <.a href="https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1009007">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)<br>
    <.a href="https://www.hamburg.de/pressemeldungen-bezirke/13030854/2019-10-04-neu-und-umbau-veloroute-sechs-friedrich-ebert-damm/">Ankündigung zum Baubeginn</.a>
    </p>
    """
  end
end
