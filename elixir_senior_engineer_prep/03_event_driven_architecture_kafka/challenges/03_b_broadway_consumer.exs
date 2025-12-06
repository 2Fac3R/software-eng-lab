# Challenge: Broadway Kafka Consumer

# NOTE: This challenge is conceptual and requires a running Kafka instance
# to be fully tested. The goal is to correctly structure a Broadway pipeline.

# Instructions:
# 1. Complete the `EventConsumer.Broadway` module below.
# 2. Configure the Broadway pipeline to consume from a Kafka topic named "user_events".
#    Assume the Kafka broker is at `localhost:9092`.
# 3. In the `handle_message/3` callback, inspect the message data to the console.
# 4. Ensure the message is returned from `handle_message/3` to acknowledge it.

defmodule EventConsumer.Broadway do
  use Broadway

  alias Broadway.Message

  # TODO: Configure and start the Broadway pipeline.
  # The name should be __MODULE__.
  # The producer should be BroadwayKafka.Producer, consuming from "user_events".
  # The processors can have a concurrency of 5.
  def start_link(_opts) do
    Broadway.start_link(__MODULE__, 
      # Your configuration here
    )
  end

  @impl true
  def handle_message(_processor, message, _context) do
    # TODO: Inspect the message data and return the message.
  end
end

# --- Tests ---
# Testing Broadway is complex. This test just verifies the module structure
# and that the main callback is defined.
defmodule ConsumerTest do
  def run do
    IO.puts("Running Broadway Consumer tests...")

    # Check if the main callback is implemented
    if function_exported?(EventConsumer.Broadway, :handle_message, 3) do
      IO.puts("  [PASS] handle_message/3 is defined.")
    else
      IO.puts("  [FAIL] handle_message/3 is not defined.")
      System.halt(1)
    end

    # A simple conceptual test of the handle_message logic
    test_message = %Broadway.Message{
      data: "User 456 logged in",
      acknowledger: {self(), :ack, :ref}
    }

    result = EventConsumer.Broadway.handle_message(:default, test_message, %{})

    if result == test_message do
      IO.puts("  [PASS] handle_message/3 returns the message correctly.")
    else
      IO.puts("  [FAIL] handle_message/3 did not return the message.")
      System.halt(1)
    end

    IO.puts("All tests passed!")
  end
end

ConsumerTest.run()
