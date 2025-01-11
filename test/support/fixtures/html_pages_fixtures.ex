defmodule MyAshPhoenixApp.HTMLPagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyAshPhoenixApp.HTMLPages` context.
  """

  @doc """
  Generate a test_page.
  """
  def test_page_fixture(attrs \\ %{}) do
    {:ok, test_page} =
      attrs
      |> Enum.into(%{
        test: "some test"
      })
      |> MyAshPhoenixApp.HTMLPages.create_test_page()

    test_page
  end
end
