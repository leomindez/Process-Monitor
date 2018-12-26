defmodule ProcessMonitor do
  @moduledoc """
  Process Monitor module help to list all processes with info by sorting 
  reductions order 
  """

def processes_info do
    Process.list
    |> Enum.map(fn pid -> 
    Process.info(pid, [:reductions, :memory, :status, :current_location, :group_leader])
    |> process_info(pid) 
  end)
    |> Enum.sort(&(&1.reductions > &2.reductions))
end

def kill_process(pid) do
  pid
  |> :erlang.bitstring_to_list 
  |> :erlang.list_to_pid
  |> Process.exit(:normal)
end

defp process_info(process,pid) do 
  %ProcessMonitor.Process{
        location: Keyword.get(process, :current_location),
        reductions: Keyword.get(process, :reductions),
        memory: Keyword.get(process, :memory),
        status: Keyword.get(process, :status),
        group_leader: Keyword.get(process, :group_leader),
        pid: :erlang.pid_to_list(pid)}
end

end