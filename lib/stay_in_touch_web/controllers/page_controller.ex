defmodule StayInTouchWeb.PageController do
  use StayInTouchWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
