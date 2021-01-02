defmodule LivestreamWeb.RoomView do
  use LivestreamWeb, :view

  def render("index.json", _args) do
    %{data: []}
  end

  def render("rooms.json", _args) do
    %{rooms: []}
  end
end
