defmodule Data.Article.Blog.LangenfelderDamm do
  use Article.Default

  def name(), do: "#{created_at()}-2-langenfelder-damm"
  def created_at(), do: ~D[2018-09-29]

  def title(), do: "Langenfelder Damm (Veloroute 2)"

  def start(), do: ~d[2019Q3]

  def type(), do: :finished

  def tags(), do: [2]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Situation im <.m bounds="9.933571,53.57787,9.941513,53.584227">Langenfelder Damm</.m> ist aktuell grausig: schlechter Belag, zu schmal, Radwege verschwinden im Nichts. Bis zum Umbau ist die alte Führung der Veloroute 2 durch Anwohnerstraßen definitiv zu bevorzugen.</p><p>In der Neuplanung ist ein Kreisverkehr an der Einmündung der <.m bounds="9.939052,53.579485,9.945791,53.580509">Müggenkampstraße</.m> vorgesehen. Im Vor- bzw. Nachlauf wird der Radverkehr je nach Platz auf Schutzstreifen (gestrichelete Linie), Radfahrstreifen (durchgezogene Linie) oder Fahrradwegen geführt. Im Bereich der Bushaltestelle „Högenstraße“ muss auf die KFZ-Spur ausgewichen werden, wenn ein Bus hält.</p> <p>Stadteinwärts muss man auch in Zukunft zweimal links abbiegen: aus dem <.m bounds="9.936208,53.578462,9.93884,53.588592">Högenstraße</.m> in den <.m bounds="9.933571,53.57787,9.941513,53.584227">Langenfelder Damm</.m> und von diesem in die <.m bounds="9.93988,53.574425,9.950246,53.579571">Sillemstraße</.m>. Immerhin erlauben Verkehrsinseln den Vorgang auf zweimal zu machen, was bei starkem Verkehr helfen sollte. Das auf dem kurzen Stück zwischen Kreisel und Sillemstraße nochmal ein Radstreifen eingezeichnet verwundert mich aber. Er drängt den Radverkehr zur Seite, statt ihn bequem links abbiegen zu lassen. Außerdem ist nach wenigen Metern sowieso wieder ein Einfädelvorgang nötig. Insgesamt scheint mir diese Lösung vor allem dazu geeignet die KFZ zu zu knappem Überholen zu animieren.</p> <p>Unterm Strich ist die vorgestellte Planung definitiv besser als der Bestand. Ob das Linksabbiegen in die Sillemstraße klappt wird sich zeigen müssen. Der Umbau soll im Sommer 2019 stattfinden.</p> <ul>
    <li><.a href="https://www.hamburg.de/contentblob/11244408/57799f9cd35ca253b23c0d1a504cfd3c/data/praesentation-langenfelder-damm.pdf">Präsentation zum Umbau, mit vorläufigen Lageplänen</.a> (S. 49,58 ff)</li>
    <li><.a href="https://www.hamburg.de/eimsbuettel/langenfelderdamm/">Infoseite der Stadt zum Langenfelder Damm</.a></li>
    </ul>
    """
  end
end
