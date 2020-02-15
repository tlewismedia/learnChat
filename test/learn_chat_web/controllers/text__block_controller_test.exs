defmodule LearnChatWeb.Text_BlockControllerTest do
  use LearnChatWeb.ConnCase

  alias LearnChat.Courses

  @create_attrs %{body: "some body", heading: "some heading"}
  @update_attrs %{body: "some updated body", heading: "some updated heading"}
  @invalid_attrs %{body: nil, heading: nil}

  def fixture(:text__block) do
    {:ok, text__block} = Courses.create_text__block(@create_attrs)
    text__block
  end

  describe "index" do
    test "lists all text_blocks", %{conn: conn} do
      conn = get(conn, Routes.text__block_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Text blocks"
    end
  end

  describe "new text__block" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.text__block_path(conn, :new))
      assert html_response(conn, 200) =~ "New Text  block"
    end
  end

  describe "create text__block" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.text__block_path(conn, :create), text__block: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.text__block_path(conn, :show, id)

      conn = get(conn, Routes.text__block_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Text  block"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.text__block_path(conn, :create), text__block: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Text  block"
    end
  end

  describe "edit text__block" do
    setup [:create_text__block]

    test "renders form for editing chosen text__block", %{conn: conn, text__block: text__block} do
      conn = get(conn, Routes.text__block_path(conn, :edit, text__block))
      assert html_response(conn, 200) =~ "Edit Text  block"
    end
  end

  describe "update text__block" do
    setup [:create_text__block]

    test "redirects when data is valid", %{conn: conn, text__block: text__block} do
      conn = put(conn, Routes.text__block_path(conn, :update, text__block), text__block: @update_attrs)
      assert redirected_to(conn) == Routes.text__block_path(conn, :show, text__block)

      conn = get(conn, Routes.text__block_path(conn, :show, text__block))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, text__block: text__block} do
      conn = put(conn, Routes.text__block_path(conn, :update, text__block), text__block: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Text  block"
    end
  end

  describe "delete text__block" do
    setup [:create_text__block]

    test "deletes chosen text__block", %{conn: conn, text__block: text__block} do
      conn = delete(conn, Routes.text__block_path(conn, :delete, text__block))
      assert redirected_to(conn) == Routes.text__block_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.text__block_path(conn, :show, text__block))
      end
    end
  end

  defp create_text__block(_) do
    text__block = fixture(:text__block)
    {:ok, text__block: text__block}
  end
end
