defmodule LearningElixir.Application do
  @moduledoc """
  Main entry point of the app
  """

  use Application

  def start(_type, _args) do
    children = [
      LearningElixir.Repo,
      {Phoenix.PubSub, [name: LearningElixir.PubSub, adapter: Phoenix.PubSub.PG2]},
      LearningElixirWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: LearningElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    LearningElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
