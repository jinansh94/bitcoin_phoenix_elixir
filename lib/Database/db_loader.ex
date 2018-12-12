defmodule BitcoinPhoenixElixir.DBLoader do

  alias BitcoinPhoenixElixir.{Repo, Unspent_tx, Unverified_tx, Total_no_tx, Total_no_bitcoins, Complexity_of_blocks, Top_miners}

  def insertIntoDb() do
    receive do
      :hello -> nil
    after
      15_000 ->

        {us_txs, uv_txs, total_txs, top_ten, total_no_bitcoins, complexity_block} = GenServer.call(:mint_processor, :get_graph_data)

        Repo.insert(%Unspent_tx{total_us: us_txs})

        Repo.insert(%Unverified_tx{total_uv: uv_txs})

        Repo.insert(%Total_no_tx{total_tx: total_txs})

        {top_ten_miner, top_ten_data} = top_ten |> Enum.unzip()
        default = -1

        Repo.insert(%Top_miners{one_miner: Enum.at(top_ten_miner, 0, default), one_data: Enum.at(top_ten_data, 0, 0),two_miner: Enum.at(top_ten_miner, 1, default), two_data: Enum.at(top_ten_data, 1, 0),three_miner: Enum.at(top_ten_miner, 2, default), three_data: Enum.at(top_ten_data, 2, 0),four_miner: Enum.at(top_ten_miner, 3, default), four_data: Enum.at(top_ten_data, 3, 0),five_miner: Enum.at(top_ten_miner, 4, default), five_data: Enum.at(top_ten_data, 4, 0),six_miner: Enum.at(top_ten_miner, 5, default), six_data: Enum.at(top_ten_data, 5, 0),seven_miner: Enum.at(top_ten_miner, 6, default), seven_data: Enum.at(top_ten_data, 6, 0),eight_miner: Enum.at(top_ten_miner, 7, default), eight_data: Enum.at(top_ten_data, 7, 0),nine_miner: Enum.at(top_ten_miner, 8, default), nine_data: Enum.at(top_ten_data, 8, 0),ten_miner: Enum.at(top_ten_miner, 9, default), ten_data: Enum.at(top_ten_data, 9, 0)})

        Repo.insert(%Total_no_bitcoins{total_bitcoins: total_no_bitcoins})

        Repo.insert(%Complexity_of_blocks{complexity: complexity_block})

        insertIntoDb()
    end
  end


end

