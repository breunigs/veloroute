defmodule Git do
  @spec revision :: binary()
  def revision do
    from_env() || from_git()
  end

  @spec from_env :: nil | binary
  def from_env(), do: maybe_nil(System.get_env("GIT_COMMIT"))

  defp from_git() do
    System.cmd("git", ["rev-parse", "HEAD"])
    |> case do
      {sha, 0} -> maybe_nil(sha)
      _ -> nil
    end
    |> case do
      nil -> nil
      sha -> if dirty?(), do: "#{sha}-#{DateTime.utc_now()}", else: sha
    end
  end

  defp dirty? do
    System.cmd("git", ["status", "-s"])
    |> case do
      {"", 0} -> false
      {_changes, 0} -> true
      # no git installed presumably
      {_output, _exit} -> false
    end
  end

  defp maybe_nil(nil), do: nil

  defp maybe_nil(str) do
    str = String.trim(str)
    if str == "", do: nil, else: str
  end
end
