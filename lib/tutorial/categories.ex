defmodule Tutorial.Categories do
  alias Tutorial.Categories.Category
  alias Tutorial.Repo

  def all do
    Repo.all(Category)
  end
end
