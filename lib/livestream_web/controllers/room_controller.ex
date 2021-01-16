defmodule LivestreamWeb.RoomController do
  use LivestreamWeb, :controller
  require Logger
  alias Livestream.RoomSupervisor, as: Rooms

  def index(conn, params) do
    render(conn, "index.json", params)
  end

  def on_publish(conn, %{"app" => id, "clientId" => _cilent} = params) do
    Logger.debug("on_publish #{inspect(params)}")

    case Rooms.room_by_id(id) do
      %{id: ^id} -> send_resp(conn, 200, "ok")
      _nil -> send_resp(conn, 404, "room not found")
    end

    # render(conn, "index.json")
  end

  def on_publish_done(conn, params) do
    Logger.debug("on_publish_done #{inspect(params)}")
    render(conn, "index.json")
  end

  def on_play(conn, %{"app" => id, "clientId" => _cilent} = params) do
    Logger.debug("on_play #{inspect(params)}")

    case Rooms.room_by_id(id) do
      %{id: ^id} -> send_resp(conn, 200, "ok")
      _nil -> send_resp(conn, 404, "room not found")
    end

    # render(conn, "index.json")
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
    rooms = Rooms.rooms()
    render(conn, "rooms.json", rooms: rooms)
  end
end
