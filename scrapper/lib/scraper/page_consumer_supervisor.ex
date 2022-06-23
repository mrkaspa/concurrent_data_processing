defmodule Scraper.PageConsumerSupervisor do
  use ConsumerSupervisor
  alias Scraper.{OnlinePageProducerConsumer, PageConsumer}
  require Logger

  def start_link(_args) do
    ConsumerSupervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    Logger.info("PageConsumerSupervisor init")

    children = [
      %{
        id: PageConsumer,
        start: {PageConsumer, :start_link, []},
        restart: :transient
      }
    ]

    opts = [
      strategy: :one_for_one,
      subscribe_to: [
        {OnlinePageProducerConsumer, max_demand: 2}
      ]
    ]

    ConsumerSupervisor.init(children, opts)
  end
end