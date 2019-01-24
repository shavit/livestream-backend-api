defmodule Livestream.Room.RoomSupervisor do
  use Supervisor
  alias Livestream.Room

  @doc false
  def init(_opts), do: Supervisor.init([Room], strategy: :simple_one_for_one)

  @doc false
  def start_link(_opts) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end
end
