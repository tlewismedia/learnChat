defmodule LearnChat.CoursesTest do
  use LearnChat.DataCase

  alias LearnChat.Courses

  describe "text_blocks" do
    alias LearnChat.Courses.Text_Block

    @valid_attrs %{body: "some body", heading: "some heading"}
    @update_attrs %{body: "some updated body", heading: "some updated heading"}
    @invalid_attrs %{body: nil, heading: nil}

    def text__block_fixture(attrs \\ %{}) do
      {:ok, text__block} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_text__block()

      text__block
    end

    test "list_text_blocks/0 returns all text_blocks" do
      text__block = text__block_fixture()
      assert Courses.list_text_blocks() == [text__block]
    end

    test "get_text__block!/1 returns the text__block with given id" do
      text__block = text__block_fixture()
      assert Courses.get_text__block!(text__block.id) == text__block
    end

    test "create_text__block/1 with valid data creates a text__block" do
      assert {:ok, %Text_Block{} = text__block} = Courses.create_text__block(@valid_attrs)
      assert text__block.body == "some body"
      assert text__block.heading == "some heading"
    end

    test "create_text__block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_text__block(@invalid_attrs)
    end

    test "update_text__block/2 with valid data updates the text__block" do
      text__block = text__block_fixture()
      assert {:ok, %Text_Block{} = text__block} = Courses.update_text__block(text__block, @update_attrs)
      assert text__block.body == "some updated body"
      assert text__block.heading == "some updated heading"
    end

    test "update_text__block/2 with invalid data returns error changeset" do
      text__block = text__block_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_text__block(text__block, @invalid_attrs)
      assert text__block == Courses.get_text__block!(text__block.id)
    end

    test "delete_text__block/1 deletes the text__block" do
      text__block = text__block_fixture()
      assert {:ok, %Text_Block{}} = Courses.delete_text__block(text__block)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_text__block!(text__block.id) end
    end

    test "change_text__block/1 returns a text__block changeset" do
      text__block = text__block_fixture()
      assert %Ecto.Changeset{} = Courses.change_text__block(text__block)
    end
  end

  describe "textblocks" do
    alias LearnChat.Courses.TextBlock

    @valid_attrs %{body: "some body", heading: "some heading"}
    @update_attrs %{body: "some updated body", heading: "some updated heading"}
    @invalid_attrs %{body: nil, heading: nil}

    def text_block_fixture(attrs \\ %{}) do
      {:ok, text_block} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_text_block()

      text_block
    end

    test "list_textblocks/0 returns all textblocks" do
      text_block = text_block_fixture()
      assert Courses.list_textblocks() == [text_block]
    end

    test "get_text_block!/1 returns the text_block with given id" do
      text_block = text_block_fixture()
      assert Courses.get_text_block!(text_block.id) == text_block
    end

    test "create_text_block/1 with valid data creates a text_block" do
      assert {:ok, %TextBlock{} = text_block} = Courses.create_text_block(@valid_attrs)
      assert text_block.body == "some body"
      assert text_block.heading == "some heading"
    end

    test "create_text_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_text_block(@invalid_attrs)
    end

    test "update_text_block/2 with valid data updates the text_block" do
      text_block = text_block_fixture()
      assert {:ok, %TextBlock{} = text_block} = Courses.update_text_block(text_block, @update_attrs)
      assert text_block.body == "some updated body"
      assert text_block.heading == "some updated heading"
    end

    test "update_text_block/2 with invalid data returns error changeset" do
      text_block = text_block_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_text_block(text_block, @invalid_attrs)
      assert text_block == Courses.get_text_block!(text_block.id)
    end

    test "delete_text_block/1 deletes the text_block" do
      text_block = text_block_fixture()
      assert {:ok, %TextBlock{}} = Courses.delete_text_block(text_block)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_text_block!(text_block.id) end
    end

    test "change_text_block/1 returns a text_block changeset" do
      text_block = text_block_fixture()
      assert %Ecto.Changeset{} = Courses.change_text_block(text_block)
    end
  end

  describe "text_blocks" do
    alias LearnChat.Courses.TextBlock

    @valid_attrs %{body: "some body", heading: "some heading"}
    @update_attrs %{body: "some updated body", heading: "some updated heading"}
    @invalid_attrs %{body: nil, heading: nil}

    def text_block_fixture(attrs \\ %{}) do
      {:ok, text_block} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_text_block()

      text_block
    end

    test "list_text_blocks/0 returns all text_blocks" do
      text_block = text_block_fixture()
      assert Courses.list_text_blocks() == [text_block]
    end

    test "get_text_block!/1 returns the text_block with given id" do
      text_block = text_block_fixture()
      assert Courses.get_text_block!(text_block.id) == text_block
    end

    test "create_text_block/1 with valid data creates a text_block" do
      assert {:ok, %TextBlock{} = text_block} = Courses.create_text_block(@valid_attrs)
      assert text_block.body == "some body"
      assert text_block.heading == "some heading"
    end

    test "create_text_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_text_block(@invalid_attrs)
    end

    test "update_text_block/2 with valid data updates the text_block" do
      text_block = text_block_fixture()
      assert {:ok, %TextBlock{} = text_block} = Courses.update_text_block(text_block, @update_attrs)
      assert text_block.body == "some updated body"
      assert text_block.heading == "some updated heading"
    end

    test "update_text_block/2 with invalid data returns error changeset" do
      text_block = text_block_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_text_block(text_block, @invalid_attrs)
      assert text_block == Courses.get_text_block!(text_block.id)
    end

    test "delete_text_block/1 deletes the text_block" do
      text_block = text_block_fixture()
      assert {:ok, %TextBlock{}} = Courses.delete_text_block(text_block)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_text_block!(text_block.id) end
    end

    test "change_text_block/1 returns a text_block changeset" do
      text_block = text_block_fixture()
      assert %Ecto.Changeset{} = Courses.change_text_block(text_block)
    end
  end

  describe "course_sections" do
    alias LearnChat.Courses.CourseSection

    @valid_attrs %{title: "some title", type: "some type"}
    @update_attrs %{title: "some updated title", type: "some updated type"}
    @invalid_attrs %{title: nil, type: nil}

    def course_section_fixture(attrs \\ %{}) do
      {:ok, course_section} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_course_section()

      course_section
    end

    test "list_course_sections/0 returns all course_sections" do
      course_section = course_section_fixture()
      assert Courses.list_course_sections() == [course_section]
    end

    test "get_course_section!/1 returns the course_section with given id" do
      course_section = course_section_fixture()
      assert Courses.get_course_section!(course_section.id) == course_section
    end

    test "create_course_section/1 with valid data creates a course_section" do
      assert {:ok, %CourseSection{} = course_section} = Courses.create_course_section(@valid_attrs)
      assert course_section.title == "some title"
      assert course_section.type == "some type"
    end

    test "create_course_section/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_course_section(@invalid_attrs)
    end

    test "update_course_section/2 with valid data updates the course_section" do
      course_section = course_section_fixture()
      assert {:ok, %CourseSection{} = course_section} = Courses.update_course_section(course_section, @update_attrs)
      assert course_section.title == "some updated title"
      assert course_section.type == "some updated type"
    end

    test "update_course_section/2 with invalid data returns error changeset" do
      course_section = course_section_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_course_section(course_section, @invalid_attrs)
      assert course_section == Courses.get_course_section!(course_section.id)
    end

    test "delete_course_section/1 deletes the course_section" do
      course_section = course_section_fixture()
      assert {:ok, %CourseSection{}} = Courses.delete_course_section(course_section)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_course_section!(course_section.id) end
    end

    test "change_course_section/1 returns a course_section changeset" do
      course_section = course_section_fixture()
      assert %Ecto.Changeset{} = Courses.change_course_section(course_section)
    end
  end
end
