defmodule LearnChatWeb.CourseSectionControllerTest do
  use LearnChatWeb.ConnCase

  alias LearnChat.Courses

  @create_attrs %{title: "some title", type: "some type"}
  @update_attrs %{title: "some updated title", type: "some updated type"}
  @invalid_attrs %{title: nil, type: nil}

  def fixture(:course_section) do
    {:ok, course_section} = Courses.create_course_section(@create_attrs)
    course_section
  end

  describe "index" do
    test "lists all course_sections", %{conn: conn} do
      conn = get(conn, Routes.course_section_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Course sections"
    end
  end

  describe "new course_section" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.course_section_path(conn, :new))
      assert html_response(conn, 200) =~ "New Course section"
    end
  end

  describe "create course_section" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.course_section_path(conn, :create), course_section: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.course_section_path(conn, :show, id)

      conn = get(conn, Routes.course_section_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Course section"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.course_section_path(conn, :create), course_section: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Course section"
    end
  end

  describe "edit course_section" do
    setup [:create_course_section]

    test "renders form for editing chosen course_section", %{conn: conn, course_section: course_section} do
      conn = get(conn, Routes.course_section_path(conn, :edit, course_section))
      assert html_response(conn, 200) =~ "Edit Course section"
    end
  end

  describe "update course_section" do
    setup [:create_course_section]

    test "redirects when data is valid", %{conn: conn, course_section: course_section} do
      conn = put(conn, Routes.course_section_path(conn, :update, course_section), course_section: @update_attrs)
      assert redirected_to(conn) == Routes.course_section_path(conn, :show, course_section)

      conn = get(conn, Routes.course_section_path(conn, :show, course_section))
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, course_section: course_section} do
      conn = put(conn, Routes.course_section_path(conn, :update, course_section), course_section: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Course section"
    end
  end

  describe "delete course_section" do
    setup [:create_course_section]

    test "deletes chosen course_section", %{conn: conn, course_section: course_section} do
      conn = delete(conn, Routes.course_section_path(conn, :delete, course_section))
      assert redirected_to(conn) == Routes.course_section_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.course_section_path(conn, :show, course_section))
      end
    end
  end

  defp create_course_section(_) do
    course_section = fixture(:course_section)
    {:ok, course_section: course_section}
  end
end
