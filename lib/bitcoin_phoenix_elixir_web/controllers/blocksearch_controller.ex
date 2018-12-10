defmodule BitcoinPhoenixElixirWeb.BlocksearchController do
  use BitcoinPhoenixElixirWeb, :controller

  def index(conn, _params) do

    list_of_blocks = GenServer.call(:mint_processor ,:get_last_five_blocks)

    [head_1 | tail_1] = list_of_blocks
    [head_2 | tail_2] = tail_1
    [head_3 | tail_3] = tail_2
    [head_4 | tail_4] = tail_3
    [head_5 | _tail_5] = tail_4

    conn = Map.put(conn, :params, %{"list_blocks_1" => head_1, "list_blocks_2" => head_2, "list_blocks_3" => head_3 , "list_blocks_4" => head_4, "list_blocks_5" => head_5})
    render(conn, "blocksearch.html")
  end



end
