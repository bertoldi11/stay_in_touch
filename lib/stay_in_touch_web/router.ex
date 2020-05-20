defmodule StayInTouchWeb.Router do
  use StayInTouchWeb, :router
  alias StayInTouch.Plugs.{Guest, Auth}

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

  scope "/", StayInTouchWeb do
    pipe_through [:browser, Guest]

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create]
    resources "/session", SessionController, only: [:new, :create]
  end

  scope "/", StayInTouchWeb do
    pipe_through [:browser, Auth]

    resources "/session", SessionController, only: [:delete]
    resources "/users", UserController, except: [:new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", StayInTouchWeb do
  #   pipe_through :api
  # end
end
