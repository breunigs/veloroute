defmodule Data.Article.Blog.VerstetigungPublHafencity do
  use Article.Default
  def created_at(), do: ~D[2022-08-05]
  def title(), do: "Verstetigung Versuchsradweg in der Hafencity"

  def summary(),
    do:
      "Bisheriger Versuchsradweg bleibt dauerhaft, Änderungen nur im Detail: Roteinfärbung an Kreuzungen, teils breiter, einige Trennelemente zu KFZ, Linksabbiegespuren."

  def type(), do: :finished
  def tags(), do: ["1GR"]

  def start(), do: ~d[2023-03-12]
  def stop(), do: ~d[2023-03-24]

  def links(_assigns) do
    [
      {"Baustelleninfo", "März 2023",
       "https://web.archive.org/web/20230411015754if_/https://lsbg.hamburg.de/resource/blob/664710/1241d0f85b83eea6048c34429952db18/am-sandtorkai-brooktorkai-pop-up-bikelane-anliegerinformation-maerz-2023-data.pdf"},
      {"Erläuterungsbericht", "August 2022",
       "https://lsbg.hamburg.de/resource/blob/784082/d82b462f3347d710b8f0cdee89a034af/am-sandtorkai-brooktorkai-pop-up-bikelane-verstetigung-abgestimmte-planung-bericht-data.pdf"},
      {"Lageplan", "August 2022",
       "https://lsbg.hamburg.de/resource/blob/784084/6a06328b36b0de140d75baac9165f8f7/am-sandtorkai-brooktorkai-pop-up-bikelane-verstetigung-abgestimmte-planung-plan-data.pdf"},
      {"Pressemitteilung zur Verstetigung", "April 2022",
       "https://www.hamburg.de/bvm/medien/16117218/2022-03-30-bvm-pop-up-lane/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Seit Frühjahr 2021 wurde entlang des Straßenzugs Sandtorkai/Brooktorkai ein Versuchsradweg (auch Pop-Up Bike Lane genannt) eingerichtet. In Richtung Westen wurde ab der <.v bounds="10.002357,53.545644,10.005226,53.547206" lon={10.00411} lat={53.546764} dir="forward" ref="1GR">Oberbaumbrücke</.v> eine KFZ-Spur zu einem <.ref>Radfahrstreifen</.ref> umdeklariert. Dieser endete auf der <.v bounds="9.980711,53.542714,9.984325,53.544812" lon={9.983275} lat={53.543716} dir="forward" ref="1GR">Niederbaumbrücke</.v>. In der Gegenrichtung ist schon Höhe <.v bounds="9.98522,53.542193,9.987988,53.543638" lon={9.986827} lat={53.542805} dir="backward" ref="1GR">Kehrwiedersteg</.v> Schluss. An vielen Stellen wird der Radfahrstreifen durch Bushaltestellen unterbrochen.</p>

    <h4>Planung</h4>
    <p>Der Verkehrsversuch war erfolgreich und der Radfahrstreifen soll verstetigt werden. Im Vergleich zu heute ergeben sich folgende Änderungen:</p>

    <ul>
      <li>Radfahrstreifen wird schon auf der <.v bounds="9.980547,53.543031,9.984079,53.544359" lon={9.982379} lat={53.543769} dir="backward" ref="1GR">Niederbaumbrücke</.v> breiter.</li>
      <li><.m bounds="9.994361,53.542682,9.996479,53.543853">Am Sandtorpark</.m> und in der <.m bounds="10.000245,53.54404,10.002328,53.545518">Shanghaiallee</.m> werden Linksabbiege-Spuren in <.ref>Mittellage</.ref> eingerichtet.</li>
      <li>An der Einmündung <.v bounds="9.98925,53.54262,9.99131,53.543778" lon={9.990316} lat={53.54318} dir="forward" ref="1GR">Auf dem Sande</.v> wird der Radfahrstreifen durchgängig; die KFZ-Rechtsabbiege-Spur entfällt.</li>
      <li>Radfurten an Einmündungen und Kreuzungen werden rot markiert. Ausnahme: <.v bounds="9.996705,53.543219,9.99926,53.545008" lon={9.997979} lat={53.544293} dir="forward" ref="1GR">Kreuzung mit St. Annen/Osakaallee</.v>, die erst später markiert werden soll. Dort werden auch Aufstelltaschen zum <.ref>indirekten Linksabbiegen</.ref> ergänzt.</li>
      <li>Auf kurzen Abschnitten werden Trennelemente zum KFZ-Verkehr angebracht: jeweils vor der Kreuzung St. Annen/Osakaallee in <.v bounds="9.996758,53.543458,9.999555,53.545212" lon={9.99807} lat={53.544335} dir="forward" ref="1GR">Fahrtrichtung West</.v> und <.v bounds="9.996758,53.543458,9.999555,53.545212" lon={9.997615} lat={53.544325} dir="forward" ref="10">Fahrtrichtung Süd</.v>. Auf der <.v bounds="9.982208,53.542403,9.984777,53.543891" lon={9.983811} lat={53.543004} dir="forward" ref="1GR">Wilhelminenbrücke</.v>, allerdings nur in Richtung Baumwall.</li>
      <li>Man versucht mit Pfeilen auf dem südlichen <.ref>Hochbordradweg</.ref> das Geisterradeln zu reduzieren.</li>
    </ul>

    <h4>Meinung</h4>
    <p>Die Verstetigung ist zu begrüßen. Das man aus Kostengründen auf einen Vollumbau verzichtet ist verständlich. Dennoch wäre in vielen Abschnitten eine bessere Trennung vom KFZ-Verkehr möglich gewesen.</p>

    <p>Auch die gefährlichen Überleitungen an der <.v bounds="10.002357,53.545644,10.005226,53.547206" lon={10.00411} lat={53.546764} dir="forward" ref="1GR">Oberbaumbrücke</.v> und am <.v bounds="9.98522,53.542193,9.987988,53.543638" lon={9.986827} lat={53.542805} dir="backward" ref="1GR">Kehrwiedersteg</.v> bleiben. Die Probleme des <.v bounds="9.989819,53.542514,9.993633,53.543784" lon={9.991414} lat={53.543039} dir="backward" ref="1GR">unterdimensionierten Fußwegs</.v> ignoriert man ebenfalls.</p>

    <p>Insgesamt eine gute Sache, ein Aushängeschild wird diese Zwischenlösung aber nicht.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
