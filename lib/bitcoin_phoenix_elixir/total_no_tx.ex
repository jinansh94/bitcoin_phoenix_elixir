defmodule BitcoinPhoenixElixir.Total_no_tx do
  use Ecto.Schema
  import Ecto.Changeset


  schema "total_no_tx" do
    field :total_tx, :integer

    timestamps()
  end

  @doc false
  def changeset(total_no_tx, attrs) do
    total_no_tx
    |> cast(attrs, [:total_tx])
    |> validate_required([:total_tx])
  end
end
