defmodule Expenses.CategoryController do
  use Expenses.Web, :controller

  alias Expenses.Category

  def index(conn, _params) do
    categories = Repo.all(Category)
    render conn, "index.html", categories: categories
  end

  def new(conn, _params) do
    changeset = Category.changeset(%Category{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"category" => category}) do
    changeset = Category.changeset(%Category{}, category)

    case Repo.insert(changeset) do
      {:ok, _category} ->
        conn
        |> put_flash(:info, "Category created")
        |> redirect(to: category_path(conn, :index))

      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)

    end

  end
end
