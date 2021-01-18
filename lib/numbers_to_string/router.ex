defmodule NumbersToString.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    input = '{"input": #{conn.query_string}}'

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(output(input)))
  end

  defp output(input) do
    %{
      "\'#{input}\'": "#{NumbersToString.numbers_to_string(input)}"
    }
  end
end
