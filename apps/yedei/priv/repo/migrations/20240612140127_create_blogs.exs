defmodule Yedei.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string
      add :discription, :string
      add :credit, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:blogs, [:user_id])
  end
end
