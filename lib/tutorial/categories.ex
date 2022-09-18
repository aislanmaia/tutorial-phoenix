defmodule Tutorial.Categories do
  alias Tutorial.Categories.Category
  alias Tutorial.Repo

  def all do
    Repo.all(Category)
  end

  def create(payload) do
    payload
    |> Category.changeset()
    |> Repo.insert()
  end
end
