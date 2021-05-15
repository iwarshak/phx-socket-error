defmodule SocketErrorWeb.PageController do
  use SocketErrorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
