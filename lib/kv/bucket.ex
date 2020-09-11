defmodule KV.Bucket do
  use Agent

  @doc """
    Starts a new bucket
  """
  def start_link(_options) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the 'bucket' by 'key'
  """
  def get(bucket, key) do
    Agent.get_and_update(bucket, fn dict ->
      Map.pop(dict, key)
    end)
  end

  @doc """

  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Delete given key from bucket store
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
