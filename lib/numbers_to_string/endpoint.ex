defmodule NumbersToString.Endpoint do
  use Plug.Router

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  forward("/numbers_to_string", to: NumbersToString.Router)

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts),
    # do: Plug.Adapters.Cowboy2.http(__MODULE__, [])
    do: Plug.Adapters.Cowboy.http(__MODULE__, [])

end
