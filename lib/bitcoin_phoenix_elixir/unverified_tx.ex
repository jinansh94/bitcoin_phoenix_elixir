defmodule BitcoinPhoenixElixir.Unverified_tx do
  use Ecto.Schema
  import Ecto.Changeset


  schema "unverified_tx" do
    field :total_uv, :integer

    timestamps()
  end

  @doc false
  def changeset(unverified_tx, attrs) do
    unverified_tx
    |> cast(attrs, [:total_uv])
    |> validate_required([:total_uv])
  end
end
