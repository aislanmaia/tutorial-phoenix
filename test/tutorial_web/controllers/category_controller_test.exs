defmodule TutorialWeb.CategoryControllerTest do
  use TutorialWeb.ConnCase
  alias Tutorial.Categories

  describe "Categories" do
    test "should list all categories", %{conn: conn} do
      conn = get(conn, Routes.category_path(conn, :index))

      assert json_response(conn, 200) == []
    end

    test "should create a category", %{conn: conn} do
      category = %{name: "Sport", description: "pumpkin"}
      conn = post(conn, Routes.category_path(conn, :create, category: category))
      {_, body} = Jason.decode(conn.resp_body)

      assert json_response(conn, 201) ==
               %{
                 "description" => conn.assigns.category.description,
                 "id" => conn.assigns.category.id,
                 "name" => conn.assigns.category.name
               }

      assert json_response(conn, 201) == body

      assert %{"id" => id, "name" => _name, "description" => _description} =
               json_response(conn, 201)
    end

    test "should show a category", %{conn: conn} do
      category = %{name: "Sport", description: "pumpkin"}
      {_, %{id: id}} = Categories.create(category)
      # conn = post(conn, Routes.category_path(conn, :create, category: category))

      # assert %{"id" => id} = json_response(conn, 201)

      conn = get(conn, Routes.category_path(conn, :show, id))
      # id = cat.id

      assert %{"id" => ^id, "description" => "pumpkin", "name" => "SPORT"} =
               json_response(conn, 200)
    end

    test "should throw when category name already exists", %{conn: conn} do
      category = %{name: "Sport", description: "pumpkin"}
      Categories.create(category)
      conn = post(conn, Routes.category_path(conn, :create, category: category))
      assert "has already been taken" in json_response(conn, 422)["errors"]["name"]
    end
  end
end
