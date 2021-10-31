defmodule Data.Article.Blog.FreilichtbuehneSaarlandstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-freilichtbuehne-saarlandstrasse"
  def created_at(), do: ~D[2019-12-16]
  def updated(), do: ~D[2020-06-18]
  def title(), do: "Freilichtbühne Saarlandstraße (Veloroute 5N)"

  def start(), do: ~d[2020Q1]
  def stop(), do: ~d[2020Q2]

  def type(), do: :finished

  def tags(), do: [5, "5N"]

  def links() do
    []
  end

  def text(assigns) do
    ~H"""
    <p><strong>Stand 2020:</strong> Der Umbau ist mittlerweile abgeschlossen und gibt dem Radverkehr für ein kurzes Stück eine seichte Verbesserung.</p> <p>Der große Wurf ist für die Saarlandstraße erst ab 2024 vorgesehen. Um die Situation bei Konzerten im Bereich der Freilichtbühne zu verbessern zieht man eine kleine Maßnahme auf Frühjahr 2020 vor. Es ist geplant den Radweg stellenweise zu verbreitern und näher an die KFZ-Spuren zu rücken, damit dieser nicht für jeden Be- und Entlade Vorgang gekreuzt werden muss. Ganz wird das Problem damit aber nicht gelöst.</p> <p>Im Bereich der KFZ-Parkplätze wird der Radverkehr künftig hinter, statt vor den Stellflächen geführt. Dies erfolgt im Mischverkehr mit den Autos. Im Anschluss gibt es eine sehr enge Aufleitung auf den alten Radweg.</p> <p>Für den Radverkehr springen mehr Stellplätze und der gelöste Konflikt Fuß/Rad bei Konzerten heraus. Der Komfort verschlechtert sich jedoch, weil ein- und ausparkende KFZ den Radverkehr aufhalten und die Aufleitung auf den alten Radweg keine hohen Geschwindigkeiten ermöglicht.</p> <p>
    <.a href="https://lsbg.hamburg.de/contentblob/13350118/afeeac1742127e46a8577060650d0aca/data/saarlandstrasse-freilichtbuehne-abgestimmte-planung-bericht.pdf">Erläuterungsbericht</.a><br>
    <.a href="https://lsbg.hamburg.de/contentblob/13350120/34cdb66cafbee27bb0c2d2a0bbd9efc5/data/saarlandstrasse-freilichtbuehne-abgestimmte-planung-plan.pdf">Lageplan</.a>
    </p>
    """
  end
end
