defmodule Data.Article.Static.Radroute14 do
  use Article.Static

  def route_group(), do: :radroute
  def id(), do: "radroute-14"
  def display_id(), do: "14"
  def title(), do: "Radroute 14"
  def color(), do: RouteColors.green2()

  def summary(), do: "Die Radroute verbindet den Altonaer Balkon mit der Außenalster am Fährdamm."

  def tags(), do: [id()]

  def tracks(),
    do: [
      %Video.Track{
        renderer: 6,
        group: "14",
        direction: :forward,
        from: "Altonaer Balkon",
        to: "Fährdamm",
        parent_ref: __MODULE__,
        text: "vom Altonaer Balkon zum Alstervorland",
        historic: %{
          "fd316c8ee8c0feefb66a0ce53460c073" => ~d[2025-02]
        },
        videos: [
          {"2025-02-10-innenstadt/GX018015", :start, "00:00:02.754"},
          {"2025-02-06-whburg/GX017911", "00:00:02.860", :end},
          {"2025-02-06-whburg/GX017912", :start, "00:00:08.527"},
          {"2025-02-06-whburg/GX017913", "00:00:00.033", "00:00:17.000"},
          {"2025-02-06-whburg/GX017913", "00:00:21.720", "00:00:40.820"},
          {"2025-02-06-whburg/GX017914", :start, "00:00:00.467"},
          {"2025-02-10-innenstadt/GX017993", :start, :end},
          {"2025-02-10-innenstadt/GX017994", :start, :end},
          {"2025-02-10-innenstadt/GX017995", :start, :end},
          {"2025-02-10-innenstadt/GX017996", :start, :end},
          {"2025-02-10-innenstadt/GX017997", :start, "00:00:11.445"}
        ]
      },
      %Video.Track{
        renderer: 6,
        group: "14",
        direction: :backward,
        from: "Fährdamm",
        to: "Altonaer Balkon",
        parent_ref: __MODULE__,
        text: "vom Alstervorland zum Altonaer Balkon",
        historic: %{
          "8191ae0430e7d7ed7187931f0c018fa8" => ~d[2025-02]
        },
        videos: [
          {"2025-02-10-innenstadt/GX018002", "00:02:37.457", "00:02:52.741"},
          {"2025-02-10-innenstadt/GX018003", :start, :end},
          {"2025-02-10-innenstadt/GX018004", :start, "00:00:15.434"},
          {"2025-02-10-innenstadt/GX018005", :start, "00:00:09.787"},
          {"2025-02-10-innenstadt/GX018006", :start, :end},
          {"2025-02-10-innenstadt/GX018007", :start, :end},
          {"2025-02-10-innenstadt/GX018008", :start, :end},
          {"2025-02-10-innenstadt/GX018009", :start, :end},
          {"2025-02-10-innenstadt/GX018010", :start, :end},
          {"2025-02-10-innenstadt/GX018011", :start, :end},
          {"2025-02-10-innenstadt/GX018012", :start, :end},
          {"2025-02-10-innenstadt/GX018013", :start, "00:00:12.279"}
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
          <.icon>radroute-14</.icon>
        </td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:straight} ref={@ref}/></td>
        <td><.v bounds="9.915341,53.541753,9.952843,53.547672" lon={9.9363} lat={53.546423} dir="forward" ref={@ref}>Altonaer Balkon</.v></td>
      </tr>
      <tr>
        <td><.icon>radroute-12</.icon><.icon>radroute-7</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.932127,53.542966,9.960277,53.558074" lon={9.937363} lat={53.5525} dir="forward" ref={@ref}>Altona-Altstadt</.v></td>
      </tr>
      <tr>
        <td></td>
        <td><.graph icon={:underpass} ref={@ref}/></td>
        <td class="dim"><.v bounds="9.950676,53.557768,9.96322,53.565972" lon={9.954628} lat={53.560976} dir="forward" ref={@ref} highlight="Sternbrücke">Sternbrücke (Bahn)</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-sued</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.950712,53.559578,9.981243,53.575435" lon={9.964453} lat={53.564843} dir="forward" ref={@ref}>Sternschanze</.v></td>
      </tr>
      <tr>
        <td><.icon>br-eimsbuettel-rotherbaum</.icon><.icon>radroute-3</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.96772,53.564474,9.996525,53.579081" lon={9.980235} lat={53.572419} dir="forward" ref={@ref}>Harvestehude / Rotherbaum</.v></td>
      </tr>
      <tr>
        <td><.icon>FR1</.icon><.icon>radroute-4</.icon></td>
        <td><.graph icon={:fork} ref={@ref}/></td>
        <td><.v bounds="9.995769,53.565999,10.00638,53.580131" lon={9.99874} lat={53.573198} dir="forward" ref={@ref}>Alstervorland</.v></td>
      </tr>
    </table>

    <p>Die Route verläuft diagonal (Südwest ↔ Nordost) vom <.v bounds="9.915341,53.541753,9.952843,53.547672" lon={9.9363} lat={53.546423} dir="forward" ref={@ref}>Altonaer Balkon</.v> bis zum <.v bounds="9.995769,53.565999,10.00638,53.580131" lon={9.99874} lat={53.573198} dir="forward" ref={@ref}>Alstervorland</.v>. Sie stellt damit eine Querverbindung in den zentrumsnahen, westlichen Stadtteilen her. Sie verläuft fast parallel zur <.a name="radroute-16">Radroute 16</.a>, die ein paar Blöcke weiter nördlich liegt.</p>

    <.roaddiagram src="radroute-14-wegweiser" width={115} alt="Zwischenwegweiser für Radroute 14" class="right"/>
    <h4>Auffindbarkeit</h4>
    <p>Die Route ist teilweise beschildert (<.a href="https://veloroute.hamburg/crowdsourcing/upload" rel="nofollow">Wo genau? Hilf mit!</.a>). Da man immer auf dem selben Straßenzug bleibt und nie abbiegen muss, kann man ihr aber auch ohne Schilder gut folgen.</p>

    <h4>Befahrbarkeit</h4>
    <p>Alle Wege sind befestigt und allwettertauglich. Meist asphaltiert, teils gepflastert und nur an einer Bushaltestelle über Kopfsteinpflaster.</p>

    <h4>Meinung</h4>
    <p>Die Route ist mittlerweile zu großen Teilen ausgebaut und bietet oft eigene Radwege an. Leider sind diese nur selten durch Bordsteine o.ä. vom Autoverkehr getrennt. Auch die Ampelschaltung ist für den Radverkehr häufig eine rote Welle – das sollte noch verbessert werden. Insgesamt kommt man gut und entspannt voran.</p>

    <p>Am problematischsten sind die Ausbaulücken um die <.v bounds="9.950676,53.557768,9.96322,53.565972" lon={9.954628} lat={53.560976} dir="forward" highlight="Sternbrücke" ref={@ref}>Sternbrücke (Bahn)</.v> und in der <.v bounds="9.988014,53.571254,9.996325,53.573803" lon={9.991883} lat={53.572702} dir="forward" ref={@ref}>Hallerstraße</.v>, da man hier ohne sinnige Überleitung in den KFZ-Verkehr geworfen wird.</p>

    <p>Dafür entsteht in der <.v bounds="9.933539,53.547932,9.954189,53.561884" lon={9.940122} lat={53.554105} dir="forward" ref={@ref}>Max-Brauer-Allee</.v> (Stand: Anfang 2025) eine zukunftsweisende Lösung. Sie zeigt, dass mit Engagement von Planungsbüro und Bevölkerung eine gute Kompromisslösung gefunden werden kann, die allen Verkehrsarten genügt, ohne dass eine hässliche Brachfläche entsteht. Bitte mehr davon!</p>

    <h4>Externe Links</h4>
    <.structured_links ref={@ref} gpx={true}/>
    """
  end
end
