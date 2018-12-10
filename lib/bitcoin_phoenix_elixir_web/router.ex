defmodule BitcoinPhoenixElixirWeb.Router do
  use BitcoinPhoenixElixirWeb, :router

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

  scope "/", BitcoinPhoenixElixirWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/blocksearch", BlocksearchController, :index

    get "/block", PageController, :block

    get "/transaction", PageController, :transaction

  end

  # Other scopes may use custom stacks.
  # scope "/api", BitcoinPhoenixElixirWeb do
  #   pipe_through :api
  # end
end
