# buckets-demo

(A part of learning how to build a distributed server in elixir
using **OTP, Mix and ExUnit**)

- The application works as a distributed key-value store. 
- We are going to organize key-value pairs into buckets and distribute those buckets across multiple nodes. 
- We will also build a simple client that allows us to connect to any of those nodes and send requests

## KV

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kv` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kv, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/kv](https://hexdocs.pm/kv).

