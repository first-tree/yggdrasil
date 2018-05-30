defmodule YggdrasilWeb.Resolvers.WalletResolver do
  @moduledoc """
  Wallet related resolvers
  """

  @btc_rpc Application.get_env(:yggdrasil, :btc_rpc)

  def generate_address(%{type: "btc", use_mainnet: use_mainnet}, _context) do
    env = if use_mainnet, do: "mainnet", else: "testnet" 
    {:ok, address} = new_btc_address(use_mainnet)

    {:ok, %{
      type: "btc",
      address: address,
      env: env
    }}
  end

  defp new_btc_address(use_mainnet, account \\ "") do
    env = if use_mainnet, do: :btc_mainnet, else: :btc_testnet
    @btc_rpc.getnewaddress(env, account)
  end
end
