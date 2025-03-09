defmodule Data.Article.Static.Radroute22 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-22"
  def display_id(), do: "22"
  def title(), do: "Radroute 22"
  def color(), do: RouteColors.purple1()

  def summary(),
    do:
      "Radroute 22 verbindet den Stadtteil Hamm mit dem Dorf Zollenspieker – und der dortigen Fähre. Die Route ist größtenteils ländlich geprägt."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "22",
        direction: :forward,
        from: "Hammer Kirche",
        to: "Zollenspieker Fähre",
        parent_ref: __MODULE__,
        text: "von Hamm nach Zollenspieker",
        historic: %{
          "e3043edaed40e61f8394ffc591a08ab6" => ~d[2025-03]
        },
        videos: [
          {"2025-02-17-ost/GX018130", "00:00:23.739", "00:00:35.808"},
          {"2025-02-17-ost/GX018131", :start, "00:00:20.287"},
          {"2025-02-17-ost/GX018132", "00:00:01.768", "00:00:54.035"},
          {"2025-02-17-ost/GX018133", :start, "00:00:26.202"},
          {"2025-02-17-ost/GX018134", :start, "00:00:11.587"},
          {"2025-02-17-ost/GX018135", :start, "00:00:20.628"},
          {"2025-02-17-ost/GX018135", "00:00:38.054", "00:00:56.590"},
          {"2024-03-26-fr5/GX016959", "00:02:05.225", "00:10:06.152"},
          {"2025-03-02-bergedorf/GX018398", "00:04:12.382", "00:06:54.480"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "22",
        direction: :backward,
        from: "Zollenspieker Fähre",
        to: "Hammer Kirche",
        parent_ref: __MODULE__,
        text: "von Zollenspieker nach Hamm",
        historic: %{
          "9712409b7cff793e1a7f7e9d98b8115b" => ~d[2025-03]
        },
        videos: [
          {"2025-03-02-bergedorf/GX018398", "00:06:55.680", "00:08:24.104"},
          {"2024-03-26-fr5/GX016961", "00:06:18.478", "00:14:23.629"},
          {"2025-02-17-ost/GX018136", "00:00:01.235", "00:01:18.395"},
          {"2025-02-17-ost/GX018137", :start, :end},
          {"2025-02-17-ost/GX018138", :start, :end},
          {"2025-02-17-ost/GX018139", :start, "00:00:10.840"}
        ]
      }
    ]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <table class="routing2">
      <tr>
        <td></td>
        <td>
          <.icon>radroute-22</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td><.icon>radroute-1</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.044053,53.542924,10.082325,53.562738" lon={10.053142} lat={53.556019} dir="forward" ref={@ref}>Hamm</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-2</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.026195,53.521221,10.06888,53.543795" lon={10.041694} lat={53.534691} dir="forward" ref={@ref}>Rothenburgsort</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.033755,53.521575,10.065825,53.538879" lon={10.044234} lat={53.529413} dir="forward" ref={@ref}>Billwerder Bucht</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-20</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.054212,53.493349,10.102263,53.518226" lon={10.073982} lat={53.5007} dir="forward" ref={@ref}>Moorfleet</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:river} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.067524,53.493877,10.089017,53.506272" lon={10.078278} lat={53.499362} dir="forward" ref={@ref}>Dove Elbe</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.063236,53.483528,10.097057,53.507285" lon={10.075201} lat={53.486485} dir="forward" ref={@ref}>Tatenberg</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.071513,53.467042,10.097831,53.483527" lon={10.082718} lat={53.474692} dir="forward" ref={@ref}>Ochsenwerder</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.116684,53.438559,10.143563,53.456624" lon={10.128244} lat={53.449216} dir="forward" ref={@ref}>Fünfhausen</.v></td>
      </tr>
      <tr>
        <td><.icon>FR5</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="10.173528,53.409341,10.197853,53.420078" lon={10.18227} lat={53.413736} dir="forward" ref={@ref}>Spielplatz Gleisdreieck</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.163149,53.392868,10.221323,53.428583" lon={10.178488} lat={53.407884} dir="forward" ref={@ref}>Zollenspieker</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:ferry} ref={@ref}/></td>
        <td class="dim"><.v bounds="10.16543,53.389762,10.198866,53.412317" lon={10.182502} lat={53.397535} dir="forward" ref={@ref}>Elbe (private Fähre €)</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="10.160221,53.38866,10.203587,53.40568" lon={10.172546} lat={53.395268} dir="forward" ref={@ref}>Hoopte</.v></td>
      </tr>
    </table>

    <p>Radroute 22 führt von Hamm, über den <.v bounds="10.033424,53.487731,10.098779,53.536209" lon={10.056651} lat={53.520778} dir="forward" ref={@ref}>Kaltehofe-Hauptdeich</.v> und den <.v bounds="10.068157,53.425379,10.181042,53.480759" lon={10.099798} lat={53.463937} dir="forward" ref={@ref} highlight="Tatenberger Marschbahndamm,Ochsenwerder Marschbahndamm,Kirchwerder Marschbahndamm">ehemaligen Marschbahndamm</.v> zur Zollenspieker Fähre. Die Fähre ist nicht Teil des HVVs und benötigt eigene Fahrkarten, die während der Überfahrt verkauft werden.</p>

    <p>Der Marschbahndamm ist eher familienfreundlich. Für Radsport ist die Fahrt <.m bounds="10.049144,53.393714,10.208133,53.486015" highlight="Spadenländer Hauptdeich,Gauerter Hauptdeich,Overwerder Hauptdeich,Warwischer Hauptdeich,Hower Hauptdeich,Zollenspieker-Hauptdeich">direkt am Deich</.m> besser geeignet. Bitte achtet auf parkende Autos und schaut nach vorne – eure Bestzeiten sind zweitrangig.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und in der Stadt nur mit Navi oder Ortskenntnis auffindbar. Danach muss man sich mit <.v bounds="10.03636,53.522146,10.063504,53.539982" lon={10.044222} lat={53.529562} dir="backward" ref={@ref}>Kaltehofer Brücke</.v> und <.v bounds="10.067137,53.493681,10.085158,53.504327" lon={10.07834} lat={53.499391} dir="backward" ref={@ref} highlight="Tatenberger Weg">Tatenberger Schleuse</.v> aber nur noch zwei markante Orte merken – ansonsten immer geradeaus.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Hauptsächlich sind sie asphaltiert, auch wenn es längere Abschnitte mit mäßigem Betonsteinpflaster auf dem Kaltehofe-Hauptdeich gibt. Ausnahme sind die baufälligen <.v bounds="10.03806,53.534265,10.067031,53.555302" lon={10.057733} lat={53.544065} dir="forward" ref={@ref} highlight="Ausschläger Billdeich">Radwege um die Bille herum</.v>. Die Wege sind nur teilweise beleuchtet.</p>

    <h4>Meinung</h4>
    <p>Für längere Ausflüge und Radtouren ist die Strecke in Hamburg kaum zu überbieten. Sie ist weitestgehend autofrei und breit genug, dass man nebeneinander fahren kann.</p>

    <p>Die Wege sind kaum windgeschützt, weswegen die Windrichtung einen großen Einfluss auf die Fahrtzeit hat. Pendler sollten das einplanen oder ihre Windschnittigkeit verbessern.</p>


    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
