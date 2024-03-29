defmodule KV.Supervisor do
  use Supervisor

  def start_link(options) do
    Supervisor.start_link(__MODULE__, :ok, options)
  end

  @impl true
  def init(:ok) do
    children = [
      KV.Registry
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end