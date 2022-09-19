defmodule Tutorial.Users.GetUser do
  alias Tutorial.{Repo, User}

  def call(params) do
    params
    |> validate()
    |> find_user()
  end

  defp validate(id), do: id != nil && id

  defp find_user(id), do: Repo.get(User, id)
end
