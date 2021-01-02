defmodule LivestreamWeb.RoomController do
  use LivestreamWeb, :controller

  def index(conn, params) do
    render(conn, "index.json", params)
  end

  def on_publish(conn, _params) do
    render(conn, "index.json")
  end

  def on_publish_done(conn, _params) do
    render(conn, "index.json")
  end

  def on_play(conn, _params) do
    render(conn, "index.json")
  end

  def on_play_done(conn, _params) do
    render(conn, "index.json")
  end

  def rooms(conn, _params) do
    render(conn, "rooms.json")
  end
end
