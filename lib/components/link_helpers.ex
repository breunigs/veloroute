defmodule LinkHelpers do
  use Phoenix.Component

  def a(%{type: :feed, href: href} = assigns) do
    ~H"<a href={href}><%= render_block(@inner_block) %></a>"
  end

  def a(%{type: :feed} = assigns) do
    ~H"<i><%= render_block(@inner_block) %></i>"
  end
end
