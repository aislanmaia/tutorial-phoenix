defmodule TutorialWeb.AuthPlug do
  import Plug.Conn

  alias Phoenix.Controller
  alias TutorialWeb.Token

  def init(opts), do: opts

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, %{user_id: user_id}} <- Token.verify(token) do
      assign(conn, :user_id, user_id)
    else
      [] -> handle_error(conn)
      {:error, _reason} -> handle_error(conn)
    end
  end

  defp handle_error(conn) do
    conn
    |> put_status(:unauthorized)
    |> Controller.put_view(TutorialWeb.ErrorView)
    |> Controller.render("401.json")
    |> halt()
  end
end
