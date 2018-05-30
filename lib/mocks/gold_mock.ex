defmodule GoldMock do
  @moduledoc """
  Module for GoldMock; Fake counterpart of Gold
  """

  def getnewaddress(name, _), do: getnewaddress(name)
  def getnewaddress(:btc_testnet), do: {:ok, Faker.Bitcoin.address(:testnet)}
  def getnewaddress(:btc_mainnet), do: {:ok, Faker.Bitcoin.address}
  def getnewaddress(name), do: {:error, {:invalid_configuration, name}}
end
