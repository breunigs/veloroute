defmodule Cli do
  def confirm(text) do
    resp =
      case IO.gets(text <> " [Y/n] ") do
        :eof -> ""
        {:error, _reason} -> "no"
        dat -> String.downcase(dat) |> String.trim()
      end

    resp == "" || resp == "y" || resp == "yes"
  end
end
