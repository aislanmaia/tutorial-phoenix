defmodule Tutorial.Users.Create do
  alias Tutorial.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
