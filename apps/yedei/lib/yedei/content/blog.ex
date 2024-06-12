defmodule Yedei.Content.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :title, :string
    field :discription, :string
    field :credit, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :discription, :credit])
    |> validate_required([:title, :discription, :credit])
  end
end
