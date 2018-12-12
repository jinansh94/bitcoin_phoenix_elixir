defmodule BitcoinPhoenixElixir.Repo.Migrations.CreateTotalNoTx do
  use Ecto.Migration

  def change do
    create table(:total_no_tx) do
      add :total_tx, :integer

      timestamps()
    end

  end
end
