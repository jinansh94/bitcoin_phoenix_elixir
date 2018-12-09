defmodule BitcoinPhoenixElixir.Repo do
  use Ecto.Repo,
    otp_app: :bitcoin_phoenix_elixir,
    adapter: Ecto.Adapters.Postgres
end
