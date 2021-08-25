defmodule BusiApiWeb.Router do
  use BusiApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug BusiApiWeb.Auth.Pipeline
  end

  scope "/api", BusiApiWeb do
    pipe_through :api
    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  scope "/api", BusiApiWeb do
    pipe_through [:api, :auth]
    resources "/businesses", BusinessController, except: [:new, :edit]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: HelloWeb.Telemetry
    end
  end

  scope "/", BusiApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end
