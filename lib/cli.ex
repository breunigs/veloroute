defmodule Cli do
  def confirm(text, default \\ true) do
    prompt = if default, do: " [Y/n] ", else: " [y/N] "

    resp =
      case IO.gets(text <> prompt) do
        :eof -> ""
        {:error, _reason} -> "no"
        dat -> dat |> to_string() |> String.downcase() |> String.trim()
      end

    resp == "y" || resp == "yes" || (resp == "" && default)
  end
end
