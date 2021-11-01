defmodule Data.Article.Blog.Chemnitzstrasse do
  use Article.Default

  def name(), do: "#{created_at()}-1-chemnitzstrasse"
  def created_at(), do: ~D[2019-04-25]

  def title(), do: "Chemnitzstraße (Veloroute 1)"

  def start(), do: ~d[2019Q2]

  def type(), do: :finished

  def tags(), do: ["1", "a6"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Seit Frühjahr 2019 wird die <.m bounds="9.851052,53.555214,9.950356,53.609761">Chemnitzstraße</.m> zu einer Fahrradstraße umgebaut. Das Kopfsteinpflaster wird entfernt und die Engstellen mit teils abenteuerlichen Radwegchen entschärft. Wermutstropfen: Der Diagonaltrenner an der Hospitalstraße wird nicht überfahrbar sein, sodass man hier sein Gespräch ggf. kurz unterbrechen muss. Die traurige Begründung hier ist, das dieser sonst vom KFZ Verkehr ignoriert und wortwörtlich umgefahren wird.</p> <p>Die Chemnitzstraße sollte übrigens bereits seit etlichen Jahren umgebaut werden. Bisher scheiterte dies daran, das die die Kombination „Fahrradstraße + KFZ frei“ nicht vorgesehen war. „Fahrradstraße + Anlieger frei“ hätte die Anwohner in den Straße zwischen Chemnitzstraße und <.m bounds="9.937021,53.551141,9.948589,53.552419">Große Bergstraße</.m> aber zu stark abgeschnitten und wurde deswegen abgelehnt.</p> <p><.a href="https://sitzungsdienst-altona.hamburg.de/bi/vo020.asp?VOLFDNR=1007660">Erläuterungsbericht zur Umgestaltung mit vorläufigem Lageplan</.a> (unter Anlagen)</p>
    """
  end
end
