defmodule Livestream.RoomSupervisor do
  @moduledoc """
  `Livestream.RoomSupervisor`
  """
  use DynamicSupervisor
  alias Livestream.Room

  def start_link(args) do
    DynamicSupervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_args) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  @doc """
  add/1 creates a new room
  """
  def add(owner) do
    if exists?(owner) do
      room = find_room(owner)
      {:ok, room.id}
    else
      create_room(owner)
    end
  end

  defp create_room(owner) do
    id =
      '0123456789ABCDEFGHIJKLMNOPQRTSUVWXYZabcdefghijklmnopqrstuvwxyz'
      |> Enum.take_random(6)
      |> List.to_string()

    opts = [id: id, owner: owner]

    spec = %{
      id: id,
      type: :worker,
      start: {Room, :start_link, [opts]},
      restart: :temporary
    }

    {:ok, _pid} = DynamicSupervisor.start_child(__MODULE__, spec)
    {:ok, id}
  end

  @doc """
   rooms/0 returns the room list"
  """
  def rooms do
    __MODULE__
    |> DynamicSupervisor.which_children()
    |> Enum.map(fn {_undefined, pid, _type, _args} ->
      GenServer.call(pid, :describe)
    end)
  end

  defp exists?(room_owner) do
    rooms |> Enum.filter(fn %{owner: id} -> id == room_owner end) |> Enum.any?()
  end

  defp find_room(room_owner) do
    rooms |> Enum.filter(fn %{owner: id} -> id == room_owner end) |> List.first()
  end
end
