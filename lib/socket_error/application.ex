defmodule SocketError.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SocketErrorWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SocketError.PubSub},
      # Start the Endpoint (http/https)
      SocketErrorWeb.Endpoint
      # Start a worker by calling: SocketError.Worker.start_link(arg)
      # {SocketError.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SocketError.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SocketErrorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
