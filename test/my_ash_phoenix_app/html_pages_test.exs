defmodule MyAshPhoenixApp.HTMLPagesTest do
  use MyAshPhoenixApp.DataCase

  alias MyAshPhoenixApp.HTMLPages

  describe "test_pages" do
    alias MyAshPhoenixApp.HTMLPages.TestPage

    import MyAshPhoenixApp.HTMLPagesFixtures

    @invalid_attrs %{test: nil}

    test "list_test_pages/0 returns all test_pages" do
      test_page = test_page_fixture()
      assert HTMLPages.list_test_pages() == [test_page]
    end

    test "get_test_page!/1 returns the test_page with given id" do
      test_page = test_page_fixture()
      assert HTMLPages.get_test_page!(test_page.id) == test_page
    end

    test "create_test_page/1 with valid data creates a test_page" do
      valid_attrs = %{test: "some test"}

      assert {:ok, %TestPage{} = test_page} = HTMLPages.create_test_page(valid_attrs)
      assert test_page.test == "some test"
    end

    test "create_test_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HTMLPages.create_test_page(@invalid_attrs)
    end

    test "update_test_page/2 with valid data updates the test_page" do
      test_page = test_page_fixture()
      update_attrs = %{test: "some updated test"}

      assert {:ok, %TestPage{} = test_page} = HTMLPages.update_test_page(test_page, update_attrs)
      assert test_page.test == "some updated test"
    end

    test "update_test_page/2 with invalid data returns error changeset" do
      test_page = test_page_fixture()
      assert {:error, %Ecto.Changeset{}} = HTMLPages.update_test_page(test_page, @invalid_attrs)
      assert test_page == HTMLPages.get_test_page!(test_page.id)
    end

    test "delete_test_page/1 deletes the test_page" do
      test_page = test_page_fixture()
      assert {:ok, %TestPage{}} = HTMLPages.delete_test_page(test_page)
      assert_raise Ecto.NoResultsError, fn -> HTMLPages.get_test_page!(test_page.id) end
    end

    test "change_test_page/1 returns a test_page changeset" do
      test_page = test_page_fixture()
      assert %Ecto.Changeset{} = HTMLPages.change_test_page(test_page)
    end
  end
end
