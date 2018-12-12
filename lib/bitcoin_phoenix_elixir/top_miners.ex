defmodule BitcoinPhoenixElixir.Top_miners do
  use Ecto.Schema
  import Ecto.Changeset


  schema "top_miners" do
    field :eight_data, :integer
    field :eight_miner, :integer
    field :five_data, :integer
    field :five_miner, :integer
    field :four_data, :integer
    field :four_miner, :integer
    field :nine_data, :integer
    field :nine_miner, :integer
    field :one_data, :integer
    field :one_miner, :integer
    field :seven_data, :integer
    field :seven_miner, :integer
    field :six_data, :integer
    field :six_miner, :integer
    field :ten_data, :integer
    field :ten_miner, :integer
    field :three_data, :integer
    field :three_miner, :integer
    field :two_data, :integer
    field :two_miner, :integer

    timestamps()
  end

  @doc false
  def changeset(top_miners, attrs) do
    top_miners
    |> cast(attrs, [:one_miner, :one_data, :two_miner, :two_data, :three_miner, :three_data, :four_miner, :four_data, :five_miner, :five_data, :six_miner, :six_data, :seven_miner, :seven_data, :eight_miner, :eight_data, :nine_miner, :nine_data, :ten_miner, :ten_data])
    |> validate_required([:one_miner, :one_data, :two_miner, :two_data, :three_miner, :three_data, :four_miner, :four_data, :five_miner, :five_data, :six_miner, :six_data, :seven_miner, :seven_data, :eight_miner, :eight_data, :nine_miner, :nine_data, :ten_miner, :ten_data])
  end
end
