defmodule TutorialWeb.FallbackController do
  use TutorialWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(TutorialWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end
end
