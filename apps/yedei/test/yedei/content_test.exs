defmodule Yedei.ContentTest do
  use Yedei.DataCase

  alias Yedei.Content

  describe "blogs" do
    alias Yedei.Content.Blog

    import Yedei.ContentFixtures

    @invalid_attrs %{title: nil, discription: nil, credit: nil}

    test "list_blogs/0 returns all blogs" do
      blog = blog_fixture()
      assert Content.list_blogs() == [blog]
    end

    test "get_blog!/1 returns the blog with given id" do
      blog = blog_fixture()
      assert Content.get_blog!(blog.id) == blog
    end

    test "create_blog/1 with valid data creates a blog" do
      valid_attrs = %{title: "some title", discription: "some discription", credit: 42}

      assert {:ok, %Blog{} = blog} = Content.create_blog(valid_attrs)
      assert blog.title == "some title"
      assert blog.discription == "some discription"
      assert blog.credit == 42
    end

    test "create_blog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_blog(@invalid_attrs)
    end

    test "update_blog/2 with valid data updates the blog" do
      blog = blog_fixture()
      update_attrs = %{title: "some updated title", discription: "some updated discription", credit: 43}

      assert {:ok, %Blog{} = blog} = Content.update_blog(blog, update_attrs)
      assert blog.title == "some updated title"
      assert blog.discription == "some updated discription"
      assert blog.credit == 43
    end

    test "update_blog/2 with invalid data returns error changeset" do
      blog = blog_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_blog(blog, @invalid_attrs)
      assert blog == Content.get_blog!(blog.id)
    end

    test "delete_blog/1 deletes the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{}} = Content.delete_blog(blog)
      assert_raise Ecto.NoResultsError, fn -> Content.get_blog!(blog.id) end
    end

    test "change_blog/1 returns a blog changeset" do
      blog = blog_fixture()
      assert %Ecto.Changeset{} = Content.change_blog(blog)
    end
  end
end
