defmodule Yggdrasil.Repo.Migrations.CreateMerchantApplications do
  use Ecto.Migration

  def change do
    create table(:merchant_applications) do
      add :name, :string
      add :uid, :string
      add :priv_key, :string
      add :callback_url, :string

      timestamps()
    end

    create unique_index(:merchant_applications, [:uid])
  end
end
