defmodule Parallel do
  @spec map(Enumerable.t(), (Enum.element() -> any())) :: list()
  def map(enum, fun) do
    Task.async_stream(
      enum,
      fun,
      timeout: :infinity
    )
    |> Enum.map(&elem(&1, 1))
  end

  @spec flat_map(Enumerable.t(), (Enum.element() -> Enumerable.t())) :: list()
  def flat_map(enum, fun) do
    Task.async_stream(
      enum,
      fun,
      timeout: :infinity
    )
    |> Enum.flat_map(&elem(&1, 1))
  end

  @spec each(Enumerable.t(), (Enum.element() -> any())) :: :ok
  def each(enum, fun) do
    Task.async_stream(
      enum,
      fun,
      timeout: :infinity
    )
    |> Enum.each(&Function.identity/1)
  end
end
