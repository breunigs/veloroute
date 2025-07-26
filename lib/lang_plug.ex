defmodule LangPlug do
  @behaviour Plug

  @impl Plug
  def init(_opts), do: []

  @impl Plug
  def call(conn, _opts) do
    lang =
      [
        from_params(conn),
        Plug.Conn.get_session(conn, "lang"),
        from_accept_language_header(conn),
        Settings.r(:default_language)
      ]
      |> dbg
      |> List.flatten()
      |> Util.compact()
      |> Enum.find(&Enum.member?(all_languages(), &1))

    Plug.Conn.put_session(conn, "lang", lang)
  end

  defp from_params(%{params: %{"lang" => lang}} = _conn), do: lang
  defp from_params(_conn), do: nil

  defp from_accept_language_header(conn) do
    conn
    |> Plug.Conn.get_req_header("accept-language")
    |> Enum.flat_map(&String.split(&1, ~r/[_,;-]/))
  end

  use Memoize

  defmemop all_languages() do
    Article.List.all() |> Enum.flat_map(& &1.languages()) |> Enum.uniq()
  end
end
