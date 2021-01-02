defmodule Livestream.Room do
  @moduledoc """
  `Livestream.Room` is a media stream of a user
  """
  use GenServer

  @doc false
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @doc false
  def init(_opts) do
    #:ets.new(:livestream_state, [:public, :named_table])

    {:ok, nil}
  end
end
