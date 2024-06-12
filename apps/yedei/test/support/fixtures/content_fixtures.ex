defmodule Yedei.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Yedei.Content` context.
  """

  @doc """
  Generate a blog.
  """
  def blog_fixture(attrs \\ %{}) do
    {:ok, blog} =
      attrs
      |> Enum.into(%{
        credit: 42,
        discription: "some discription",
        title: "some title"
      })
      |> Yedei.Content.create_blog()

    blog
  end
end
