defmodule YggdrasilWeb.WalletTest do
  use YggdrasilWeb.ConnCase

  import YggdrasilWeb.AbsintheHelpers

  describe "Wallet Address Resolver" do
    test "createWallet(type: 'btc' useMainnet: false) returns a newly generated testnet btc address" do

      query = """
      mutation {
        generateAddress(type: "btc" useMainnet: false) {
          address
          env
          type
        }
      }
      """

      res = post build_conn(), "/graph", mutation_skeleton(query)

      assert %{"data" => %{"generateAddress" => wallet}} = json_response(res, 200)

      assert wallet["type"] == "btc"
      assert wallet["env"] == "testnet"
      refute wallet["address"] == nil
    end
  end
end
