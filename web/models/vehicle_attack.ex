defmodule EdgeBuilder.Models.VehicleAttack do
  use EdgeBuilder.Web, :model

  schema "vehicle_attacks" do
    field :weapon_name, :string
    field :firing_arc, :string
    field :range, :string
    field :specials, :string
    field :damage, :string
    field :critical, :string
    field :display_order, :integer, default: 0
    belongs_to :vehicle, Vehicle
  end

  def changeset(vehicle_attack, params \\ %{}) do
    vehicle_attack
    |> cast(params, [], ~w(vehicle_id weapon_name firing_arc range specials damage critical display_order))
  end

  def is_default_changeset?(changeset) do
    default = struct(__MODULE__)

    Enum.all?([:weapon_name ,:firing_arc ,:range ,:specials ,:damage ,:critical ,:display_order], fn field ->
      Ecto.Changeset.get_field(changeset, field) == Map.fetch!(default, field)
    end)
  end
end