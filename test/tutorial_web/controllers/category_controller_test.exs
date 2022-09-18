defmodule TutorialWeb.CategoryControllerTest do
  use TutorialWeb.ConnCase

  describe "List categories" do
    test "list all categories", %{conn: conn} do
      conn = get(conn, "/api/categories")
      assert json_response(conn, 200) == %{"hi" => "hello"}
    end
  end
end
