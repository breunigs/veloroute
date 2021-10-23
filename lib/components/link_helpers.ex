defmodule LinkHelpers do
  use Phoenix.Component

  def a(assigns) do
    ~H"""
    <a href={Settings.email()}><%= render_block(@inner_block) %></a>
    """
  end
end
