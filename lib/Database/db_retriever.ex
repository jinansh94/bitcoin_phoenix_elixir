defmodule BitcoinPhoenixElixir.DBRetriever do
  import Ecto.Query

  def get_unspent_tx() do
    query = from u in "unspent_tx",
    select: {u.id, u.total_us}

    BitcoinPhoenixElixir.Repo.all(query)
  end
end
