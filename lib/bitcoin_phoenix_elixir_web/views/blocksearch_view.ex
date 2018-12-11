defmodule BitcoinPhoenixElixirWeb.BlocksearchView do
  use BitcoinPhoenixElixirWeb, :view

  def block_height([block | _]) do
    block.block_number
  end

  def get_age([block | _]) do
    BitcoinPhoenixElixirWeb.PageView.get_timestamp(block)
  end

  def get_transactions([block | _]) do
    :erlang.length(block.transactions)
  end
  def get_miner([block | _]) do
    block.miner
  end
end
