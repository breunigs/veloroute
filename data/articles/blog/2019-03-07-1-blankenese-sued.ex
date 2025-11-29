defmodule Data.Article.Blog.BlankeneseSued do
  use Article.Default

  def name(), do: "#{created_at()}-1-blankenese-sued"
  def created_at(), do: ~D[2019-03-07]
  def updated_at(), do: ~D[2023-01-09]
  def title(), do: "Blankenese Süd (Veloroute 1, Humannstraße bis Godeffroystraße)"

  def summary(),
    do:
      "Veloroute 1 wird im südlichen Blankenese meist Fahrradstraße; die Kreuzungen an Eichendorffstraße und Elbchaussee deutlich fahrradfreundlicher."

  def type(), do: :planned

  def tags(), do: ["radroute-concept-a", "radroute-1", "1", "A22"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <h4>Stand März 2024</h4>
    <p>Der Artikel wurde aufgeteilt, da die ursprünglich gemeinsame Planung mittlerweile getrennt wurde.</p>

    <ul>
      <li><.a ref={Manteuffelstrasse}>Manteuffelstraße und Humannstraße</.a></li>
      <li><.a ref={KreuzungElbchausseeManteuffelSchenefelderMuehlenberg}>Kreuzung Elbchaussee / Manteuffelstraße / Mühlenberg</.a></li>
      <li><.a ref={GodeffroystrasseUndGaetgensstrasse}>Godeffroystraße und Gätgensstrasse</.a></li>
    </ul>
    """
  end
end
