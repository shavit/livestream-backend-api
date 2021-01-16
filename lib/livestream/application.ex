defmodule Livestream.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  alias Livestream.Repo
  alias Livestream.RoomSupervisor
  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LivestreamWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Livestream.PubSub},
      # Start the Endpoint (http/https)
      LivestreamWeb.Endpoint,
      # Start a worker by calling: Livestream.Worker.start_link(arg)
      # {Livestream.Worker, arg}

      RoomSupervisor,
      Repo
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Livestream.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LivestreamWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
