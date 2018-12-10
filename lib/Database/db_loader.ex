defmodule BitcoinPhoenixElixir.DBLoader do

  alias BitcoinPhoenixElixir.{Repo, Unspent_tx}

  def insertIntoDb() do
    receive do
      :hello -> nil
    after
      15_000 ->
        total_tx = GenServer.call(:mint_processor, :get_unspent_transaction_count)
        Repo.insert(%Unspent_tx{total_us: total_tx})
    end
  end


end
