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
      assert category.name == String.upcase(payload.name)
      assert category.description == payload.description
    end

    test "should throw an error when category name is already taken" do
      payload = %{name: "Sport", description: "Some description"}

      assert {:ok, _} = Categories.create(payload)
      assert {:error, changeset} = Categories.create(payload)
      assert "has already been taken" in errors_on(changeset).name
      assert %{name: ["has already been taken"]} = errors_on(changeset)
    end
  end
end
