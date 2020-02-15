defmodule LearnChatWeb.CourseSectionController do
  use LearnChatWeb, :controller

  alias LearnChat.Courses
  alias LearnChat.Courses.CourseSection

  def index(conn, _params) do
    course_sections = Courses.list_course_sections()
    render(conn, "index.html", course_sections: course_sections)
  end

  def new(conn, _params) do
    changeset = Courses.change_course_section(%CourseSection{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"course_section" => course_section_params}) do
    case Courses.create_course_section(course_section_params) do
      {:ok, course_section} ->
        conn
        |> put_flash(:info, "Course section created successfully.")
        |> redirect(to: Routes.course_section_path(conn, :show, course_section))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    # course_section = Courses.get_course_section!(id)
    course_section = Courses.get_course_section_with_blocks(id |> IO.inspect(label: "***** ID:"))

    content_block = Courses.new_text_block()

    render(
      conn,
      "show.html",
      course_section: course_section,
      content_block: content_block
    )
  end

  def edit(conn, %{"id" => id}) do
    course_section = Courses.get_course_section!(id)
    changeset = Courses.change_course_section(course_section)
    render(conn, "edit.html", course_section: course_section, changeset: changeset)
  end

  def update(conn, %{"id" => id, "course_section" => course_section_params}) do
    course_section = Courses.get_course_section!(id)

    case Courses.update_course_section(course_section, course_section_params) do
      {:ok, course_section} ->
        conn
        |> put_flash(:info, "Course section updated successfully.")
        |> redirect(to: Routes.course_section_path(conn, :show, course_section))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", course_section: course_section, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    course_section = Courses.get_course_section!(id)
    {:ok, _course_section} = Courses.delete_course_section(course_section)

    conn
    |> put_flash(:info, "Course section deleted successfully.")
    |> redirect(to: Routes.course_section_path(conn, :index))
  end
end
