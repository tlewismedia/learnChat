defmodule LearnChat.Courses do
  @moduledoc """
  The Courses context.
  """

  import Ecto.Query, warn: false
  alias LearnChat.Repo

  alias LearnChat.Courses.TextBlock
  alias LearnChat.Courses.CourseSection

  @doc """
  Returns the list of text_blocks.

  ## Examples

      iex> list_text_blocks()
      [%TextBlock{}, ...]

  """
  def list_text_blocks do
    Repo.all(TextBlock)
  end

  @doc """
  Gets a single text_block.

  Raises `Ecto.NoResultsError` if the Text block does not exist.

  ## Examples

      iex> get_text_block!(123)
      %TextBlock{}

      iex> get_text_block!(456)
      ** (Ecto.NoResultsError)

  """
  def get_text_block!(id), do: Repo.get!(TextBlock, id)

  @doc """
  Creates a text_block.

  ## Examples

      iex> create_text_block(%{field: value})
      {:ok, %TextBlock{}}

      iex> create_text_block(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_text_block(attrs \\ %{}) do
    %TextBlock{}
    |> TextBlock.changeset(attrs)
    |> Repo.insert() |> IO.inspect(label: "return from Repo Insert:::::::::")
  end





  def new_text_block(attrs \\ %{}) do
    %TextBlock{}
    |> TextBlock.changeset(attrs)
  end

  @doc """
  Updates a text_block.

  ## Examples

      iex> update_text_block(text_block, %{field: new_value})
      {:ok, %TextBlock{}}

      iex> update_text_block(text_block, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_text_block(%TextBlock{} = text_block, attrs) do
    text_block
    |> TextBlock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a text_block.

  ## Examples

      iex> delete_text_block(text_block)
      {:ok, %TextBlock{}}

      iex> delete_text_block(text_block)
      {:error, %Ecto.Changeset{}}

  """
  def delete_text_block(%TextBlock{} = text_block) do
    Repo.delete(text_block)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking text_block changes.

  ## Examples

      iex> change_text_block(text_block)
      %Ecto.Changeset{source: %TextBlock{}}

  """
  def change_text_block(%TextBlock{} = text_block) do
    TextBlock.changeset(text_block, %{})
  end

  alias LearnChat.Courses.CourseSection

  @doc """
  Returns the list of course_sections.

  ## Examples

      iex> list_course_sections()
      [%CourseSection{}, ...]

  """
  def list_course_sections do
    Repo.all(CourseSection)
  end

  @doc """
  Gets a single course_section.

  Raises `Ecto.NoResultsError` if the Course section does not exist.

  ## Examples

      iex> get_course_section!(123)
      %CourseSection{}

      iex> get_course_section!(456)
      ** (Ecto.NoResultsError)

  """
  def get_course_section!(id) do
    id |> IO.inspect
    Repo.get!(CourseSection, id) |> IO.inspect
  end

  def get_course_section_with_blocks(id) do

    IO.puts(" ******* get course section with blocks ");

    blocks_query = from(
      b in TextBlock,
      order_by: [desc: b.inserted_at],
      preload: :course_section,
      select: b)

    IO.puts("yoooooooo")

    id
    |> get_course_section!()
    |> IO.inspect(label: "before ---------")
    |> Repo.preload( :text_blocks )
    |> IO.inspect(label: "AFter ---------")
  end

  @doc """
  Creates a course_section.

  ## Examples

      iex> create_course_section(%{field: value})
      {:ok, %CourseSection{}}

      iex> create_course_section(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_course_section(attrs \\ %{}) do
    attrs |> IO.inspect(label: "attrs:::::::")

    %CourseSection{}
    |> CourseSection.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a course_section.

  ## Examples

      iex> update_course_section(course_section, %{field: new_value})
      {:ok, %CourseSection{}}

      iex> update_course_section(course_section, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_course_section(%CourseSection{} = course_section, attrs) do
    course_section
    |> CourseSection.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a course_section.

  ## Examples

      iex> delete_course_section(course_section)
      {:ok, %CourseSection{}}

      iex> delete_course_section(course_section)
      {:error, %Ecto.Changeset{}}

  """
  def delete_course_section(%CourseSection{} = course_section) do
    Repo.delete(course_section)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking course_section changes.

  ## Examples

      iex> change_course_section(course_section)
      %Ecto.Changeset{source: %CourseSection{}}

  """
  def change_course_section(%CourseSection{} = course_section) do
    CourseSection.changeset(course_section, %{})
  end
end
