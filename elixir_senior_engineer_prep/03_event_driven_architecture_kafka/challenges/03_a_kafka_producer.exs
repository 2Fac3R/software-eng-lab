# Challenge: Kafka Event Producer

# NOTE: This challenge is conceptual and requires a running Kafka instance
# to be fully tested. The goal is to write the Elixir code that would
# correctly produce events.

# Instructions:
# 1. Add a Kafka client library to your project. For this challenge, we'll assume
#    `kaffe` is used, but others like `brod` are also valid.
#    In a real project, you would add `{:kaffe, "~> 4.0"}` to your `mix.exs`.
#
# 2. Complete the `EventProducer.publish/2` function.
# 3. The function should take a topic and a message (string).
# 4. It should use the `Kaffe.produce/2` function to send the message.
#    (We will mock this for the test).

# --- Mocked Kaffe module for testing without a real Kafka broker ---
defmodule Kaffe do
  def produce(topic, message) do
    # In a real scenario, this sends to Kafka. Here, we just check it.
    if topic == "user_events" and is_binary(message) do
      :ok
    else
      {:error, :invalid_produce_call}
    end
  end
end
# --- End Mock ---

defmodule EventProducer do
  @doc """
  Publishes an event to a specific Kafka topic.
  """
  def publish(topic, message) do
    # Your implementation here.
    # Use the Kaffe.produce/2 function.
  end
end

# --- Tests ---
defmodule ProducerTest do
  def run do
    IO.puts("Running EventProducer tests...")

    topic = "user_events"
    message = "User 123 signed up."

    result = EventProducer.publish(topic, message)

    if result == :ok do
      IO.puts("  [PASS] Event produced successfully.")
    else
      IO.puts("  [FAIL] Expected :ok, got: #{inspect(result)}")
      System.halt(1)
    end

    IO.puts("All tests passed!")
  end
end

ProducerTest.run()
