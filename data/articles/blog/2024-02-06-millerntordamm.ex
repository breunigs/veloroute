defmodule Data.Article.Blog.Millerntordamm do
  use Article.Default

  def title(), do: "Millerntordamm"

  def summary(),
    do: "Hochbordradweg wird meist auf Kosten der Fußwege auf 2,0m verbreitert"

  def type(), do: :planned

  def tags(), do: []

  @tracks Data.Article.Blog.Reeperbahn.tracks()
  @forward @tracks
           |> Enum.find(fn track -> track.direction == :forward end)
           |> Map.replace!(:text, "Millerntordamm (→ Michel)")
  @backward @tracks
            |> Enum.find(fn track -> track.direction == :backward end)
            |> Map.replace!(:text, "Millerntordamm (→ Heiligengeistfeld)")

  def tracks(), do: [@forward, @backward]

  def links(_assigns) do
    [
      {"Lageplan", "Februar 2024",
       "https://fragdenstaat.de/anfrage/budapester-strasse-millerntordamm/"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Alter Zustand</h4>
    <p>In den beiden Abschnitten sind rund 1,20m breite <.ref>Hochbordradwege</.ref> vorhanden. Sie wurden seit Jahrzehnten nicht saniert und sind uneben geworden.</p>

    <h4>Planung</h4>
    <p>Die Radwege werden meist auf 2,0m verbreitert und neu gepflastert. Dies geschieht meist auf Kosten der Fußwege, die schmaler werden. Rad- und Fußwege werden durch weiße Noppenplatten klarer voneinander getrennt.</p>

    <p>Auf der Nordseite sind <.v bounds="9.971334,53.549723,9.97377,53.550519" lon={9.973137} lat={53.550041} dir="backward" ref={@ref}>im Bereich des Grünstreifens</.v> 2,5m Breite vorgesehen. Auf der Südseite entfällt Umweg um <.v bounds="9.971678,53.549245,9.974113,53.550041" lon={9.972664} lat={53.549692} dir="forward" ref={@ref}>die Grüninsel</.v>, der Radweg wird künftig links der Bäume geführt.</p>

    <h4>Meinung</h4>
    <p>Lieber den Spatz in der Hand, als die Taube auf dem Dach? Zukunftsweisend ist die Planung jedenfalls nicht, da man weiter an den 9 bis 14 KFZ-Spuren festhält während der Radweg zulasten der Gehwege etwas verbreitert wird.</p>

    <p>Die Gehwege in Richtung <.m bounds="9.96691,53.550419,9.974874,53.556968">Heiligengeistfeld</.m> sind  auch heute schon oft überfüllt – egal ob DOM ist oder nicht. Auch die Weiterfahrt in Richtung <.v bounds="9.966433,53.549508,9.971978,53.551773" lon={9.970389} lat={53.550798} dir="forward" ref={@ref}>Reeperbahn</.v> bleibt umständlich.</p>

    <p>Immerhin wird die enge Kurve um die Grüninsel entschärft.</p>

    <h4>Quelle</h4>
    <.structured_links ref={@ref}/>
    """
  end
end
