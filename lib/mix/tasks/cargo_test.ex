defmodule Mix.Tasks.CargoTest do
  use Mix.Task

  @shortdoc "Runs cargo test for all Rust NIF crates"
  def run(_args) do
    nifs_dir = Path.join(File.cwd!(), "native")

    nifs_dir
    |> File.ls!()
    |> Enum.filter(fn dir ->
      Path.join([nifs_dir, dir, "Cargo.toml"]) |> File.exists?()
    end)
    |> Enum.each(fn dir ->
      crate_path = Path.join(nifs_dir, dir)
      IO.puts("Running cargo test in #{crate_path}")

      {_, exit_code} =
        System.cmd("cargo", ["test"], cd: crate_path, into: IO.stream(:stdio, :line))

      if exit_code != 0 do
        Mix.raise("cargo test failed in #{crate_path}")
      end
    end)
  end
end
