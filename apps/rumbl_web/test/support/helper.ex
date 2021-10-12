defmodule RumblWeb.TestHelpers do
  def login(%{conn: conn, login_as: username}) do
    user = Rumbl.UserFixtures.user_fixture(username: username)
    {Plug.Conn.assign(conn, :current_user, user), user}
  end

  def login(%{conn: conn}), do: {conn, :logged_out}
end
