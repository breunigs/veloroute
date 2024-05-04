defmodule LangPlug do
  @behaviour Plug

  @langs Settings.supported_languages()

  @impl Plug
  def init(_opts), do: []

  @impl Plug
  def call(conn, _opts) do
    {user_set, lang} = fetch_lang(conn)
    lang = lang || hd(@langs)

    conn
    |> Plug.Conn.put_session("lang", lang)
    |> Plug.Conn.put_session("lang_user_set", user_set)
  end

  defp fetch_lang(%{params: %{"lang" => lang}}) when lang in @langs,
    do: {true, lang}

  defp fetch_lang(conn) do
    {false,
     conn
     |> Plug.Conn.get_req_header("accept-language")
     |> Enum.flat_map(&String.split(&1, ~r/[_,;-]/))
     |> Enum.find(&(&1 in @langs))}
  end
end
