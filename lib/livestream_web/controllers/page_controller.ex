defmodule LivestreamWeb.PageController do
  use LivestreamWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
