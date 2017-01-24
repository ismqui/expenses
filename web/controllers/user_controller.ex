defmodule Expenses.UserController do
  use Expenses.Web, :controller

  alias Expenses.User
  alias Expenses.{TokenAuthentication, User}

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  @doc """
    Sign up action, most likely UserController.create/2
  """
  def create(conn, %{"user" => user_params}) do
    IO.puts "+++++++++++++++++++++"
    IO.inspect user_params
    IO.puts "+++++++++++++++++++++"
    changeset = User.changeset(%User{}, user_params)
    IO.puts "+++++++++++++++++++++"
    IO.inspect changeset
    IO.puts "+++++++++++++++++++++"

    case Repo.insert(changeset) do
      {:ok, user} ->
        TokenAuthentication.provide_token(user)

        conn
        |> put_flash(:info, "You signed up successfully. Please check you email.")
        |> redirect(to: page_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.html", user: user)
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end
end
