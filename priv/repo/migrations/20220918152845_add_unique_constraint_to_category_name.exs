defmodule Tutorial.Repo.Migrations.AddUniqueConstraintToCategoryName do
  use Ecto.Migration

  def change do
    create unique_index(:categories, [:name])
  end
end
