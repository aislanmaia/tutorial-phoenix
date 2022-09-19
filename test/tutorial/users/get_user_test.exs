defmodule Tutorial.Users.GetUserTest do
  use TutorialWeb.ConnCase
  alias Tutorial.Users.{Create, GetUser}

  describe "Get user action" do
    test "should get a user given a id" do
      {:ok, %{id: id}} = Create.call(%{name: "Teste", email: "teste@email.com"})
      user = GetUser.call(id)
      assert user.id == id
    end
  end
end
