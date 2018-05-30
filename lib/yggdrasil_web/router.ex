defmodule YggdrasilWeb.Router do
  use YggdrasilWeb, :router

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

  scope "/", YggdrasilWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end


  scope "/graph" do
    pipe_through :api

    forward "/", Absinthe.Plug,
      schema: YggdrasilWeb.Schema
  end

  if Mix.env == :dev do
    scope "/graphiql" do
      pipe_through :api

      forward "/", Absinthe.Plug.GraphiQL,
        schema: YggdrasilWeb.Schema
    end
  end
end
