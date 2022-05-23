defmodule Mix.Tasks.Velo.Setup do
  use Mix.Task

  @shortdoc "Creates secrets and other initial config if it doesn't exist"
  def run(_args) do
    phx_credentials()
    credentials()
  end

  @creds_path "data/credentials.ex"
  defp credentials do
    if !File.exists?(@creds_path),
      do: credentials_write(),
      else: IO.puts("#{@creds_path} already exists, not overwriting.")
  end

  defp credentials_write do
    username = ask("Mapbox.com Username?")
    access_token = ask("Mapbox.com Access Token (starts with 'pk.')?")
    secret_token = ask("Mapbox.com Secret Token (starts with 'sk.')?")

    code =
      quote do
        defmodule Credentials do
          def mapbox_username(), do: unquote(username)
          def mapbox_access_token(), do: unquote(access_token)
          def mapbox_secret_token(), do: unquote(secret_token)

          def maptiler_api_key(), do: "fixme"
        end
      end
      |> Macro.to_string()
      |> Code.format_string!()

    File.write!(@creds_path, code)
  end

  defp ask(question) do
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
  defp phx_credentials do
    if !File.exists?(@phx_creds_path),
      do: phx_credentials_write(),
      else: IO.puts("#{@phx_creds_path} already exists, not overwriting.")
  end

  defp phx_credentials_write do
    phx = Mix.Tasks.Phx.Gen.Secret.run(["64"])
    live = Mix.Tasks.Phx.Gen.Secret.run(["32"])

    code =
      quote do
        defmodule PhoenixCredentials do
          @moduledoc """
          Generated through "mix velo.setup", but you can customize it.
          """

          def secret_key_base, do: unquote(phx)
          def live_view_signing_salt, do: unquote(live)
        end
      end
      |> Macro.to_string()
      |> Code.format_string!()

    File.write!(@phx_creds_path, code)
  end
end
