defmodule TailwindBootcampWeb.PageController do
  use TailwindBootcampWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
