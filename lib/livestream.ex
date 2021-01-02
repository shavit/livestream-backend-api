defmodule Livestream do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    :ets.new(:livestream_state, [:public, :named_table])

    children = [
      Plug.Cowboy.child_spec(scheme: :http, plug: Livestream.Router, options: [port: Application.get_env(:livestream, :port)])
    ]

    opts = [strategy: :one_for_one, name: Livestream.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
