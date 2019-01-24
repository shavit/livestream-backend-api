defmodule Livestream.Room do
  @moduledoc """
  Room is a media stream of a user
  """
  use GenServer

  @doc false
  def init(_opts), do: {:ok, nil}

  @doc false
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end
end
