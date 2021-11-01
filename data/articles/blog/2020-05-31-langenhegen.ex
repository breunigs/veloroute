defmodule Data.Article.Blog.Langenhegen do
  use Article.Default

  def name(), do: "#{created_at()}-langenhegen"
  def created_at(), do: ~D[2020-05-31]

  def title(), do: "Langenhegen (Veloroute 1)"

  def type(), do: :finished

  def tags(), do: ["1"]

  def links(_assigns) do
    []
  end

  def text(assigns) do
    ~H"""
    <p>Die Veloroute 1 ist auf dem <.m bounds="9.843782,53.556574,9.850302,53.557479">Langenhegen</.m> zur Zeit wegen einer Baustelle unterbochen. Eine Umleitung ist nicht eingerichtet. Wer das kurze Stück nicht schieben möchte, kann über die <.m bounds="9.844772,53.555084,9.849515,53.555959">Thunstraße</.m> fahren.</p>
    """
  end
end
