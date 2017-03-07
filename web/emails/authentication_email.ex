defmodule Expenses.AuthenticationEmail do
  use Bamboo.Phoenix, view: Expenses.EmailView
  # import Bamboo.Email


  @doc """
    The sign in email containing the login link.
  """
  def login_link(token_value, user) do
    new_email()
    |> to(user.email)
    |> from("ismqui.elixir@gmail.com")
    |> subject("Your login link")
    # |> html_body("<strong>Prueba</strong>")
    |> assign(:token, token_value)
    |> render("login_link.text")
  end

end
