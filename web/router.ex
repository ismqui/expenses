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

    get "/markets", MarketController, :index
    get "/markets/:id/edit", MarketController, :edit
    get "/markets/new", MarketController, :new
    get "/markets/:id", MarketController, :show
    post "/markets", MarketController, :create
    patch "/markets/:id", MarketController, :update
    put "/markets/:id", MarketController, :update

    get "/tickets", TicketController, :index
    get "/tickets/new", TicketController, :new
    post "/tickets/create", TicketController, :create
    get "/purchases/:id", PurchaseController, :index
    get "/purchases/new/:id", PurchaseController, :new
    post "/purchases/create", PurchaseController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Expenses do
  #   pipe_through :api
  # end
end
