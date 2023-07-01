defmodule Mix.Tasks.Velo.Setup do
  use Mix.Task

  @shortdoc "Creates secrets and other initial config if it doesn't exist"
  def run(args) do
    phx_credentials()
    credentials(args)
  end

  @creds_path "data/credentials.ex"
  defp credentials(args) do
    if !File.exists?(@creds_path),
      do: credentials_write(args),
      else: IO.puts("#{@creds_path} already exists, not overwriting.")
  end

  defp credentials_write(args) do
    maptiler_api_key = ask("MapTiler API key?", args)
    arcgis_api_key = ask("ArcGis API key?", args)

    code =
      quote do
        defmodule Credentials do
          def maptiler_api_key(), do: unquote(maptiler_api_key)
          def arcgis_api_key(), do: unquote(arcgis_api_key)
        end
      end
      |> Macro.to_string()
      |> Code.format_string!()

    File.write!(@creds_path, code)
  end

  defp ask(question, opts \\ [])

  defp ask(question, ["ci"]) do
    "dummy-ci-value"
  end

  defp ask(question, []) do
    case IO.gets("\n" <> question <> "\n> ") do
      :eof ->
        ask(question)

      {:error, reason} ->
        IO.puts(reason)
        ask(question)

      input ->
        input = String.trim(input)

        if input == "" do
          IO.puts("Input can't be empty")
          ask(question)
        else
          input
        end
    end
  end

  @phx_creds_path "data/phoenix_credentials.exs"
  def phx_credentials do
    if not File.exists?(@phx_creds_path), do: phx_credentials_write()
  end

  defp phx_credentials_write do
    phx = gen(64)
    live = gen(32)

    code =
      quote do
        defmodule PhoenixCredentials do
          @moduledoc "Generated through `mix velo.setup`, but you can customize it."

          def secret_key_base, do: unquote(phx)
          def live_view_signing_salt, do: unquote(live)
        end
      end
      |> Macro.to_string()
      |> Code.format_string!()

    File.write!(@phx_creds_path, code)
  end

  defp gen(length) do
    :crypto.strong_rand_bytes(length) |> Base.encode64(padding: false) |> binary_part(0, length)
  end
end
