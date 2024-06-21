defmodule Data.Article.Static.Alltagsroute13 do
  use Article.Static

  def id(), do: "13"
  def route_group(), do: :alltag
  def title(), do: "Alltagsroute 13"

  def color(), do: "#f28801"

  def summary(),
    do: "Alltagsroute 13 führt ringförmig im Uhrzeigersinn von Altona nach Borgfelde"

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 5,
        group: "13",
        direction: :forward,
        from: "Altona",
        to: "Hamm",
        parent_ref: __MODULE__,
        text: "innere Ringroute, im Uhrzeigersinn",
        historic: %{
          "c8ca2338f8a1f2f3e154e66d2e09b422" => ~d[2024-06],
          "e29ad9e22984ec8ea9c871aadca15443" => ~d[2023-06],
          "61efced8de5be9384b396cc574220cbe" => ~d[2022-05]
        },
        videos: [
          {"2024-06-16-13im-14gg/GX017689", :start, :end},
          {"2024-06-16-13im-14gg/GX017690", :start, :end},
          {"2024-06-16-13im-14gg/GX017691", :start, :end},
          {"2024-06-16-13im-14gg/GX017692", :start, :end},
          {"2024-06-16-13im-14gg/GX017693", :start, :end},
          {"2024-06-16-13im-14gg/GX017694", :start, :end},
          {"2024-06-16-13im-14gg/GX017695", :start, :end},
          {"2024-06-16-13im-14gg/GX017696", :start, :end},
          {"2024-06-16-13im-14gg/GX017697", :start, :end},
          {"2024-06-16-13im-14gg/GX017698", :start, :end},
          {"2024-06-16-13im-14gg/GX017699", :start, :end},
          {"2024-06-16-13im-14gg/GX017700", :start, :end},
          {"2024-06-16-13im-14gg/GX017701", :start, :end},
          {"2024-06-16-13im-14gg/GX017702", :start, :end},
          {"2024-06-16-13im-14gg/GX017703", :start, "00:00:02.002"}
        ]
      },
      %Video.Track{
        renderer: 5,
        group: "13",
        direction: :backward,
        from: "Hamm",
        to: "Altona",
        parent_ref: __MODULE__,
        text: "innere Ringroute, gegen Uhrzeigersinn",
        historic: %{
          "2207926269b2e70b9183b727eb482791" => ~d[2024-06],
          "6dcbeca4acd6f5fdfc16c40446290db1" => ~d[2023-06],
          "389dcd7d37df5354bf21e20e13007b84" => ~d[2022-05],
          "b5ddde0ec8f7dde1de5b114ad3fa80fc" => ~d[2021-07]
        },
        videos: [
          {"2024-06-20-14im-13gg/GX017820", "00:00:04.838", :end},
          {"2024-06-20-14im-13gg/GX017821", :start, :end},
          {"2024-06-20-14im-13gg/GX017822", "00:00:01.034", :end},
          {"2024-06-20-14im-13gg/GX017823", :start, :end},
          {"2024-06-20-14im-13gg/GX017824", :start, :end},
          {"2024-06-20-14im-13gg/GX017825", :start, :end},
          {"2024-06-20-14im-13gg/GX017826", :start, :end},
          {"2024-06-20-14im-13gg/GX017827", :start, :end},
          {"2024-06-20-14im-13gg/GX017828", :start, :end},
          {"2024-06-20-14im-13gg/GX017829", :start, "00:00:24.424"},
          {"2024-06-20-14im-13gg/GX017829", "00:00:26.627", :end},
          {"2024-06-20-14im-13gg/GX017830", :start, :end},
          {"2024-06-20-14im-13gg/GX017831", :start, :end},
          {"2024-06-20-14im-13gg/GX017832", :start, "00:00:30.664"},
          {"2024-06-20-14im-13gg/GX017832", "00:00:35.435", :end},
          {"2024-06-20-14im-13gg/GX017833", :start, :end},
          {"2024-06-20-14im-13gg/GX017834", :start, :end},
          {"2024-06-20-14im-13gg/GX017835", :start, :end},
          {"2024-06-20-14im-13gg/GX017836", :start, "00:01:25.185"},
          {"2024-06-20-14im-13gg/GX017836", "00:01:27.354", :end},
          {"2024-06-20-14im-13gg/GX017837", :start, "00:00:08.674"}
        ]
      }
    ]

  def links(_assigns) do
    [
      {"Detailseite der Stadt",
       "https://www.hamburg.de/verkehr/fahrradfahren-in-hamburg/426810/veloroute-13/"},
      {"Komoot Routenplaner: von Altona nach Borgfelde",
       "https://www.komoot.com/de-de/tour/225149264"},
      {"Route in der OpenStreetMap", "https://www.openstreetmap.org/relation/2238764"}
    ]
  end

  def text(assigns) do
    ~H"""
    <table class="routing">
      <tr>
        <td></td>
        <td rowspan="11" style="background-image: url(/images/route13.svg)">
          <.icon>13</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td>
          <.icon>FR9</.icon>
          <.icon>12</.icon>
          <.icon>1</.icon>
        </td>
        <td><.v bounds="9.908746,53.545425,9.971424,53.572528" lon={9.936885} lat={53.551477} dir="forward" ref="13">Altona</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>2</.icon>
        </td>
        <td><.v bounds="9.922015,53.558148,9.985174,53.589129" lon={9.957934} lat={53.570483} dir="forward" ref="13">Eimsbüttel</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR10</.icon>
          <.icon>3</.icon>
        </td>
        <td><.v bounds="9.958302,53.570385,9.987567,53.58825" lon={9.968577} lat={53.580408} dir="forward" ref="13">Hoheluft</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.v bounds="9.973481,53.577894,10.001225,53.594674" lon={9.991695} lat={53.588725} dir="forward" ref="13">Eppendorf</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR1</.icon>
          <.icon>4</.icon>
        </td>
        <td><.v bounds="9.977983,53.576811,10.024918,53.597336" lon={9.998228} lat={53.587997} dir="forward" ref="13">Winterhude</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR2</.icon>
        </td>
        <td><.v bounds="9.991957,53.576643,10.023977,53.591726" lon={10.010123} lat={53.583047} dir="forward" ref="13">Mühlenkamp</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR3</.icon>
          <.icon>5</.icon>
        </td>
        <td><.v bounds="10.018924,53.569386,10.049868,53.58425" lon={10.030236} lat={53.57584} dir="forward" ref="13">Barmbek-Süd</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>6</.icon>
        </td>
        <td><.v bounds="10.021466,53.564426,10.053918,53.579398" lon={10.039528} lat={53.571211} dir="forward" ref="13">Auenviertel</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>7</.icon>
        </td>
        <td><.v bounds="10.034972,53.557082,10.058224,53.571732" lon={10.043822} lat={53.568031} dir="forward" ref="13">Eilbek</.v></td>
      </tr>
      <tr>
        <td>
          <.icon>FR4</.icon>
          <.icon>8</.icon>
        </td>
        <td><.v bounds="10.030417,53.549632,10.06304,53.570118" lon={10.041338} lat={53.558788} dir="forward" ref="13">Borgfelde</.v></td>
      </tr>
    </table>

    <p>Die Alltagsroute 13 (auch: Veloroute 13 oder Radroute 13) führt in einem Halbkreis durch die Kernstadt. Die Route verläuft in grob 3km Abstand um die Außenalster.</p>

    <h4>Auffindbarkeit</h4>
    <p>Die Route ist nicht beschildert und nur mit Navi oder Ortskenntnis auffindbar. Da sich die Route selten an natürlichen Straßenverläufen orientiert, muss häufig unerwartet abgebogen werden.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Sie sind meist asphaltiert.</p>

    <h4>Meinung</h4>
    <p>In ihrer Funktion als Querverbindung zwischen Stadtteilen wird die Route gerecht. Bedingt durch ihre Form ist sie aber selten für längere Abschnitte relevant.</p>

    <p>Das ist auch gut so, denn die Route wird durch wild abgestellte KFZ geprägt, die die Verkehrssituation unübersichtlich machen. Gleichzeitig sind viele Ampeln nicht für den Radverkehr optimiert, sodass häufig lange gewartet werden muss. Durch das viele Abbiegen verliert man ebenfalls regelmäßig Geschwindigkeit. Zusammengenommen macht das die Route sowohl körperlich als auch geistig anstrengend.</p>

    <p>Negativbeispiel ist der <.v bounds="9.998774,53.577451,10.023648,53.589693" lon={10.010992} lat={53.582084} dir="forward" ref="13">Mühlenkamp</.v>, der zwar als „ausgebaut“ gilt, aber keine sicheren Radwege bietet. Sie verlaufen in der <.ref>Dooring-Zone</.ref> und werden häufig illegal zugestellt.</p>


    <h3>Externe Links</h3>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
