defmodule Sample.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(
        scheme: :http,
        plug: Sample,
        options: [port: 8080, protocol_options: [max_keepalive: 5_000_000]]
      ),
      :hackney_pool.child_spec(:origin_pool, [timeout: 10000, max_connections: 400])
    ]

    opts = [strategy: :one_for_one, name: Sample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
