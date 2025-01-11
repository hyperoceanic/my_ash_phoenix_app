defmodule MyAshPhoenixAppWeb.TestPageController do
  use MyAshPhoenixAppWeb, :controller

  alias MyAshPhoenixApp.HTMLPages
  alias MyAshPhoenixApp.HTMLPages.TestPage

  def index(conn, _params) do
    test_pages = HTMLPages.list_test_pages()
    render(conn, :index, test_pages: test_pages)
  end

  def new(conn, _params) do
    changeset = HTMLPages.change_test_page(%TestPage{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"test_page" => test_page_params}) do
    case HTMLPages.create_test_page(test_page_params) do
      {:ok, test_page} ->
        conn
        |> put_flash(:info, "Test page created successfully.")
        |> redirect(to: ~p"/test_pages/#{test_page}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    test_page = HTMLPages.get_test_page!(id)
    render(conn, :show, test_page: test_page)
  end

  def edit(conn, %{"id" => id}) do
    test_page = HTMLPages.get_test_page!(id)
    changeset = HTMLPages.change_test_page(test_page)
    render(conn, :edit, test_page: test_page, changeset: changeset)
  end

  def update(conn, %{"id" => id, "test_page" => test_page_params}) do
    test_page = HTMLPages.get_test_page!(id)

    case HTMLPages.update_test_page(test_page, test_page_params) do
      {:ok, test_page} ->
        conn
        |> put_flash(:info, "Test page updated successfully.")
        |> redirect(to: ~p"/test_pages/#{test_page}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, test_page: test_page, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    test_page = HTMLPages.get_test_page!(id)
    {:ok, _test_page} = HTMLPages.delete_test_page(test_page)

    conn
    |> put_flash(:info, "Test page deleted successfully.")
    |> redirect(to: ~p"/test_pages")
  end
end
