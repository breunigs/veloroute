defmodule Data.Article.Blog.Kattwykbruecke do
  use Article.Default

  def created_at(), do: ~D[2021-08-01]

  def title(), do: "Sperrung Kattwykbrücke (Freizeitroute 14)"

  def start(), do: ~d[2021-07-26]
  def stop(), do: ~d[2021-12-06]

  def type(), do: :finished
  def construction_site_id_hh(), do: [18707]
  def tags(), do: ["FR14"]

  def links(_assigns) do
    [
      {"Verkehrsmeldungen der HPA",
       "https://www.hamburg-port-authority.de/de/info-port/traffic-tower"},
      {"Zeitungsartikel",
       "https://www.abendblatt.de/wirtschaft/article232927985/kattwykbruecke-hamburg-hafen-hpa-eisenbahn-sperrung.html"}
    ]
  end

  def text(assigns) do
    ~H"""
    <h4>Stand November 2021</h4>
    <p>Die Bahnbrücke ist für den Radverkehr wieder freigegeben.</p>

    <h4>Baustelle</h4>
    <p>An der neuen Kattwykbrücke sind Mängel festgestellt worden, sodass diese momentan außer Betrieb ist. Sie ist für alle Verkehrsarten außer dem Schiffsverkehr voll gesperrt. Zur Wartungsdauer macht die Hamburg Port Authority (HPA) unterschiedliche Angaben: optimistisch sind bis Ende August 2021, pessimistisch bis Ende November.</p>

    <h4>Quelle</h4>
    <.structured_links/>
    """
  end
end
