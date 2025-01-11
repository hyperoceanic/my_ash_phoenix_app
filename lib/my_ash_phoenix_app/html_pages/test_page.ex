defmodule MyAshPhoenixApp.HTMLPages.TestPage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "test_pages" do
    field :test, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(test_page, attrs) do
    test_page
    |> cast(attrs, [:test])
    |> validate_required([:test])
  end
end
