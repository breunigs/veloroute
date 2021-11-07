defmodule Data.Article.Blog.Bundesstrasse do
  use Article.Default

  def created_at(), do: ~D[2021-10-19]

  def title(), do: "Bundesstraße (Rentzelstraße bis Verbindungsbahn, Bezirksroute B)"

  def summary(), do: "Bundesstraße soll ab 2023 (vermutlich) zur Fahrradstraße umgebaut werden."

  def start(), do: ~d[2023]

  def type(), do: :planned

  def tags(), do: ["Bezirksroute B", "Eimsbüttel"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4> <p>Im Planungsgebiet gibt es beidseitig schmale <.ref>Hochbordradwege</.ref>, die durch angekettete Fahrräder teils noch enger werden. Sie müssen nicht benutzt werden.</p>
    <h4>Planung</h4> <p>Die Straße soll zu einer Fahrradstraße umgebaut werden. Die Fahrbahn soll künftig dann nur noch 5,50m breit sein, wobei am <.m bounds="9.979352,53.564563,9.981155,53.565757">Durchschnitt</.m> die Fahrbahn auf 4,0m verengt werden soll. Die Gehwegüberfahrten bleiben weiterhin erhalten.</p>
    <p>An der <.m bounds="9.981335,53.563922,9.983163,53.564482">Verbindungsbahn</.m> sollen KFZ künftig nicht mehr einbiegen dürfen, die Straße wird aber nicht zu einer Einbahnstraße. Eine komplette Durchfahrtssperre für KFZ wurde von Feuerwehr und Rettungsdiensten abgelehnt.</p>
    <p>Die alten Hochbordradwege werden den Fußwegen zugeschlagen und die KFZ-Parkplätze neu sortiert. Es sollen zahlreiche neue Radanlehnbügel aufgestellt werden; von heute 44 auf künftig 121.</p>
    <p>Ob die Fahrradstraße eingerichtet werden darf ist noch offen, da eine Verkehrszählung abgewartet wird. Nur wenn dort der Radverkehrsanteil hoch genug ausfällt, sind Fahrradstraßen gesetzlich möglich. Sollte dies nicht machbar sein, würde der Abschnitt in einem ähnlichen Stil zu einer Tempo-30-Zone umgebaut.</p>
    <p>Der Bezirk plant zu diesem Entwurf noch eine Online-Umfrage einzurichten.</p>
    <h4>Meinung</h4> <p>Es ist schade das man die KFZ-Sackgasse so schnell verworfen hat, statt die Möglichkeiten genauer auszuloten. Mit Automatikpollern oder mit Blaulicht über den Radweg entstünden für die Rettungskräfte auch keine Umwege.</p>
    <p>Die halbseitige Sperrung wird den KFZ-Verkehr und dessen Lärm vermutlich trotzdem etwas verringern. Das muss sie aber auch, wenn der Radverkehr auf der Fahrbahn fahren soll.</p>
    <h4>Quelle</h4> <p><.a href="https://sitzungsdienst-eimsbuettel.hamburg.de/bi/vo020.asp?VOLFDNR=1007009">Unterlagen des ersten Entwurfs</.a></p>
    """
  end
end
