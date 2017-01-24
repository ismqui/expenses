defmodule Expenses.Router do
  use Expenses.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Expenses do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/categories", CategoryController, :index
    get "/categories/new", CategoryController, :new
    post "/categories/create", CategoryController, :create

    resources "/users", UserController
    get "/signin/:token", SessionController, :show, as: :signin
    resources "/sessions", SessionController, only: [:new, :create, :delete]

    resources "/markets", MarketController
    resources "/tickets", TicketController, only: [:index, :new, :create] do
      resources "/purchases", PurchaseController, only: [:index, :new, :create]
    end

  end

  # Other scopes may use custom stacks.
  # scope "/api", Expenses do
  #   pipe_through :api
  # end
end
