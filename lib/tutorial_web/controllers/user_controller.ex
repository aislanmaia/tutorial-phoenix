defmodule TutorialWeb.UserController do
  use TutorialWeb, :controller
  action_fallback TutorialWeb.FallbackController

  alias Tutorial.Users.{Create, GetUser}
  alias TutorialWeb.Token

  def create(conn, params) do
    with {:ok, user} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("user_created.json", token: Token.create(user), user: user)
    end
  end

  # Just a simple example to call an action protected by authorization
  def show(conn, %{"id" => id}) do
    conn
    |> put_status(:ok)
    |> render("show.json", user: GetUser.call(id))
  end
end
