defmodule YggdrasilWeb.Schema.Mutations do
  @moduledoc """
  Nodes for data mutations
  """

  use Absinthe.Schema.Notation
  alias YggdrasilWeb.Resolvers.WalletResolver

  object :mutations do
    @desc "Generate wallet address"
    field :generate_address, :wallet do
      arg :type, non_null(:string)
      arg :use_mainnet, non_null(:boolean)

      resolve &WalletResolver.generate_address/2
    end
  end
end
