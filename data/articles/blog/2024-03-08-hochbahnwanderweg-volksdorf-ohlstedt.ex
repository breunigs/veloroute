defmodule Data.Article.Blog.HochbahnwanderwegVolksdorfOhlstedt do
  use Article.Default

  def title(), do: "Hochbahnwanderweg (Volksdorf bis Ohlstedt, Bezirksroute W7)"

  def summary(), do: "Der Weg soll asphaltiert werden."

  def start(), do: ~d[2024-07]
  def stop(), do: ~d[2024-08]

  def type(), do: :planned

  def tags(), do: ["br-wandsbek-w7"]

  def links(_assigns) do
    [
      {"Planung", "März 2024",
       "https://sitzungsdienst-wandsbek.hamburg.de/bi/vo020.asp?VOLFDNR=1020494"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>Der Weg ist mit feinem Schotter befestigt. Schlaglöcher bzw. Pfützen bilden sich regelmäßig.</p>

    <h4>Planung</h4>
    <p>Der Weg soll asphaltiert werden. Die Straßenquerungen bleiben unverändert.</p>

    <h4>Meinung</h4>
    <p>Die Wegqualität zu verbessern ist ein guter, erster Schritt. In einem zweiten Schritt müssen aber noch einige Kreuzungen, wie etwa mit dem <.v bounds="10.137256,53.683184,10.145111,53.688347" lon={10.140453} lat={53.685031} dir="forward" ref="br-wandsbek-w7">Lottbeker Weg</.v>, umgebaut werden. Erst damit wird die Strecke wirklich alltagstauglich.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
