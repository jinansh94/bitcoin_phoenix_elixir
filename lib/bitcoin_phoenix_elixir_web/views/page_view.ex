defmodule BitcoinPhoenixElixirWeb.PageView do
  use BitcoinPhoenixElixirWeb, :view



  def get_block_number(block) do
    Map.get(block, :block_number)
    
  end
end
