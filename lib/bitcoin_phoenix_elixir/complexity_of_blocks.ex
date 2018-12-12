defmodule BitcoinPhoenixElixir.Complexity_of_blocks do
  use Ecto.Schema
  import Ecto.Changeset


  schema "complexity_of_blocks" do
    field :complexity, :integer

    timestamps()
  end

  @doc false
  def changeset(complexity_of_blocks, attrs) do
    complexity_of_blocks
    |> cast(attrs, [:complexity])
    |> validate_required([:complexity])
  end
end
