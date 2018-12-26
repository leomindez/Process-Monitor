defmodule ProcessMonitor.Process do
  defstruct [:pid, :location, :memory, :group_leader, :reductions, :status]
end