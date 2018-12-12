defmodule BitcoinPhoenixElixir.Repo.Migrations.CreateTopMiners do
  use Ecto.Migration

  def change do
    create table(:top_miners) do
      add :one_miner, :integer
      add :one_data, :integer
      add :two_miner, :integer
      add :two_data, :integer
      add :three_miner, :integer
      add :three_data, :integer
      add :four_miner, :integer
      add :four_data, :integer
      add :five_miner, :integer
      add :five_data, :integer
      add :six_miner, :integer
      add :six_data, :integer
      add :seven_miner, :integer
      add :seven_data, :integer
      add :eight_miner, :integer
      add :eight_data, :integer
      add :nine_miner, :integer
      add :nine_data, :integer
      add :ten_miner, :integer
      add :ten_data, :integer

      timestamps()
    end

  end
end
