defmodule BitcoinPhoenixElixir.Unspent_tx do
  use Ecto.Schema
  import Ecto.Changeset


  schema "unspent_tx" do
    field :total_us, :integer

    timestamps()
  end

  @doc false
  def changeset(unspent_tx, attrs) do
    unspent_tx
    |> cast(attrs, [:total_us])
    |> validate_required([:total_us])
  end
end
