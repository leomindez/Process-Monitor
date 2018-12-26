defmodule ProcessMonitor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # ProcessMonitor.Worker
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ProcessMonitor.Supervisor)
  end
end
