defmodule BitcoinPhoenixElixir.Repo.Migrations.CreateTotalNoBitcoins do
  use Ecto.Migration

  def change do
    create table(:total_no_bitcoins) do
      add :total_bitcoins, :integer

      timestamps()
    end

  end
end
