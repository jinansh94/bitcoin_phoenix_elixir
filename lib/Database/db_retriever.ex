defmodule BitcoinPhoenixElixir.DBRetriever do
  import Ecto.Query

  def append_zero(list) when length(list) < 20 do
    append_zero([0 | list])
  end

  def append_zero(list) do
    list
  end

  def get_unspent_tx() do
    query = from u in "unspent_tx",
    select: {u.id, u.total_us}

    {_, temp} = BitcoinPhoenixElixir.Repo.all(query)
    |> Enum.reverse() |> Enum.take(20) |> Enum.reverse()|> Enum.unzip()

    append_zero(temp)
  end

  def get_unverified_tx() do
    query = from u in "unverified_tx",
    select: {u.id, u.total_uv}

    {_, temp} = BitcoinPhoenixElixir.Repo.all(query)
    |> Enum.reverse() |> Enum.take(20) |> Enum.reverse()|> Enum.unzip()

    append_zero(temp)
  end

  def get_total_tx() do
    query = from u in "total_no_tx",
    select: {u.id, u.total_tx}

    {_, temp} = BitcoinPhoenixElixir.Repo.all(query)
    |> Enum.reverse() |> Enum.take(20) |> Enum.reverse()|> Enum.unzip()

    append_zero(temp)
  end

  def get_total_bitcoins() do
    query = from u in "total_no_bitcoins",
    select: {u.id, u.total_bitcoins}

    {_, temp} = BitcoinPhoenixElixir.Repo.all(query)
    |> Enum.reverse() |> Enum.take(20) |> Enum.reverse()|> Enum.unzip()

    append_zero(temp)
  end

  def get_complexity_blocks() do
    query = from u in "complexity_of_blocks",
    select: {u.id, u.complexity}

    {_, temp} = BitcoinPhoenixElixir.Repo.all(query)
    |> Enum.reverse() |> Enum.take(20) |> Enum.reverse()|> Enum.unzip()

    append_zero(temp)
  end

  def get_top_miners() do
    query = from u in "top_miners",
    select: {u.one_miner, u.two_miner, u.three_miner, u.four_miner, u.five_miner, u.six_miner, u.seven_miner, u.eight_miner, u.nine_miner, u.ten_miner}

    BitcoinPhoenixElixir.Repo.all(query) |> Enum.reverse() |> Enum.take(1) |> hd() |> Tuple.to_list() |> IO.inspect()
  end

  def get_top_miners_data() do
    query = from u in "top_miners",
    select: {u.one_data, u.two_data, u.three_data, u.four_data, u.five_data, u.six_data, u.seven_data, u.eight_data, u.nine_data, u.ten_data}

    BitcoinPhoenixElixir.Repo.all(query) |> Enum.reverse() |> Enum.take(1) |> hd() |> Tuple.to_list() |> IO.inspect()
  end

end
