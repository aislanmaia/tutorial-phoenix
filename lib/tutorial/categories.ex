defmodule Tutorial.Categories do
  alias Tutorial.Categories.Category
  alias Tutorial.Repo

  def all do
    Repo.all(Category)
  end

  def show(id), do: Repo.get(Category, id)

  def create(payload) do
    payload
    |> Category.changeset()
    |> Repo.insert()
  end
end
