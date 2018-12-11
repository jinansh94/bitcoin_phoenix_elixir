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

  def get_unverified_tx() do
    query = from u in "total_no_tx",
    select: {u.id, u.total_tx}

    {_, temp} = BitcoinPhoenixElixir.Repo.all(query)
    |> Enum.reverse() |> Enum.take(20) |> Enum.reverse()|> Enum.unzip()

    append_zero(temp)
  end



end
