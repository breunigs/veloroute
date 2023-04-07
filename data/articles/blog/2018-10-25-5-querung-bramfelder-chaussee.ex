defmodule Data.Article.Blog.QuerungBramfelderChaussee do
  use Article.Default

  def name(), do: "#{created_at()}-5-querung-bramfelder-chaussee"
  def created_at(), do: ~D[2018-10-25]

  def title(), do: "Querung Bramfelder Chaussee, Höhe Fabriciusstraße (Veloroute 5)"

  def type(), do: :planned

  def tags(), do: ["5", "br-wandsbek-w3"]

  def links(_assigns) do
    [
      {"Lagepläne und Erläuterungsbericht", "2018",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1008587"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Um von der Fabriciusstraße legal die <.v bounds="10.078214,53.617619,10.083614,53.620426" lon={10.080553} lat={53.619167} dir="forward" ref="br-wandsbek-w3">Bramfelder Chaussee</.v> zu queren, muss man absteigen und schieben. Wer der <.a href="/br-wandsbek-w3">Bezirksroute <.icon>W3</.icon></.a> folgen will, muss dies ein zweites Mal beim Queren der <.v bounds="10.078214,53.617619,10.083614,53.620426" lon={10.080655} lat={53.619002} dir="forward" ref="br-wandsbek-w3">Berner Chaussee</.v> tun.</p>

    <h4>Planung</h4>
    <p>In einer Planung von 2018 wird der Radweg an dieser Engstelle etwas verbreitert und das kurze Stück bis zur Ampel im Zweirichtungsverkehr freigegeben. Als die Pläne gemacht wurden, waren Bezirksrouten noch kein Thema, sodass diese nicht berücksichtigt wurde.</p>

    <h4>Meinung</h4>
    <p>Die Führung bleibt auch nach dem Umbau umständlich. Als Sofortmaßnahme willkommen, aber mittel- bis langfristig muss ein Vollumbau der Kreuzung erfolgen um die Querungsmöglichkeiten zu verbessern.</p>
    """
  end
end
