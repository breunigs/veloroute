defmodule Data.Article.Blog.Veloroute8Bewertung do
  use Article.Default

  def created_at(), do: ~D[2018-09-06]

  def title(), do: "Bewertung der Veloroute 8 Herbst 2018"

  def type(), do: nil

  def tags(), do: ["8"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Route beginnt mühsam: Im Bereich des <.m bounds="10.008388,53.552415,10.008388,53.552415">Hauptbahnhof</.m> bzw. <.m bounds="10.010535,53.552068,10.010535,53.552068">ZOB</.m> muss man ständig mit Zufußgehenden auf dem Radweg rechnen, an schnell und sicher vorankommen ist nicht zu denken. Im Anschluss wähnt man sich aber in einer echten Fahrradstadt: gute Beläge, gerade Führung, eigene Ampeln und auch genug Platz. Ab dem <.m bounds="10.020223,53.552451,10.026742,53.557295">Berliner Tor</.m> führt die Route sogar mitten durchs Grüne. Auch wurde kürzlich der Knotenpunkt an der <.m bounds="9.980501,53.46337,10.088009,53.590145">U-Horner Rennbahn</.m> umgebaut und zeigt wie sinnvolle Radwege aussehen. Dieses Teilstück ist meines Erachtens eines der besten der Alltagsrouten.</p>
    <p>Die Radfahrspuren in der <.m bounds="10.084069,53.542042,10.096701,53.553811">Washingtonallee</.m> sind immer noch gut, obwohl viele KFZ die Sicherheitsstreifen nicht verstehen und deswegen zu nah am Radweg parken. Erst ab der <.m bounds="10.095824,53.533317,10.115376,53.542481">Billstedter Hauptstraße</.m> nimmt die Qualität merklich ab: nicht immer ist die Führung ersichtlich, oft sind die Wege zu schmal und in Konflikt mit Zufußgehenden. Unebene Beläge senken den Fahrtkomfort.</p>
    <p>Folgt man der Route Richtung <.m bounds="10.130434,53.528104,10.150129,53.530305">Mümmelmannsberg</.m>, bleibt die Qualität auch weiterhin mangelhaft: die Radwege wurden offenbar Jahrzehnte nicht gepflegt, sodass sie in Sachen Bequemlichkeit mit Kopfsteinpflaster konkurrieren. Wo keine baulichen Radwege sind, teilt man sich den Platz im Mischverkehr bei 50 km/h.</p>
    <p>Auf dem anderen Ast Richtung <.m bounds="10.205741,53.489657,10.207563,53.490361">Bergedorf</.m> ist es besser: weite Strecken sind auf eigenen Wegen oder Nebenstraßen geführt, die Belagsqualität insgesamt ordentlich. Der Zweirichtungsradweg in der <.m bounds="10.177159,53.494537,10.206479,53.508947">Lohbrügger Landstraße</.m> ist etwas schmal, gerade wenn es bergauf geht. Die Innenstadt Bergedorf ist durchwachsen: hier und da gibt es noch alte Führungen mit engen Kurvenradien und Zufußgehendeampeln. An anderen Stellen darf man sich dagegen aussuchen, ob man lieber auf der Straße oder dem Hochbordradweg fährt und erhält für beide Fälle eine sichere Aufleitung – gut! (<.m bounds="10.208215,53.49182,10.212756,53.493502">Wilhelm-Bergner-Straße</.m>).</p>
    <p>Bis einschließlich <.m bounds="9.808497,53.545403,10.088918,53.642738">Horn</.m> ist Veloroute 8 eine klare Empfehlung. Wer vom <.m bounds="10.130434,53.528104,10.150129,53.530305">Mümmelmannsberg</.m> kommt, wird am Anfang aber definitiv keinen Spaß haben. Von <.m bounds="10.205741,53.489657,10.207563,53.490361">Bergedorf</.m> ist die Lage deutlich entspannter und man kommt gut voran. Der Schandfleck <.m bounds="10.095824,53.533317,10.115376,53.542481">Billstedter Hauptstraße</.m> ist im Vergleich zum Rest der Route kurz genug, um nicht zu arg ins Gewicht zu fallen. Insgesamt ist die Route aber auch jetzt schon zu empfehlen – mit den Lückenschlüssen hat man dann auch durchgehend gute Fahrt.</p>
    <p><.a href="https://www.abendblatt.de/hamburg/article215496251/In-Billstedt-brauchen-Radler-gutes-Sitzfleisch.html">Zeitungsartikel/Review vom 06.10.2018</.a></p>
    """
  end
end
