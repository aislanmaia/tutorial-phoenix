defmodule TutorialWeb.UserControllerTest do
  # use ExUnit.Case
  use TutorialWeb.ConnCase
  # doctest TutorialWeb.UserController
  alias Tutorial.Users.Create
  alias TutorialWeb.Token
  alias Tutorial.User

  describe "When creating a new user" do
    test "should create an user and return a token", %{conn: conn} do
      params = %{name: "Teste", email: "teste@example.com"}
      conn = post(conn, Routes.user_path(conn, :create, params))
      assert %{"token" => token, "user" => user} = json_response(conn, 201)
      assert params == %{name: user["name"], email: user["email"]}
      assert token != nil
    end

    test "should throw when category name already exists", %{conn: conn} do
      user_payload = %{name: "Teste", email: "teste@example.com"}
      Create.call(user_payload)
      conn = post(conn, Routes.user_path(conn, :create, user_payload))
      assert "has already been taken" in json_response(conn, 422)["errors"]["email"]
    end
  end

  describe "When obtaining an existing user" do
    test "should get an user by id", %{conn: conn} do
      user_payload = %{name: "Teste", email: "teste@example.com"}
      {_, %{id: id, name: name, email: email}} = Create.call(user_payload)

      conn =
        conn
        |> put_req_header("accept", "application/json")
        |> put_req_header("authorization", "Bearer " <> Token.create(%User{id: id}))

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{"id" => ^id, "name" => ^name, "email" => ^email} = json_response(conn, 200)
    end
  end
end
