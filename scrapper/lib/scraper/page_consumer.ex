defmodule Scraper.PageConsumer do
  use GenServer
  require Logger

  def start_link(event) do
    GenServer.start_link(__MODULE__, event)
  end

  def init(event) do
    Logger.info("PageConsumer init")

    {:ok, event, {:continue, :do_work}}
  end

  def handle_continue(:do_work, event) do
    Logger.info("PageConsumer!! received #{event}")

    Scraper.work()

    {:stop, :normal, event}
  end
end
