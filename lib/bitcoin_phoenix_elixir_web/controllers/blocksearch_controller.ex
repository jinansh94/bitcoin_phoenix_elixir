defmodule BitcoinPhoenixElixirWeb.BlocksearchController do
  use BitcoinPhoenixElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "blocksearch.html")
  end
end
