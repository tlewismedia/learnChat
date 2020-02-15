defmodule LearnChatWeb.TextBlockController do
  use LearnChatWeb, :controller

  alias LearnChat.Courses
  alias LearnChat.Courses.TextBlock

  def index(conn, _params) do
    text_blocks = Courses.list_text_blocks()
    render(conn, "index.html", text_blocks: text_blocks)
  end

  def new(conn, _params) do

    # if there's a course section id, use it for association
    # ?

    changeset = Courses.change_text_block(%TextBlock{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(
    conn,
    %{
      "text_block" => text_block_params,
      "course_section_id" => course_section_id
    }) do

      # need to join text_block_params with course_section_id I think
      newParams = Map.merge(text_block_params , %{"course_section_id" => course_section_id})

    case Courses.create_text_block(newParams) do
      {:ok, text_block} ->
        conn
        |> put_flash(:info, "Text block created successfully.")
        |> redirect(to: Routes.course_section_path(conn, :show, text_block.course_section_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.puts('IN ERROR ----------------')

        conn
        |> put_flash(:info, "ERROR in text_block create function")
        |> redirect(to: Routes.course_section_path(conn, :index))
    end
  end

  def show(conn, %{"id" => id}) do
    text_block = Courses.get_text_block!(id)
    render(conn, "show.html", text_block: text_block)
  end

  def edit(conn, %{"id" => id}) do
    text_block = Courses.get_text_block!(id)
    changeset = Courses.change_text_block(text_block)
    render(conn, "edit.html", text_block: text_block, changeset: changeset)
  end

  def update(conn, %{"id" => id, "text_block" => text_block_params}) do
    text_block = Courses.get_text_block!(id)

    case Courses.update_text_block(text_block, text_block_params) do
      {:ok, text_block} ->
        conn
        |> put_flash(:info, "Text block updated successfully.")
        |> redirect(to: Routes.text_block_path(conn, :show, text_block))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", text_block: text_block, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    text_block = Courses.get_text_block!(id)
    {:ok, _text_block} = Courses.delete_text_block(text_block)

    conn
    |> put_flash(:info, "Text block deleted successfully.")
    |> redirect(to: Routes.text_block_path(conn, :index))
  end
end
