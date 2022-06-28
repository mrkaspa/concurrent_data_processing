defmodule Scraper do
  require Logger

  def work() do
    1..5
    |> Enum.random()
    |> :timer.seconds()
    |> Process.sleep()
  end

  def online?(url) do
    work()
    online = Enum.random([false, true, true])

    Logger.info("Online? validation #{url} => #{online}")
    online
  end
end
