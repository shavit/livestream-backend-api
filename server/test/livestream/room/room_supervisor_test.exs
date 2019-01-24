defmodule Livestream.Room.RoomSupervisorTest do
  use ExUnit.Case

  describe "room supervisor" do
    alias Livestream.Room.RoomSupervisor

    test "start_link/1 starts a room supervisor" do
      assert {:ok, _pid} = RoomSupervisor.start_link nil
    end
  end
end
