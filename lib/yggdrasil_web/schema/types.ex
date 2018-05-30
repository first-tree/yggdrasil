defmodule YggdrasilWeb.Schema.Types do
  @moduledoc """
  GraphQL Schema Object Types
  """

  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Yggdrasil.Repo

  object :wallet do
    field :type, :string
    field :address, :string
    field :env, :string
  end
end
