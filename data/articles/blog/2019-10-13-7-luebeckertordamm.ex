defmodule Data.Article.Blog.Luebeckertordamm do
  use Article.Default

  def name(), do: "#{created_at()}-7-luebeckertordamm"
  def created_at(), do: ~D[2019-10-13]

  def title(), do: "Lübeckertordamm (Veloroute 7)"

  def start(), do: ~d[2019Q4]

  def type(), do: :finished

  def tags(), do: ["7"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Radwege stadteinwärts sind bequem zu befahren, aber zu schmal zum Überholen. Im vorgesehenen Umbau sollen sie auf zwei Meter verbreitert werden und im Bereich mit Zufußgehenden auch taktile Nopenplatten zur klaren Abtrennung erhalten. Im Süden schließt der breitere Radweg an die geplante Ableitung auf die Radfahrstreifen auf der Fahrbahn an (siehe <.a name="2018-08-30-7-steindamm">Umbau Steindamm</.a>). Stadtauswärts ist der Radweg bereits ausreichend breit, sodass hier keine Änderung vorgesehen ist. Umgebaut werden soll bereits ab Herbst 2019.</p> <p><.a href="https://sitzungsdienst-hamburg-nord.hamburg.de/bi/vo020.asp?VOLFDNR=1008773">Erläuterungsbericht und Lageplan</.a></p>
    """
  end
end
