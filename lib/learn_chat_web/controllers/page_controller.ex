defmodule LearnChatWeb.PageController do
  use LearnChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
