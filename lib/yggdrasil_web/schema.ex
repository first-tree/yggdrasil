defmodule YggdrasilWeb.Schema do
  @moduledoc """
  GraphQL Schema
  """
  
  use Absinthe.Schema
  alias __MODULE__

  import_types Absinthe.Plug.Types
  import_types Schema.Types
  import_types Schema.Queries
  import_types Schema.Mutations

  # check for N+1 queries in the resolvers using dataloader
  # https://hexdocs.pm/absinthe/ecto.html#content

  query do
    import_fields :queries
  end
  
  mutation do
    import_fields :mutations
  end
end
