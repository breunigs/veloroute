defmodule Parallel do
  @spec map(Enumerable.t(), (Enum.element() -> any()), Keyword.t()) :: list()
  def map(enum, fun, opts \\ [timeout: :infinity]) do
    Task.async_stream(
      enum,
      fun,
      opts
    )
    |> Enum.map(&elem(&1, 1))
  end

  @spec flat_map(Enumerable.t(), (Enum.element() -> Enumerable.t()), Keyword.t()) :: list()
  def flat_map(enum, fun, opts \\ [timeout: :infinity]) do
    Task.async_stream(
      enum,
      fun,
      opts
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

  @spec each(Enumerable.t(), pos_integer(), (Enum.element() -> any())) :: :ok
  def each(enum, limit, fun) do
    Task.async_stream(
      enum,
      fun,
      timeout: :infinity,
      max_concurrency: limit
    )
    |> Enum.each(&Function.identity/1)
  end
end
