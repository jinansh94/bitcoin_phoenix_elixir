defmodule BitcoinPhoenixElixirWeb.BlocksearchView do
  use BitcoinPhoenixElixirWeb, :view

  def block_height(block) do
    Map.get(block, :block_number)
  end
end
