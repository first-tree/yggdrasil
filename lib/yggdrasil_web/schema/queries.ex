defmodule YggdrasilWeb.Schema.Queries do
  @moduledoc """
  GraphQL node for queries
  """

  use Absinthe.Schema.Notation

  object :queries do
    @desc "Ping!"
    field :ping, :string do
      resolve fn(_, _) -> "pong" end
    end
  end
end
