defmodule Settings do
  defmacro c(key) do
    quote do
      Application.compile_env!(:veloroute, [Settings, unquote(key)])
    end
  end

  def r(key), do: Application.fetch_env!(:veloroute, Settings) |> Map.fetch!(key)
end
