defmodule TutorialWeb.CategoryController do
  use TutorialWeb, :controller
  alias Tutorial.Categories

  def index(conn, _params) do
    categories = Categories.all()

    conn
    |> put_status(:ok)
    |> render("index.json", categories: categories)
  end
end
