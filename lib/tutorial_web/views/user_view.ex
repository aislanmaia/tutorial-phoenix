defmodule TutorialWeb.UserView do
  use TutorialWeb, :view

  def render("show.json", %{user: user}) do
    render_one(user, __MODULE__, "user.json")
  end

  def render("user_created.json", %{token: token, user: user}) do
    %{
      user: %{
        id: user.id,
        name: user.name,
        email: user.email
      },
      token: token
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      email: user.email
    }
  end
end
