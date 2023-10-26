defmodule PropagandaMachine.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PropagandaMachineWeb.Telemetry,
      # Start the Ecto repository
      PropagandaMachine.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PropagandaMachine.PubSub},
      # Start Finch
      {Finch, name: PropagandaMachine.Finch},
      # Start the Endpoint (http/https)
      PropagandaMachineWeb.Endpoint
      # Start a worker by calling: PropagandaMachine.Worker.start_link(arg)
      # {PropagandaMachine.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PropagandaMachine.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PropagandaMachineWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
