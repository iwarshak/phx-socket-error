defmodule SocketErrorWeb.MainChannel do
  use Phoenix.Channel

  def join("main", _message, socket) do
    # :timer.sleep(1000)
    {:ok, socket}
  end
end
