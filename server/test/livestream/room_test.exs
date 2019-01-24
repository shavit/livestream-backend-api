defmodule Livestream.RoomTest do
  use ExUnit.Case

  describe "room" do
    alias Livestream.Room

    test "start_link/1 starts a room server" do
      assert {:ok, _pid} = Room.start_link nil
    end
  end
end
