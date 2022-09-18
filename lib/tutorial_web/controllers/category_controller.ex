defmodule TutorialWeb.CategoryController do
  use TutorialWeb, :controller
  alias Tutorial.Categories

  def index(conn, _params) do
    categories = Categories.all()

    conn
    |> put_status(:ok)
    |> render("index.json", categories: categories)
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.json", category: Categories.show(id))
  end

  def create(conn, %{"category" => category}) do
    {:ok, category} = Categories.create(category)

    conn
    |> put_status(:created)
    |> put_resp_header("location", Routes.category_path(conn, :show, category))
    |> render("show.json", category: category)
  end
end
