defmodule YggdrasilWeb.WalletResolverTest do
  use ExUnit.Case, async: true
  alias YggdrasilWeb.Resolvers.WalletResolver

  describe "WalletResolver" do
    test "generate_address/2 returns the generated testnet btc address" do
      resp = WalletResolver.generate_address(%{type: "btc", use_mainnet: false}, %{})

      assert {:ok, %{type: type, env: env, address: address}} = resp
      assert type == "btc"
      assert env == "testnet"
      refute address == nil
    end
  end
end
