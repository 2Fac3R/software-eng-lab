# Solution for: Broadway Kafka Consumer

defmodule EventConsumer.Broadway do
  use Broadway

  alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__, 
      name: __MODULE__,
      producer: [
        module: BroadwayKafka.Producer,
        hosts: [localhost: 9092],
        group_id: "event_consumer_group",
        topics: ["user_events"]
      ],
      processors: [
        default: [concurrency: 5]
      ]
    )
  end

  @impl true
  def handle_message(_processor, %Message{data: data} = message, _context) do
    IO.puts("Processing event: #{data}")
    
    # In a real application, you would do something with the data here,
    # like write to a database or call another service.

    # We return the original message struct to tell Broadway that it has been
    # successfully processed and can be acknowledged with Kafka.
    message
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
