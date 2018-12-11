defmodule BitcoinPhoenixElixir.Repo.Migrations.CreateUnverifiedTx do
  use Ecto.Migration

  def change do
    create table(:unverified_tx) do
      add :total_uv, :integer

      timestamps()
    end

  end
end
