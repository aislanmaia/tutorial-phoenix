defmodule Tutorial.CategoriesTest do
  use Tutorial.DataCase
  alias Tutorial.Categories
  alias Tutorial.Categories.Category

  describe "give a call to list categories" do
    test "should return all" do
      assert Categories.all() == []
    end
  end

  describe "give informations about categories" do
    test "should create one" do
      payload = %{name: "Sport", description: "Some description"}

      assert {:ok, %Category{} = category} = Categories.create(payload)
      assert category.name == payload.name
      assert category.description == payload.description
    end
  end
end
