defmodule TutorialWeb.CategoryController do
  use TutorialWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{hi: "hello"})
  end
end
