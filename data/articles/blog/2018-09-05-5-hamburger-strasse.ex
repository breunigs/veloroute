defmodule Data.Article.Blog.HamburgerStrasse do
  use Article.Default

  def name(), do: "#{created_at()}-5-hamburger-strasse"
  def created_at(), do: ~D[2018-09-05]

  def title(), do: "Hamburger Straße (Veloroute 5)"

  def start(), do: ~d[2020-02]
  def stop(), do: ~d[2020-08]

  def type(), do: :finished

  def tags(), do: ["5", "5N"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Im Bereich der Einmündungen <.m bounds="10.029702,53.567983,10.033698,53.57138">Finkenau</.m> und <.m bounds="10.033114,53.566698,10.040502,53.573929">Richardstraße</.m> soll der Radweg jeweils vom Hochbord auf eine Fahrradspur geleitet werden. Dies soll die Sichtbarkeit der Radfahrende für rechts abbiegende KFZ erhöhen.</p> <p>Weiter Richtung Norden, zwischen <.m bounds="10.03526,53.567223,10.04541,53.575135">Wagnerstraße</.m> und <.m bounds="10.036884,53.576558,10.040841,53.577978" lon={10.038547} lat={53.577189} dir="forward" ref="5">Wohldorfer Straße</.m> soll der Radverkehr ebenfalls auf eine 2,0m breite Spur verlegt werden. Da die Einmündungen hier dicht beieinander liegen ist die Spur hier jedoch durchgängig.</p> <p>Nicht geändert werden vorerst die große Kreuzung an der <.m bounds="10.03461,53.574649,10.036802,53.575473">Rönnhaidbrücke</.m>, da diese im Rahmen der <.a name="alltagsroute-13">Veloroute 13</.a> überarbeitet werden soll. Die arg schlechte Stelle nach dem <.m bounds="10.030879,53.57165,10.031645,53.572113">Polizeikommissariat 31</.m> wird noch provisorisch ausgebessert bis die Bauarbeiten dort fertig sind. Warum die Radwege im sonstigen Planungsgebiet (von <.m bounds="10.023942,53.567919,10.031055,53.571496">U-Mundsburg</.m> bis <.m bounds="10.037646,53.577879,10.042731,53.580341">U-Dehnhaide</.m>) bei 1,5m belassen werden ist mir nicht ganz klar – aktuelle Mindestbreite sind 1,60m. Qualitativ ist der Radweg sonst aber in gutem Zustand.</p> <p>Die Bauarbeiten sollen noch 2018 stattfinden. Weitere Infos:</p> <ul> <li> <.a href="https://lsbg.hamburg.de/contentblob/8562206/b5d77551bff25b2c761cf2e9ec6e3e10/data/hamburger-strasse-von-lerchenfeld-bis-dehnhaide-abgestimmte-planung-plaene.pdf">Lageplan</.a> </li> <li> <.a href="https://lsbg.hamburg.de/contentblob/8562200/f1b507756545a32010ba75b0259c3e33/data/hamburger-strasse-von-lerchenfeld-bis-dehnhaide-abgestimmte-planung-bericht.pdf">Erläuterungsbericht zur Umgestaltung</.a> </li><li><.a href="https://lsbg.hamburg.de/stadtstrassen/13545886/hamburger-strasse-oberaltenallee/">Infoseite der Stadt</.a></li></ul>
    """
  end
end
