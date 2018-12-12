defmodule BitcoinPhoenixElixir.Total_no_bitcoins do
  use Ecto.Schema
  import Ecto.Changeset


  schema "total_no_bitcoins" do
    field :total_bitcoins, :integer

    timestamps()
  end

  @doc false
  def changeset(total_no_bitcoins, attrs) do
    total_no_bitcoins
    |> cast(attrs, [:total_bitcoins])
    |> validate_required([:total_bitcoins])
  end
end
