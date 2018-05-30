defmodule Yggdrasil.MerchantApplication do
  use Ecto.Schema
  import Ecto.Changeset


  schema "merchant_applications" do
    field :callback_url, :string
    field :name, :string
    field :priv_key, :string
    field :uid, :string

    timestamps()
  end

  @doc false
  def changeset(merchant_application, attrs) do
    merchant_application
    |> cast(attrs, [:name, :uid, :priv_key, :callback_url])
    |> validate_required([:name, :uid, :priv_key, :callback_url])
    |> unique_constraint(:uid)
  end
end
