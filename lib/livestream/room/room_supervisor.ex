defmodule Livestream.Room.RoomSupervisor do
  @moduledoc """
  `Livestream.Room.RoomSupervisor`
  """
  use DynamicSupervisor
  alias Livestream.Room

  @doc false
  def start_link(opts) do
    DynamicSupervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @doc false
  def init(_opts), do: Supervisor.init(strategy: :one_for_one)

  @doc """
  add/1 creates a new room
  """
  def add(opts) do
    spec = %{
      id: "room-#{:os.system_time()}",
      type: :worker,
      start: {Room, :start_link, [opts]},
      restart: :temporary
    }

    DynamicSupervisor.start_child(__MODULE__, spec)
  end
end
