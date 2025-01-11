defmodule MyAshPhoenixAppWeb.TestPageControllerTest do
  use MyAshPhoenixAppWeb.ConnCase

  import MyAshPhoenixApp.HTMLPagesFixtures

  @create_attrs %{test: "some test"}
  @update_attrs %{test: "some updated test"}
  @invalid_attrs %{test: nil}

  describe "index" do
    test "lists all test_pages", %{conn: conn} do
      conn = get(conn, ~p"/test_pages")
      assert html_response(conn, 200) =~ "Listing Test pages"
    end
  end

  describe "new test_page" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/test_pages/new")
      assert html_response(conn, 200) =~ "New Test page"
    end
  end

  describe "create test_page" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/test_pages", test_page: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/test_pages/#{id}"

      conn = get(conn, ~p"/test_pages/#{id}")
      assert html_response(conn, 200) =~ "Test page #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/test_pages", test_page: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Test page"
    end
  end

  describe "edit test_page" do
    setup [:create_test_page]

    test "renders form for editing chosen test_page", %{conn: conn, test_page: test_page} do
      conn = get(conn, ~p"/test_pages/#{test_page}/edit")
      assert html_response(conn, 200) =~ "Edit Test page"
    end
  end

  describe "update test_page" do
    setup [:create_test_page]

    test "redirects when data is valid", %{conn: conn, test_page: test_page} do
      conn = put(conn, ~p"/test_pages/#{test_page}", test_page: @update_attrs)
      assert redirected_to(conn) == ~p"/test_pages/#{test_page}"

      conn = get(conn, ~p"/test_pages/#{test_page}")
      assert html_response(conn, 200) =~ "some updated test"
    end

    test "renders errors when data is invalid", %{conn: conn, test_page: test_page} do
      conn = put(conn, ~p"/test_pages/#{test_page}", test_page: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Test page"
    end
  end

  describe "delete test_page" do
    setup [:create_test_page]

    test "deletes chosen test_page", %{conn: conn, test_page: test_page} do
      conn = delete(conn, ~p"/test_pages/#{test_page}")
      assert redirected_to(conn) == ~p"/test_pages"

      assert_error_sent 404, fn ->
        get(conn, ~p"/test_pages/#{test_page}")
      end
    end
  end

  defp create_test_page(_) do
    test_page = test_page_fixture()
    %{test_page: test_page}
  end
end
