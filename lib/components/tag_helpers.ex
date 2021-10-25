defmodule TagHelpers do
  use Phoenix.Component

  defguard is_module(mod) when is_atom(mod) and not is_nil(mod)

  def mailto(assigns) do
    ~H"""
    <a href={Settings.email()}><%= render_block(@inner_block) %></a>
    """
  end

  def ref(assigns) do
    name =
      assigns[:name] ||
        assigns.inner_block.(nil, nil)
        |> Phoenix.HTML.Safe.to_iodata()
        |> IO.iodata_to_binary()

    art = Article.List.find_with_tags(name)
    unless is_module(art), do: raise("Failed to find a ref for #{name}")

    to_link(art, assigns)
  end

  defp to_link(art, assigns) when is_module(art) do
    path = Article.Dectorators.path(art)
    ~H"<a href={path}><%= render_block(@inner_block) %></a>"
  end
end
