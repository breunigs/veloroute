defmodule Data.Article.Blog.SaarlandstrasseNord do
  use Article.Default

  def created_at(), do: ~D[2022-05-25]

  def title(), do: "Saarlandstraße (nördlicher Teil, Alltagsroute 5N)"

  def summary(),
    do:
      "Mischverkehr beim Stadtpark; Protected-Bike-Lane U-Bahn ↔ Hellbrookstraße; sonst 2m breite Hochbordradwege"

  def type(), do: :planned

  def tags(), do: ["5N", "5"]

  def links(_assigns) do
    [
      {"Lageplan", "1. Entwurf, 2022",
       "https://lsbg.hamburg.de/resource/blob/634612/d4e53afad51dfef41055083a3dfe4580/saarlandstrasse-jahnring-bis-u-saarlandstrasse-abstimmungsunterlage-plan-data.pdf"},
      {"Erläuterungsbericht", "1. Entwurf, 2022",
       "https://lsbg.hamburg.de/resource/blob/634610/6ba28bd17dad8705339d75c2e88ef300/saarlandstrasse-jahnring-bis-u-saarlandstrasse-abstimmungsunterlage-bericht-data.pdf"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Auf der östlichen Seite gibt es ausschließlich <.ref>Hochbordradwege</.ref>, die stellenweise schmaler als ein normales Fahrrad sind.</p>

    <p>Auf der Seite des Stadtparks fährt der Radverkehr ebenfalls meist über Hochbordradwege. Ausnahme ist ein <.a name="2019-12-16-freilichtbuehne-saarlandstrasse">bereits sanierter Abschnitt im Norden</.a>. Dort wird man auch teilweise durch den KFZ-Parkplatz im <.ref>Mischverkehr</.ref> geführt.</p>

    <h4>Planung – Ostseite</h4>
    <p>Unter der <.v bounds="10.031917,53.58829,10.034429,53.5915" lon={10.033382} lat={53.588995} dir="forward" ref="5">Bahnbrücke</.v> bis zur <.v bounds="10.031917,53.58829,10.034429,53.5915" lon={10.033033} lat={53.590672} dir="forward" ref="5">Hellbrookstraße</.v> soll eine 2,0m breite <.ref>Protected-Bike-Lane</.ref> entstehen. Ab dort wird der bestehende Hochbordradweg auf 2,0m verbreitert. Der Platz kommt von den KFZ-Fahrspuren und den Fußwegen, die jeweils etwas schmaler werden. Der Grünstreifen verschiebt sich dadurch leicht in Richtung Stadtpark.</p>

    <h4>Planung – Stadtpark-Seite</h4>
    <p>Auf Stadtparkseite setzt man das Prinzip des bereits sanierten Abschnitts fort und führt den Radverkehr im Bereich der KFZ-Parkplätze im Mischverkehr. Außerhalb dieser Stellen werden die vorhandenen Hochbordradwege auf rund 2,00m verbreitert.</p>

    <p>Im Bereich der Einmündung <.v bounds="10.029996,53.594193,10.034084,53.597878" lon={10.031112} lat={53.596564} dir="backward" ref="5">Alte Wöhr</.v> wird der Radverkehr ohne Abtrennung neben den KFZ-Spuren geführt. Die Ausfahrt ist so gestaltet, das sowohl KFZ-Spuren als auch der Radfahrstreifen erreicht werden können. Je nach genauer Aufstellung können wartende KFZ die Weiterfahrt mit dem Fahrrad verhindern.</p>

    <p>An den Einmündungen des <.v bounds="10.030867,53.590678,10.034133,53.594416" lon={10.0318} lat={53.593647} dir="backward" ref="5">Südring</.v> wird der Radweg jeweils auf Fahrbahnniveau auf- bzw. abgeleitet. Im Kreuzungsbereich mit der <.v bounds="10.031094,53.589468,10.035345,53.593052" lon={10.032572} lat={53.591129} dir="backward" ref="5">Hellbrookstraße</.v> wird der Radverkehr wieder ohne Abtrennung neben den KFZ-Spuren geführt. Erst im Anschluss beginnt eine rund 2,0m breite <.ref>Protected-Bike-Lane</.ref>. Diese mündet unter der <.v bounds="10.032044,53.588242,10.034221,53.589965" lon={10.033392} lat={53.588896} dir="backward" ref="5">Bahnbrücke</.v> in einer Bushaltestelle.</p>

    <h4>Meinung</h4>
    <p>Die Ostseite ist größtenteils in Ordnung. Kritikwürdig ist die Engstelle des Fußwegs <.v bounds="10.029911,53.597998,10.03326,53.600027" lon={10.031446} lat={53.59922} dir="forward" ref="5">im Kurvenbereich</.v>, die nur notwendig ist damit auch LKW möglichst hohe Geschwindigkeiten erreichen können.</p>

    <p>Die Parkseite lässt zu wünschen übrig. Die Führung durch die Parkplätze im <.ref>Mischverkehr</.ref> ist für den Radverkehr unattraktiv. Hinzu kommen fragwürdige Detailentscheidungen:</p>
    <ul>
      <li>Die <.v bounds="10.029644,53.598003,10.033024,53.600148" lon={10.030987} lat={53.599544} dir="backward" ref="5">enge 90° Kurve</.v> aus Richtung Pergolenviertel bleibt. Eine breitere Auffahrt würde bequemeres Abbiegen ermöglichen.</li>
      <li>Die <.v bounds="10.02997,53.597407,10.032435,53.599404" lon={10.031136} lat={53.598449} dir="backward" ref="5">Einfahrt zum Parkplatz</.v> stellt nicht sicher, dass KFZ die Vorfahrt des Radverkehrs beachten. Dies sollte durch enge Kurven und ggf. Bodenschwellen sichergestellt werden.</li>
      <li>Die Ausfahrt auf Höhe <.v bounds="10.029996,53.594193,10.034084,53.597878" lon={10.031112} lat={53.596564} dir="backward" ref="5">Alte Wöhr</.v> lenkt den Verkehr aus dem KFZ-Parkplatz auf den Radfahrstreifen. Das wird zu Missverständnissen und Behinderungen führen.</li>
      <li>Der Radverkehr muss hier künftig die Autoampel beachten. Je nach Schaltung bedeutet das lange Standzeiten für's Rad oder kürzere Grünzeiten für zu Fuß. Ein abgesetzter Radweg mit Zebrastreifen wäre der bessere Ansatz.</li>
      <li>Die Führung für die Wegbeziehung Alte Wöhr ↔ Stadtpark fehlt komplett.</li>
      <li>Bei der Einfahrt zum zweiten Parkplatz bestehen die gleichen Probleme wie bei der Ersten. Da der ungesicherte Radfahrstreifen geschnitten werden kann, werden diese sogar noch verschärft.</li>
      <li>Zwischen <.v bounds="10.030656,53.593009,10.032894,53.594728" lon={10.031662} lat={53.59399} dir="backward" ref="5">Ende zweiter Parkplatz</.v> und Einmündung <.v bounds="10.03148,53.589935,10.034645,53.592023" lon={10.032582} lat={53.591048} dir="backward" ref="5">Hellbrooksstraße</.v> ist eine Huckelpiste geplant, da der Radweg dauernd mittels Rampen auf die Höhe des Asphalts gebracht werden muss. Entweder sollte der Hochbordradweg durchgängig werden, oder die Protected-Bike-Lane bereits früher anfangen. Das ist nicht allein dem Planungsbüro anzulasten, da der Bezirk die Autodominanz an der <.v bounds="10.031727,53.591228,10.033629,53.592499" lon={10.032406} lat={53.591718} dir="backward" ref="5">Stadthallenbrücke</.v> erhalten möchte.</li>
      <li>An der Einmündung <.v bounds="10.031891,53.589952,10.03442,53.591428" lon={10.032591} lat={53.590982} dir="backward" ref="5">Hellbrookstraße</.v> sollte die Protected-Bike-Lane in den Kreuzungsbereich erweitert werden.</li>
      <li>Die <.v bounds="10.032044,53.588242,10.034221,53.589965" lon={10.033392} lat={53.588896} dir="backward" ref="5">Bushaltestelle unter der Bahnbrücke</.v> ist unglücklich, weil der Radverkehr bei einem wartenden Bus in den KFZ-Verkehr ausweichen muss. Aktuell ist dort kein regelmäßiger Busverkehr vorgesehen, was die Situation akzeptabel macht – solange es dort keine Falschparker gibt.</li>
    </ul>

    <p>Die Planung ist nicht zukunftsweisend. Auch beim Vergleich mit anderen Streckenabschnitten sticht die Planung nicht positiv heraus.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
