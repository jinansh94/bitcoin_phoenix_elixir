defmodule BitcoinPhoenixElixir.Repo.Migrations.CreateComplexityOfBlocks do
  use Ecto.Migration

  def change do
    create table(:complexity_of_blocks) do
      add :complexity, :integer

      timestamps()
    end

  end
end
