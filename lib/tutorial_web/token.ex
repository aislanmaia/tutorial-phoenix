defmodule TutorialWeb.Token do
  alias Phoenix.Token
  alias TutorialWeb.Endpoint
  alias Tutorial.User

  @salt "banana_token"
  @ttl 86_400 #seconds = 24h

  def create(%User{id: user_id}) do
    Token.sign(Endpoint, @salt, %{user_id: user_id})
  end

  def verify(token) do
    case Token.verify(Endpoint, @salt, token, max_age: @ttl) do
      {:ok, _user_data} = response -> response
      _error -> {:error, :unauthorized}
    end
  end
end
