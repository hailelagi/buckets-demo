defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  # avoid async flag for IO operations
  # to avoid race conditions with tests
  setup do
    bucket = start_supervised!(KV.Bucket)
    %{bucket_name: bucket}
  end

  # pattern match the setup return value
  # 'setup' and 'test' share the same 'test context'
  # unsure wth test context means rn

  test "stores values by key", %{bucket_name: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end
end
