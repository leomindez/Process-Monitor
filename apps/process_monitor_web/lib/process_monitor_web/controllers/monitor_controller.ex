defmodule ProcessMonitorWeb.MonitorController do
  use ProcessMonitorWeb, :controller

  def process_monitor(conn, _params) do
    render conn, "index.html", processes: ProcessMonitor.processes_info()
  end

  def kill(conn, %{"pid" => pid}) do
    ProcessMonitor.kill_process(pid)
    conn 
    |> put_flash(:info, "Process was killed #{pid}")
    |> redirect(to: Routes.monitor_path(conn, :process_monitor))
  end
end