defmodule Livestream.Repo do
  @moduledoc """
  `Livestream.Repo`
  """
  use GenServer

  @table :livestream_state

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    ref = :ets.new(@table, [:public, :named_table])
    state = %{ref: ref}
    {:ok, state}
  end

  @doc """
  all/0 returns all the rooms
  """
  def all do
    # :ets.select(@table, [{{:"$1", :"$2"}, [], [:"$2"]}])
    :ets.select(@table, [{{:"$1"}, [], [:"$1"]}])
  end

  @doc """
  add/1 adds a room
  """
  def add(name) do
    :ets.insert(@table, {name})
  end
end
