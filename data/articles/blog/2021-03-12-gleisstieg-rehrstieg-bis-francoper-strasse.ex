defmodule Data.Article.Blog.GleisstiegRehrstiegBisFrancoperStrasse do
  use Article.Default

  def created_at(), do: ~D[2021-03-12]

  def title(), do: "Gleisstieg (Rehrstieg bis Francoper Straße, Veloroute 10)"

  def start(), do: ~d[2021-05-06]
  def stop(), do: ~d[2021-10-28]

  def type(), do: :finished

  def tags(), do: ["10", "h10.2"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Die Veloroute führte hier <.m bounds="9.869935,53.473258,9.873952,53.474431">mitten durch einen Spielplatz</.m>, was entsprechend vielfältige Querungsverkehre zur Folge hat. Im weiteren Verlauf ist der Abschnitt jedoch nahezu frei von Einmündungen. Der Weg selbst ist rund 2,9m breit. Der Asphaltbelag ist in gutem Zustand, bis auf einige Stellen mit durchbrechenden Wurzeln.</p>

    <h4>Vorhaben</h4>
    <p>Die Veloroute soll vom Spielplatz wegverlegt werden und gänzlich an der Bahnlinie verlaufen. Fuß- und Radweg werden dabei konsequent voneinander getrennt. Die Breiten fallen unterschiedlich aus: für den Radweg sind 3m bis 4m vorgesehen, der Fußweg wird mindestens 1,85m breit. Um Wurzelschäden vorzubeugen bzw. vorhandene Bäume schützen zu können sind stellenweise Sonderformen vorgesehen. Zum <.m bounds="9.87178,53.473262,9.873973,53.473902">Rehrstieg</.m> hin ist vorgesehen ein kurzes Stück der KFZ-Parkplätze zu einem Radweg umzuwandeln, sodass dieser hier in beide Richtungen befahrbar wäre.</p>

    <h4>Meinung</h4>
    <p>Das die Veloroute künftig nicht mehr durch den Spielplatz führen soll ist sinnvoll. Auch die Trennung von Fuß- und Radverkehr und die Mindestbreite von 3,0m können sich sehen lassen.</p>
    <p>Die Anschlüsse bzw. Übergänge zu den weiterführenden Straßen werden jeweils getrennt geplant und liegen noch nicht vor. Am <.m bounds="9.87178,53.473262,9.873973,53.473902">Rehrstieg</.m> ist vermutlich ein Zweirichtungsradweg auf Seite des Spielplatzes bis Höhe <.v bounds="9.872928,53.473807,9.875545,53.474704" lon={9.8738319} lat={53.4742024} dir="backward" ref="10">Striepenweg</.v> angedacht. In der Planung ist nur ein kurzer Stummel eingezeichnet, der alleine für sich nutzlos ist.</p>
    <p>In Richtung <.v bounds="9.862788,53.473614,9.865375,53.474214" lon={9.8645124} lat={53.4738852} dir="forward" ref="10">Francoper Straße</.v> wird der Radweg immer schmäler und hört dann ohne Überleitung auf. Auch hier ist davon auszugehen das der Radweg in der anliegenden Planung fortgeführt wird und ähnlich wie die <.v bounds="9.8816,53.472018,9.891557,53.47433" lon={9.8878776} lat={53.4730192} dir="forward" ref="10">Altwiedenthaler Twiete</.v> verbessert wird.</p>

    <h4>Quelle</h4>
    <ul>
    <li>
    <.a href="https://www.hamburg.de/harburg/pressemeldungen/15033046/ausbau-veloroute-10/">Pressemeldung der Stadt</.a> (enthält auch zeitliche Angaben zu Umleitungen)
    </li>
    <li>
    Unterlagen Auftragsvergabe (nicht mehr öffentlich; verfügbar auf Anfrage)
    </li>
    </ul>
    """
  end
end
