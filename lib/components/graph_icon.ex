defmodule Components.GraphIcon do
  use Phoenix.Component

  @spec graph(map()) :: Phoenix.LiveView.Rendered.t()
  attr :icon, :atom, required: true
  attr :ref, :atom, required: true

  def graph(assigns) do
    color = assigns.ref.color()
    name = name(assigns.icon, color)

    if Application.get_env(:veloroute, :env) == :dev,
      do: ensure_exists!(name, assigns.icon, color)

    assigns = %{name: name}

    ~H"""
    <img src={"/images/#{@name}"}>
    """
  end

  defp ensure_exists!(name, icon, color) do
    path = Path.join("priv/static/images/", name)
    if not File.exists?(path), do: File.write!(path, generate_icon(icon, color))
  end

  defp name(icon, "#" <> color), do: "graph_#{icon}_#{color}.svg"

  def generate_all() do
    icons = [:fork, :river_only, :river, :straight, :tunnel, :underpass, :ferry, :bridge, :end]

    colors =
      Article.List.category("Static")
      |> Enum.map(& &1.color())
      |> Enum.uniq()
      |> Util.compact()

    for icon <- icons, color <- colors, do: ensure_exists!(name(icon, color), icon, color)
  end

  defp generate_icon(:fork, "#" <> _rest = color) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"><path fill="none" stroke="#{color}" stroke-width="4.6" d="M11.497 23V0c0 6.352-5.148 11.5-11.5 11.5"/></svg>
    """
  end

  defp generate_icon(:river_only, "#" <> _rest = color) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"><path fill="none" stroke="#0366d6" stroke-width="3.45" d="M-1.242 11.96c2.164-.92 4.945-2.61 7.683-1.933l10.158 3.063c2.896.774 5.48-1.129 7.643-2.051"/><path fill="none" stroke="#{color}" stroke-width="4.6" d="M19.003 2.304h-15M19 20.698H4"/></svg>
    """
  end

  defp generate_icon(:river, "#" <> _rest = color) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"><path fill="none" stroke="#0366d6" stroke-dasharray="6.8999999999999995 12.65" stroke-width="3.4499999999999997" d="M-1.242 11.96c2.164-.92 5.844-1.839 7.683-1.933l10.118 2.946c1.84-.094 5.52-1.012 7.683-1.934"/><path fill="none" stroke="#{color}" stroke-width="4.6" d="M11.5 0v23"/><path fill="none" stroke="#999999" stroke-width="2.3" d="M2.531 2.3 5.75 4.603v13.796L2.531 20.7M20.47 2.301 17.25 4.6v13.797l3.219 2.301"/></svg>
    """
  end

  defp generate_icon(:straight, "#" <> _rest = color) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"><path fill="none" stroke="#{color}" stroke-width="4.6" d="M11.5 0v23"/></svg>
    """
  end

  defp generate_icon(:tunnel, "#" <> _rest = color) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"><path fill="none" stroke="#{color}" stroke-width="4.6" d="M11.5 0v2.66M11.5 20.341v2.66"/><path stroke="#be2d2c" stroke-dasharray="50" stroke-width="40" d="M-34.987 68.504v250m60 0V53.07" style="stroke:#{color}" transform="matrix(.04946 0 0 .04946 11.76 1.897)"/><path fill="none" stroke="#999999" stroke-width="2.968" d="M2.915 21.642a49.463 123.659 0 0 1 17.312 0M2.915 1.357a49.463 123.659 0 0 0 17.312 0"/></svg>
    """
  end

  defp generate_icon(:underpass, "#" <> _rest = color) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"><path fill="none" stroke="#{color}" stroke-width="4.6" d="M11.5 0v9.2m0 13.8v-9.2"/><path fill="none" stroke="#999999" stroke-width="1.8399999999999999" d="M4.602 7.82 5.98 9.2h11.04l1.378-1.38M4.602 15.18 5.98 13.8h11.04l1.378 1.38"/></svg>
    """
  end

  defp generate_icon(:bridge, "#" <> _rest = color) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"><path fill="none" stroke="#{color}" stroke-width="4.6" d="M11.5 0v23"/><path fill="none" stroke="#999999" stroke-width="2.3" d="M2.531 2.3 5.75 4.603v13.796L2.531 20.7M20.47 2.301 17.25 4.6v13.797l3.219 2.301"/></svg>
    """
  end

  defp generate_icon(:end, "#" <> _rest = color) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"><path fill="none" stroke="#{color}" stroke-width="4.6" d="M11.5 11.5V0"/><path fill="#881149" d="M18.398 11.5a6.895 6.895 0 0 1-6.898 6.898A6.895 6.895 0 0 1 4.602 11.5 6.895 6.895 0 0 1 11.5 4.602a6.895 6.895 0 0 1 6.898 6.898Zm0 0"/></svg>
    """
  end

  defp generate_icon(:ferry, "#" <> _rest = color) do
    """
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"><path fill="none" stroke="#{color}" stroke-width="4.6" d="M11.502-1.247v2.469M11.5 21.157v2.469m2.279-.66"/><path fill="#475bcc" d="M9.352 14.996a3 3 0 0 1 1.85.67l.26.23h.05l.31-.28a2.89 2.89 0 0 1 3.44-.18l2.26-4.44-1.5-1v-3.55a1.54 1.54 0 0 0-1.5-1.45h-.5a.94.94 0 0 0-1-1h-3a.94.94 0 0 0-1 1h-.5a1.54 1.54 0 0 0-1.5 1.45v3.55l-1.5 1 2.25 4.53a2.93 2.93 0 0 1 1.58-.53zm-1.33-8.55a.47.47 0 0 1 .5-.45h6a.47.47 0 0 1 .5.5v3l-3.5-2-3.5 1.95v-3zm10 10.55v1a1 1 0 0 0-.68.34 2.15 2.15 0 0 1-1 .6 1.91 1.91 0 0 1-1.77-.37l-.39-.35a.78.78 0 0 0-1.1 0c-.14.12-.27.25-.42.37a1.92 1.92 0 0 1-2.48-.07l-.39-.35a.76.76 0 0 0-1 0c-.19.15-.36.32-.55.47a1.91 1.91 0 0 1-2.35-.06l-.31-.27a.94.94 0 0 0-.56-.31v-1c.259-.032.52.017.75.14a6.2 6.2 0 0 1 .79.58.84.84 0 0 0 .81.25.93.93 0 0 0 .31-.16c.16-.12.29-.26.45-.39a1.92 1.92 0 0 1 2.45 0c.16.13.31.28.47.41a.76.76 0 0 0 1 0c.16-.13.31-.28.47-.41a1.92 1.92 0 0 1 2.46 0c.15.13.29.27.44.39a.76.76 0 0 0 1 0l.47-.41c.32-.26.719-.4 1.13-.4z" style="fill:#0366d6;fill-opacity:1"/></svg>
    """
  end
end
