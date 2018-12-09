defmodule BitcoinPhoenixElixirWeb.PageController do
  use BitcoinPhoenixElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
