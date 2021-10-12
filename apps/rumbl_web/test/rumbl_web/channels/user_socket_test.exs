defmodule RumblWeb.Channels.UserSocketTest do
  use RumblWeb.ChannelCase
  alias RumblWeb.UserSocket

  setup do
    on_exit(fn ->
      :timer.sleep(10)
      for pid <- RumblWeb.Presence.fetchers_pids()  do
        ref = Process.monitor(pid)
        assert_receive {:DOWN, ^ref, _, _, _}, 1000
      end
    end)
  end

  test "socket authentication with valid token" do
    token = Phoenix.Token.sign(@endpoint, "user socket", "123")

    assert {:ok, socket} = connect(UserSocket, %{"token" => token})
    assert socket.assigns.user_id == "123"
  end

  test "socket authentication with invalid token" do
    assert :error = connect(UserSocket, %{"token" => "123"})
    assert :error = connect(UserSocket, %{})
  end
end
