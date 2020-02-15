defmodule LearnChatWeb.TextBlockControllerTest do
  use LearnChatWeb.ConnCase

  alias LearnChat.Courses

  @create_attrs %{body: "some body", heading: "some heading"}
  @update_attrs %{body: "some updated body", heading: "some updated heading"}
  @invalid_attrs %{body: nil, heading: nil}

  def fixture(:text_block) do
    {:ok, text_block} = Courses.create_text_block(@create_attrs)
    text_block
  end

  describe "index" do
    test "lists all text_blocks", %{conn: conn} do
      conn = get(conn, Routes.text_block_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Text blocks"
    end
  end

  describe "new text_block" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.text_block_path(conn, :new))
      assert html_response(conn, 200) =~ "New Text block"
    end
  end

  describe "create text_block" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.text_block_path(conn, :create), text_block: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.text_block_path(conn, :show, id)

      conn = get(conn, Routes.text_block_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Text block"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.text_block_path(conn, :create), text_block: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Text block"
    end
  end

  describe "edit text_block" do
    setup [:create_text_block]

    test "renders form for editing chosen text_block", %{conn: conn, text_block: text_block} do
      conn = get(conn, Routes.text_block_path(conn, :edit, text_block))
      assert html_response(conn, 200) =~ "Edit Text block"
    end
  end

  describe "update text_block" do
    setup [:create_text_block]

    test "redirects when data is valid", %{conn: conn, text_block: text_block} do
      conn = put(conn, Routes.text_block_path(conn, :update, text_block), text_block: @update_attrs)
      assert redirected_to(conn) == Routes.text_block_path(conn, :show, text_block)

      conn = get(conn, Routes.text_block_path(conn, :show, text_block))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, text_block: text_block} do
      conn = put(conn, Routes.text_block_path(conn, :update, text_block), text_block: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Text block"
    end
  end

  describe "delete text_block" do
    setup [:create_text_block]

    test "deletes chosen text_block", %{conn: conn, text_block: text_block} do
      conn = delete(conn, Routes.text_block_path(conn, :delete, text_block))
      assert redirected_to(conn) == Routes.text_block_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.text_block_path(conn, :show, text_block))
      end
    end
  end

  defp create_text_block(_) do
    text_block = fixture(:text_block)
    {:ok, text_block: text_block}
  end
end
