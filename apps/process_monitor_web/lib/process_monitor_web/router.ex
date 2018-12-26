defmodule ProcessMonitorWeb.Router do
  use ProcessMonitorWeb, :router

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

  scope "/", ProcessMonitorWeb do
    pipe_through :browser

    get "/", MonitorController, :process_monitor
    get "/process/:pid/kill", MonitorController, :kill
  end

  # Other scopes may use custom stacks.
  # scope "/api", ProcessMonitorWeb do
  #   pipe_through :api
  # end
end
