defmodule BitcoinPhoenixElixirWeb.PageController do
  use BitcoinPhoenixElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def block(conn, params) do
    {block_number,_} =  Map.get(conn,:params) |> Map.get("block") |> Integer.parse

    b = GenServer.call(:mint_processor, {:get_block, block_number})
    #b = %BlockChain.Block{block_number: 12345}
    if(b == nil) do
      render(conn, "block_not_found.html")
    else
        conn = Map.put(conn, :params, %{"block" => hd(b)})
        render(conn, "block.html")
        
    end
    
    
  end
end
