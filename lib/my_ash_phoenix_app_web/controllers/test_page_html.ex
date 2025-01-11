defmodule MyAshPhoenixAppWeb.TestPageHTML do
  use MyAshPhoenixAppWeb, :html

  embed_templates "test_page_html/*"

  @doc """
  Renders a test_page form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def test_page_form(assigns)
end
