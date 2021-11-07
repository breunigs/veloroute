defmodule Data.Article.Blog.MundsburgerDamm do
  use Article.Default

  def created_at(), do: ~D[2019-12-08]

  def title(), do: "Mundsburger Damm (Veloroute 5 und 6)"

  def start(), do: ~d[2020Q2]
  def stop(), do: ~d[2020Q2]

  def type(), do: :finished

  def tags(), do: ["5", "6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Im Mundsburger Damm gibt es zur Zeit unterdimensionierte Radwege, die weder ordentlich vom Gehweg noch von den Parkplätzen abgetrennt sind. Bedingt durch Wurzelaktivität der Bäume ist das Pflaster uneben oder gleich ganz entfernt worden.</p> <p>Man möchte die Bäume erhalten, dem Autoverkehr wegen des hohen Verkehrsauskommen keine Spur wegnehmen und den Radverkehr aus dem gleichen Grund auch nicht in den Mischverkehr schicken. Folglich bleibt nur eine Verbesserung der vorhandenen Radwege als Möglichkeit übrig, was wegen den nahen Häusern und den erwähnten Bäumen schwierig ist. Um wenigstens etwas Platz zu gewinnen werden fast alle Parkplätze entfern und durch Pfosten bzw. Fahrradstellplätze ersetzt. Falschparken sollte somit brauchbar verhindert werden, sodass der Radverkehr nicht mehr in der „Dooringzone“ verläuft. Der Platz wird fair zwischen Fuß- und Radwegen aufgeteilt, wobei beide an vielen Stellen zu schmal ausfallen. Richtung Alster wird der Radweg auf 1,50m verbreitert, Richtung Mundsburg auf 1,37m, teilweise mit etwas breiteren Stellen. Überholen ist auf den 1,60m breiten Stellen aber dennoch nicht legal möglich.</p> <p>Die Umplanung ist für Fuß- und Rad enttäuschend, allerdings dem <span title="Grob geschätzte Werte zur Einschätzung: Der Verkehr teilt sich hier in 80% KFZ, 15% Rad und weniger als 5% Fuß auf. Bei den Fahrspuren kommt KFZ auf 55%, Rad und Fuß auf je 15% des verfügbaren Querschnitts an einer Beispielstelle.">Verkehrsaufkommen entsprechend okay aufgeteilt</span>. Umgebaut werden soll im 2. Quartal 2020.</p> <p><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008951">Erläuterungsbericht und Lageplan</.a></p>
    """
  end
end
