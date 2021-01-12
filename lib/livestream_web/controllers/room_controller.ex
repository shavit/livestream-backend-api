defmodule LivestreamWeb.RoomController do
  use LivestreamWeb, :controller
  require Logger

  def index(conn, params) do
    render(conn, "index.json", params)
  end

  def on_publish(conn, params) do
    Logger.debug("on_publish #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_publish_done(conn, params) do
    Logger.debug("on_publish_done #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_play(conn, params) do
    Logger.debug("on_play #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_play_done(conn, params) do
    Logger.debug("on_play_done #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_update(conn, params) do
    Logger.debug("on_update #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_record_done(conn, params) do
    Logger.debug("on_record_done #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_done(conn, params) do
    Logger.debug("on_done #{inspect(params)}")
    render(conn, "index.json")
  end

  def rooms(conn, params) do
    render(conn, "rooms.json")
  end
end
