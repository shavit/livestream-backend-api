defmodule Livestream.Room do
  @moduledoc """
  `Livestream.Room` is a media stream of a user
  """
  use GenServer

  @doc false
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  @doc false
  def init(opts) do
    state = %{
      id: Keyword.get(opts, :id),
      owner: Keyword.get(opts, :owner)
    }

    {:ok, state}
  end

  def handle_call(:describe, _from, state) do
    desc = %{
      id: state.id,
      owner: state.owner,
      users: []
    }

    {:reply, desc, state}
  end
end
