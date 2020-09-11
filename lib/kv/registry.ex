defmodule KV.Registry do
  use GenServer

  @doc """
  Starts the registry
  """
  def start_link(options) do
    # module ===>>> where is this server impl'd
    # init value and list of options(e.g server name)
    GenServer.start_link(__MODULE__, :ok, options)
  end

  @doc """
  Looks up the bucket pid using name
  returns {:ok, pid} else :error
  """
  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  @doc """
  Create bucket if does not exist already
  """
  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end

  # Defining GenServer Callbacks
  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end

  @impl true
  def handle_cast({:create, name}, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, bucket} = KV.Bucket.start_link([])
      {:noreply, Map.put(names, name, bucket)}
    end
  end
end
