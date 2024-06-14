defmodule LangPlug do
  @behaviour Plug

  @impl Plug
  def init(_opts), do: []

  @impl Plug
  def call(conn, _opts) do
    {user_set, lang} = fetch_lang(conn)
    lang = lang || Settings.default_language()

    conn
    |> Plug.Conn.put_session("lang", lang)
    |> Plug.Conn.put_session("lang_user_set", user_set)
  end

  defp fetch_lang(conn) do
    with %{params: %{"lang" => lang}} <- conn,
         true <- Enum.member?(all_languages(), lang) do
      {true, lang}
    else
      _ ->
        {false,
         conn
         |> Plug.Conn.get_req_header("accept-language")
         |> Enum.flat_map(&String.split(&1, ~r/[_,;-]/))
         |> Enum.find(&Enum.member?(all_languages(), &1))}
    end
  end

  use Memoize

  defmemop all_languages() do
    Article.List.all() |> Enum.flat_map(& &1.languages()) |> Enum.uniq()
  end
end
