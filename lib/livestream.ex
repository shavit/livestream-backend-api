defmodule Livestream do
  @moduledoc """
  Livestream keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false


    children = [
      Plug.Cowboy.child_spec(scheme: :http, plug: Livestream.Router, options: [port: Application.get_env(:livestream, :port)])
    ]

    opts = [strategy: :one_for_one, name: Livestream.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
