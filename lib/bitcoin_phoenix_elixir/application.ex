defmodule BitcoinPhoenixElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      BitcoinPhoenixElixir.Repo,
      # Start the endpoint when the application starts
      BitcoinPhoenixElixirWeb.Endpoint,
      # Starts a worker by calling: BitcoinPhoenixElixir.Worker.start_link(arg)
      # {BitcoinPhoenixElixir.Worker, arg},
      %{id: :mint_super, restart: :temporary, start: {MintProcessor.MintSupervisor, :start_link, [nil]}},
      %{id: :user_super, restart: :temporary, start: {User.BitcoinSupervisor, :start_link, [nil]}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options

    opts = [strategy: :one_for_one, name: BitcoinPhoenixElixir.Supervisor]
    x = Supervisor.start_link(children, opts)

    Ecto.Adapters.SQL.query(BitcoinPhoenixElixir.Repo, "DELETE from unverified_tx", [])
    Ecto.Adapters.SQL.query(BitcoinPhoenixElixir.Repo, "DELETE from unspent_tx", [])
    Ecto.Adapters.SQL.query(BitcoinPhoenixElixir.Repo, "DELETE from complexity_of_blocks", [])
    Ecto.Adapters.SQL.query(BitcoinPhoenixElixir.Repo, "DELETE from top_miners", [])
    Ecto.Adapters.SQL.query(BitcoinPhoenixElixir.Repo, "DELETE from total_no_bitcoins", [])
    Ecto.Adapters.SQL.query(BitcoinPhoenixElixir.Repo, "DELETE from total_no_tx", [])

    Bitcoin.inin()
    spawn(BitcoinPhoenixElixir.DBLoader, :insertIntoDb, [])
    x
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BitcoinPhoenixElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
