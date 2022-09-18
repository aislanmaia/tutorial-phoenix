defmodule TutorialWeb.ChangesetView do
  use TutorialWeb, :view

  def render("error.json", %{changeset: changeset}) do
    errors = Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
    %{errors: errors}
  end
end
