defmodule BitcoinPhoenixElixir.Repo.Migrations.CreateUnspentTx do
  use Ecto.Migration

  def change do
    create table(:unspent_tx) do
      add :total_us, :integer

      timestamps()
    end

  end
end
