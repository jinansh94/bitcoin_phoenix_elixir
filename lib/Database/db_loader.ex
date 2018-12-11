defmodule BitcoinPhoenixElixir.DBLoader do

  alias BitcoinPhoenixElixir.{Repo, Unspent_tx}

  def insertIntoDb() do
    receive do
      :hello -> nil
    after
      15_000 ->

        {us_txs, uv_txs, total_txs, top_ten, total_no_bitcoins, complexity_block} = GenServer.call(:mint_processor, :get_graph_data)

        Repo.insert(%Unspent_tx{total_us: us_txs})

        #Repo.insert(%Unverified_tx{total_uv: uv_txs})

        # Repo.insert(%Unspent_tx{total_tx: total_txs})

        # {top_ten_miner, top_ten_data} = top_ten |> Enum.unzip()
        # ##### write for that

        # Repo.insert(%Unspent_tx{total_bitcoins: total_no_bitcoins})

        # Repo.insert(%Unspent_tx{complexity: complexity_block})

        insertIntoDb()
    end
  end


end
