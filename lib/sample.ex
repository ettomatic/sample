defmodule Sample do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/status" do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "ok!")
  end

  get "/poison" do
    headers = []
    options = [recv_timeout: 1000, hackney: [pool: :origin_pool]]
    endpoint = "http://172.31.5.55:8080/"

    {:ok, resp} = HTTPoison.get(endpoint, headers, options)

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, resp.body)
  end

  get "/potion" do
    options  = [ibrowse: [max_sessions: 5000, max_pipeline_size: 100]]
    endpoint = "http://172.31.5.55:8080/"

    resp = HTTPotion.get(endpoint, options)

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, resp.body)
  end
end
