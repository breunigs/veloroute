defmodule Data.Article.Blog.VerlegungGrossFlottbekVelo1Velo14 do
  use Article.Default

  def name(), do: "#{created_at()}-verlegung-gross-flottbek-velo1-velo14"
  def created_at(), do: ~D[2021-09-23]

  def title(), do: "Verlegung Veloroute 1 und 14 in Groß Flottbek"

  def type(), do: :changed_routing

  def tags(), do: ["1", "14"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Alte Führung</h4> <p>Man bog in die <.v bounds="9.869746,53.56746,9.875476,53.56919" lon={9.874612} lat={53.567992} dir="forward" ref="1">Von-Thünen-Straße</.v> ab, und folgte dann dem <.m bounds="9.867092,53.567812,9.872151,53.574065">Windmühlenweg</.m> und dessen gedachten Verlängerungen geradeaus bis zum <.v bounds="9.866374,53.574196,9.876655,53.578101" lon={9.87106} lat={53.577212} dir="forward" ref="1">Lise-Meitner-Park</.v>. </p>
    <h4>Neue Führung</h4> <p>Stattdessen folgt man der <.v bounds="9.873985,53.567769,9.875965,53.57135" lon={9.874573} lat={53.568448} dir="forward" ref="1">Seestraße</.v> weiter geradeaus. Über den <.v bounds="9.874016,53.570212,9.875965,53.575005" lon={9.87479} lat={53.571626} dir="forward" ref="1">Flottbeker Drift</.v> erreicht man wie gehabt den <.v bounds="9.866374,53.574196,9.876655,53.578101" lon={9.87106} lat={53.577212} dir="forward" ref="1">Lise-Meitner-Park</.v>, allerdings aus einer leicht anderen Richtung.</p>
    <h4>Meinung</h4> <p>Leider gibt es keine Ankündigung zu dieser Verlegung. Ich vermute, das die schwierige Platzsituation am <.m bounds="9.867252,53.571128,9.869445,53.574676">Eisenkrautweg</.m> eine wesentliche Rolle gespielt haben dürfte. Sowohl Seestraße als auch Flottbeker Drift werden als bereits ausgebaut angesehen. Für die Wege im Park gilt das nicht; aber wann und ob diese ausgebaut werden ist nicht bekannt.</p>
    """
  end
end
