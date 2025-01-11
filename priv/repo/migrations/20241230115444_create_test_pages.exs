defmodule MyAshPhoenixApp.Repo.Migrations.CreateTestPages do
  use Ecto.Migration

  def change do
    create table(:test_pages) do
      add :test, :string

      timestamps(type: :utc_datetime)
    end
  end
end
