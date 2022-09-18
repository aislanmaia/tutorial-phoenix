defmodule Tutorial.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields ~w/name description/a

  schema "categories" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  def changeset(attrs) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(module, attrs) do
    module
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
