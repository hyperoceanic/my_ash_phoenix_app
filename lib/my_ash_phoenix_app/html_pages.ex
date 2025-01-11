defmodule MyAshPhoenixApp.HTMLPages do
  @moduledoc """
  The HTMLPages context.
  """

  import Ecto.Query, warn: false
  alias MyAshPhoenixApp.Repo

  alias MyAshPhoenixApp.HTMLPages.TestPage

  @doc """
  Returns the list of test_pages.

  ## Examples

      iex> list_test_pages()
      [%TestPage{}, ...]

  """
  def list_test_pages do
    Repo.all(TestPage)
  end

  @doc """
  Gets a single test_page.

  Raises `Ecto.NoResultsError` if the Test page does not exist.

  ## Examples

      iex> get_test_page!(123)
      %TestPage{}

      iex> get_test_page!(456)
      ** (Ecto.NoResultsError)

  """
  def get_test_page!(id), do: Repo.get!(TestPage, id)

  @doc """
  Creates a test_page.

  ## Examples

      iex> create_test_page(%{field: value})
      {:ok, %TestPage{}}

      iex> create_test_page(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_test_page(attrs \\ %{}) do
    %TestPage{}
    |> TestPage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a test_page.

  ## Examples

      iex> update_test_page(test_page, %{field: new_value})
      {:ok, %TestPage{}}

      iex> update_test_page(test_page, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_test_page(%TestPage{} = test_page, attrs) do
    test_page
    |> TestPage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a test_page.

  ## Examples

      iex> delete_test_page(test_page)
      {:ok, %TestPage{}}

      iex> delete_test_page(test_page)
      {:error, %Ecto.Changeset{}}

  """
  def delete_test_page(%TestPage{} = test_page) do
    Repo.delete(test_page)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking test_page changes.

  ## Examples

      iex> change_test_page(test_page)
      %Ecto.Changeset{data: %TestPage{}}

  """
  def change_test_page(%TestPage{} = test_page, attrs \\ %{}) do
    TestPage.changeset(test_page, attrs)
  end
end
