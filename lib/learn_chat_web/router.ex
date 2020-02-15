defmodule LearnChatWeb.Router do
  use LearnChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LearnChatWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/course_section", CourseSectionController,only: [
      :create,
      :edit,
      :show,
      :index,
      :update,
      :delete,
      :new
    ] do
      resources "/text_block", TextBlockController, only: [:create]
    end

  end
end
