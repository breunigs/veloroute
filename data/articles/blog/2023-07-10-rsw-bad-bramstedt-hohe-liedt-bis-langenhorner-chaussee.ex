defmodule Data.Article.Blog.RswBadBramstedtHoheLiedtBisLangenhornerChaussee do
  use Article.Default

  def title(), do: "Langenhorner Chaussee – Hohe Liedt (Radschnellweg Bad Bramstedt, Veloroute 4)"

  def updated_at(), do: ~D[2024-11-18]

  def summary(),
    do:
      "3m – 4m breite Zweirichtungsradwege in Langenhorner Chaussee und Neubergerweg. Fibigerstraße wird Fahrradstraße mit Vorfahrt und engerer Fahrbahn."

  def type(), do: :planned

  def tags(), do: ["rsw-bad-bramstedt", "rsw", "n24", "4", "br-nord-n1"]

  @attrib [
    {"Bezirksamt Hamburg-Nord",
     "https://www.hamburg.de/politik-und-verwaltung/bezirke/hamburg-nord/wirtschaft-bauen-umwelt-70292"},
    {"MASUCH + OLBRISCH Ingenieurgesellschaft für das Bauwesen mbH",
     "https://moingenieure.de/kontakt/"}
  ]
  def map_image do
    [
      Data.MapImage.new(__MODULE__, @attrib, "01", {
        %{lat: 53.679505313, lon: 9.999835438},
        %{lat: 53.681578600, lon: 10.000787935},
        %{lat: 53.681445998, lon: 10.001606901},
        %{lat: 53.679372710, lon: 10.000654404}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "02", {
        %{lat: 53.679733926, lon: 10.000705656},
        %{lat: 53.676912865, lon: 10.001476767},
        %{lat: 53.676850555, lon: 10.000832083},
        %{lat: 53.679671616, lon: 10.000060972}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "03", {
        %{lat: 53.677106427, lon: 10.001048823},
        %{lat: 53.677752153, lon: 10.003735460},
        %{lat: 53.677395019, lon: 10.003980807},
        %{lat: 53.676749293, lon: 10.001294170}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "04", {
        %{lat: 53.677541472, lon: 10.003593900},
        %{lat: 53.676871203, lon: 10.007801667},
        %{lat: 53.676639177, lon: 10.007695786},
        %{lat: 53.677309446, lon: 10.003488020}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "05", {
        %{lat: 53.676871658, lon: 10.007803111},
        %{lat: 53.676203050, lon: 10.012015845},
        %{lat: 53.675827927, lon: 10.011846184},
        %{lat: 53.676496535, lon: 10.007633450}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "06", {
        %{lat: 53.676081157, lon: 10.011811947},
        %{lat: 53.675026029, lon: 10.014102765},
        %{lat: 53.674798432, lon: 10.013803862},
        %{lat: 53.675853560, lon: 10.011513044}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "07", {
        %{lat: 53.675022571, lon: 10.014099914},
        %{lat: 53.673964851, lon: 10.016384783},
        %{lat: 53.673690029, lon: 10.016022335},
        %{lat: 53.674747749, lon: 10.013737466}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "08", {
        %{lat: 53.673977824, lon: 10.016298930},
        %{lat: 53.672284715, lon: 10.016812353},
        %{lat: 53.672217968, lon: 10.016187998},
        %{lat: 53.673911077, lon: 10.015674576}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "09", {
        %{lat: 53.672285179, lon: 10.016812154},
        %{lat: 53.670160138, lon: 10.017457752},
        %{lat: 53.670074186, lon: 10.016655403},
        %{lat: 53.672199227, lon: 10.016009805}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "10", {
        %{lat: 53.668964950, lon: 10.016389334},
        %{lat: 53.670357020, lon: 10.016450573},
        %{lat: 53.670345298, lon: 10.017067682},
        %{lat: 53.668953229, lon: 10.017006442}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "11", {
        %{lat: 53.669016063, lon: 10.015784591},
        %{lat: 53.669744123, lon: 10.020460797},
        %{lat: 53.669159326, lon: 10.020721473},
        %{lat: 53.668431266, lon: 10.016045267}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "12", {
        %{lat: 53.669576675, lon: 10.020539762},
        %{lat: 53.670012688, lon: 10.023354688},
        %{lat: 53.669695634, lon: 10.023495245},
        %{lat: 53.669259622, lon: 10.020680319}
      }),
      Data.MapImage.new(__MODULE__, @attrib, "13", {
        %{lat: 53.670102906, lon: 10.023246019},
        %{lat: 53.669773003, lon: 10.025847519},
        %{lat: 53.669383834, lon: 10.025706509},
        %{lat: 53.669713737, lon: 10.023105009}
      })
    ]
  end

  def links(_assigns) do
    [
      {"2. Entwurf", ~d[2024-11],
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1014545"},
      {"1. Entwurf", "Juli 2023",
       "https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1013034"},
      {"Detailbetrachtung Routenverlauf", "Juli 2023",
       "https://www.hamburg.de/hamburg-nord/planen-bauen-wohnen/17015804/vorzugstrasse-radschnellweg/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand November 2024</h4>
    <p>Der zweite Entwurf wurde vorgestellt. Größte Änderungen zum ersten Entwurf:</p>
    <ul>
      <li><.v bounds="10.015491,53.668022,10.021545,53.669963" lon={10.019157} lat={53.669252} dir="forward" ref="4">Neubergerweg</.v>: beidseitige einfache Hochbordradwege statt Zweirichtungsradweg</li>
      <li>Neu: Kreisverkehr <.v bounds="10.015236,53.667644,10.019606,53.670434" lon={10.01734} lat={53.668939} dir="forward" ref="4">Fibigerstraße/Neubergerweg</.v></li>
      <li><.v bounds="9.999275,53.677415,10.002879,53.683146" lon={10.000602} lat={53.679238} dir="forward" ref="4">Langenhorner Chaussee</.v>: Zweirichtungsradweg Richtung beginnt erst ab Einmündung Bärenhof</li>
    </ul>

    <h4>Alter Zustand</h4>
    <p>Die <.ref>Hochbordradwege</.ref> im <.v bounds="10.015687,53.668256,10.021982,53.670465" lon={10.018514} lat={53.669128} dir="backward" ref="4">Neubergerweg</.v> sind schmal, heruntergekommen und damit kaum befahrbar. In der <.v bounds="9.999254,53.668028,10.021792,53.67794" lon={10.012415} lat={53.675545} dir="backward" ref="4">Fibigerstraße</.v> fährt man im <.ref>Mischverkehr</.ref> mit den Autos. Am Straßenrand abgestellte Autos verhindern bei Gegenverkehr ein flüssiges Vorankommen. In der <.v bounds="9.998495,53.676334,10.004074,53.681774" lon={10.000533} lat={53.678482} dir="backward" ref="4">Langenhorner Chaussee</.v> gibt es eigene Radwege im Hochbord oder als <.ref>Radfahrstreifen</.ref>. Vorfahrt entlang des Radschnellweges gibt es bisher nicht.</p>

    <.h4_planning ref={@ref} checked={@show_map_image}>Planung (2. Entwurf, 2024)</.h4_planning>
    <p>In der <.v bounds="10.01926,53.668602,10.026237,53.670377" lon={10.020516} lat={53.6694} dir="backward" ref="4" highlight="Hohe Liedt">Hohen Liedt</.v> entsteht Richtung Osten ein 1,6 bis 2,0m breiter Hochbordradweg. In der Gegenrichtung ist zunächst kein eigener Radweg geplant. Es soll vorwiegend auf der <.ref>Fahrbahn</.ref> im <.ref>Mischverkehr</.ref> gefahren werden. Zusätzlich ist der Gehweg im Schritttempo freigegeben (<.ref>Fahrrad frei</.ref>). Ab <.m bounds="10.021498,53.669359,10.02509,53.670027">der Grünfläche</.m> beginnt ein 1,35m breiter Hochbordradweg, der nochmal unterbrochen wird.</p>

    <p>Im <.v bounds="10.015963,53.668257,10.020883,53.669871" lon={10.01845} lat={53.669132} dir="forward" ref="4">Neubergerweg</.v> werden beidseitig je 2,5m breite Hochbordradwege gebaut. Stellenweise wird der südliche Radweg etwas schmaler.</p>

    <p>Die <.v bounds="10.015236,53.667644,10.019606,53.670434" lon={10.01734} lat={53.668939} dir="forward" ref="4" highlight="Fibigerstraße,Neubergerweg">Einmündung Fibigerstraße in den Neubergerweg</.v> wird zu einem Kreisverkehr umgebaut. Der Radverkehr wird vorher jeweils mittels Rampen von den Hochbordradwegen abgeleitet. Wer vom Neuerbergweg geradeaus weiter zur Hohen Liedt möchte, kann auf einem Bypass den Kreisel umfahren. </p>

    <p>Die <.v bounds="9.99973,53.667505,10.018366,53.678003" lon={10.013185} lat={53.675166} dir="forward" ref="4">Fibigerstraße</.v> soll Fahrradstraße werden und durchgängig Vorfahrt erhalten. Die Fahrbahn wird enger gestaltet. Im <.v bounds="10.014386,53.667839,10.018946,53.675062" lon={10.016148} lat={53.67318} dir="forward" ref="4">bereits umgebauten, südlichen Teil</.v> durch Markierungen; im <.v bounds="9.999567,53.672914,10.016873,53.678152" lon={10.007892} lat={53.676699} dir="forward" ref="4">nördlichen Teil</.v> werden die Randsteine versetzt. Teilweise werden bauliche Parkplätze für KFZ errichtet, da auf der Fahrbahn nicht mehr geparkt werden kann.</p>

    <p>In der <.v bounds="9.998013,53.675697,10.006061,53.68208" lon={10.000362} lat={53.679032} dir="forward" ref="4">Langenhorner Chaussee</.v> werden die vorhandenen Radwege verbreitert.<br>
    <em>Richtung Norderstedt</em> ist zunächst ein 2,5m <.ref>Hochbordradweg</.ref> vorgesehen, danach ein 2,5m breiter <.ref>Radfahrstreifen</.ref>. Am <.v bounds="9.998992,53.67917,10.001479,53.680692" lon={10.000535} lat={53.679805} dir="forward" ref="4">Bärenhof</.v> wechselt die Radroute Plus die Straßenseite. Dort schließt ein 4,0m breiter Zweirichtungsradweg an, der sich vor der <.m bounds="9.999923,53.680408,10.00209,53.682146">Landesgrenze</.m> auf 3,0m verengt.<br>
    <em>Richtung Ochsenzoll</em> kommt man vom beschriebenen Zweirichtungsradweg. Ab <.v bounds="9.999603,53.677669,10.001474,53.680518" lon={10.000276} lat={53.679867} dir="backward" ref="4">Bärenhof</.v> geht dieser in einen 3,0m breiten Hochbordradweg über.</p>

    <p>Zwischen der <.v bounds="10.00005,53.676586,10.002521,53.678305" lon={10.001014} lat={53.677494} dir="backward" ref="4" highlight="Fibigerstraße">Haltestelle Ochsenzoll und der Fibigerstraße</.v> soll nicht umgebaut werden. Dieser Abschnitt ist in einem <.a name="2020-06-16-ampel-ochsenzoll">älteren Artikel</.a> näher beschrieben.</p>

    <h4>Machbarkeitsstudie (2021)</h4>
    <p>Ursprünglich war vorgesehen, den Radschnellweg länger entlang der U-Bahn verlaufen zu lassen und ihn am <.v bounds="9.998635,53.674269,10.017451,53.680618" lon={10.012309} lat={53.6777} dir="backward" ref="rsw-bad-bramstedt">Foßberger Moor</.v> in den Straßenverkehr zu überführen. In der Detailbetrachtung entschied man sich für die oben beschriebene Führung, weil diese kürzer, billiger und mit weniger KFZ belastet ist.</p>

    <h4>Meinung</h4>
    <p>Die Planung ist akzeptabel, bietet aber nicht die gleiche Qualität wie die in der Machbarkeitsstudie vorgeschlagene Strecke. In der Fibigerstraße ließe sich diese steigern, wenn man den Autoverkehr weiter reduziert. Etwa mittels Diagonaltrenner oder KFZ-Einbahnstraßen.</p>

    <p>Rund um die <.v bounds="9.999925,53.677085,10.001753,53.679082" lon={10.000949} lat={53.677884} dir="forward" ref="4">Haltestelle Ochsenzoll</.v> ist wegen der vielen Fußgänger kein hochwertiger Radschnellweg möglich. Dass man die Fußwege stellenweise sogar enger macht als heute ist unverständlich und kurzsichtig.</p>

    <p>Hinzu kommen viele Kleinigkeiten:</p>
    <ul>
      <li>Der Radschnellweg sollte an unwichtigen Nebenstraßen (<.v bounds="9.999497,53.679067,10.001753,53.680304" lon={10.000278} lat={53.679917} dir="backward" ref="4">Bärenhof</.v>, <.v bounds="10.017374,53.668812,10.019946,53.670278" lon={10.018983} lat={53.669225} dir="forward" ref="4">Meyer-Delius-Platz</.v>) durchgängig sein. Zur Unfallverhütung sollten Sinus-Randsteine das Langsamfahren des kreuzenden Verkehrs erzwingen.</li>
      <li>Die Anbindung <.v bounds="9.999729,53.676131,10.002604,53.678705" lon={10.000654} lat={53.677941} dir="backward" ref="4">vom Ochsenzoll Richtung Fibigerstraße</.v> sollte überarbeitet werden. Drei 90° Kurven sind ungeeignet.</li>
      <li>Der <.v bounds="9.999315,53.677397,10.002121,53.68032" lon={10.000545} lat={53.679735} dir="forward" ref="4">Radfahrstreifen in der Langenhorner Chaussee</.v> sollte durch extra Bordsteine vom Autoverkehr abgetrennt werden (<.ref>Protected-Bike-Lane</.ref>).</li>
    </ul>

    <p>In der <.v bounds="10.018824,53.668311,10.026029,53.670796" lon={10.020362} lat={53.669387} dir="backward" ref="4" highlight="Hohe Liedt">Hohen Liedt</.v> ist die Südseite gut. Die Nordseite mit Gehwegradeln und Fake-Radweg ist dagegen grauenhaft. Man sollte lieber das Radeln auf der Fahrbahn angenehm und sicher machen, statt an dieser Nicht-Lösung festzuhalten.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
