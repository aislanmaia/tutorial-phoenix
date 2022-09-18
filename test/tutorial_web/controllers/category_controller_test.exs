defmodule TutorialWeb.CategoryControllerTest do
  use TutorialWeb.ConnCase

  describe "List categories" do
    test "list all categories", %{conn: conn} do
      conn = get(conn, Routes.category_path(conn, :index))

      assert json_response(conn, 200) == []
    end
  end
end
