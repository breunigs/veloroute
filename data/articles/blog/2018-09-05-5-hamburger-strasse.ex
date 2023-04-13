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
    [
      {"Lageplan",
       "https://lsbg.hamburg.de/resource/blob/634140/933863417f783bcb354ed3fb8ec8c5ae/hamburger-strasse-lerchenfeld-bis-denhaide-abgestimmte-planung-plaene-data.pdf"},
      {"Erläuterungsbericht zur Umgestaltung",
       "https://lsbg.hamburg.de/resource/blob/634138/427dd700bf1e137134cad1b0b5670877/hamburger-strasse-lerchenfeld-bis-denhaide-abgestimmte-planung-bericht-data.pdf"},
      {"Infoseite der Stadt",
       "https://web.archive.org/web/20210124130710/https://lsbg.hamburg.de/stadtstrassen/13545886/hamburger-strasse-oberaltenallee/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <p>Im Bereich der Einmündungen <.m bounds="10.029702,53.567983,10.033698,53.57138">Finkenau</.m> und <.m bounds="10.033114,53.566698,10.040502,53.573929">Richardstraße</.m> soll der Radweg jeweils vom Hochbord auf eine Fahrradspur geleitet werden. Dies soll die Sichtbarkeit der Radfahrende für rechts abbiegende KFZ erhöhen.</p> <p>Weiter Richtung Norden, zwischen <.m bounds="10.03526,53.567223,10.04541,53.575135">Wagnerstraße</.m> und <.v bounds="10.036884,53.576558,10.040841,53.577978" lon={10.038547} lat={53.577189} dir="forward" ref="5">Wohldorfer Straße</.v> soll der Radverkehr ebenfalls auf eine 2,0m breite Spur verlegt werden. Da die Einmündungen hier dicht beieinander liegen ist die Spur hier jedoch durchgängig.</p> <p>Nicht geändert werden vorerst die große Kreuzung an der <.m bounds="10.03461,53.574649,10.036802,53.575473">Rönnhaidbrücke</.m>, da diese im Rahmen der <.a name="alltagsroute-13">Veloroute 13</.a> überarbeitet werden soll. Die arg schlechte Stelle nach dem <.m bounds="10.030879,53.57165,10.031645,53.572113">Polizeikommissariat 31</.m> wird noch provisorisch ausgebessert bis die Bauarbeiten dort fertig sind. Warum die Radwege im sonstigen Planungsgebiet (von <.m bounds="10.023942,53.567919,10.031055,53.571496">U-Mundsburg</.m> bis <.m bounds="10.037646,53.577879,10.042731,53.580341">U-Dehnhaide</.m>) bei 1,5m belassen werden ist mir nicht ganz klar – aktuelle Mindestbreite sind 1,60m. Qualitativ ist der Radweg sonst aber in gutem Zustand.</p> <p>Die Bauarbeiten sollen noch 2018 stattfinden.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
