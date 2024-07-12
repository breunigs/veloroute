defmodule Veloroute do
  @moduledoc """
  Veloroute keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def health_ok() do
    Application.put_env(:veloroute, :health, "ok")
  end

  def health_shutdown() do
    Application.put_env(:veloroute, :health, "shutdown")
  end
end
