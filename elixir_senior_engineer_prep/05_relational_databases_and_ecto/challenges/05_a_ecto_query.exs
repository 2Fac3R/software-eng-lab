# Challenge: Writing an Ecto Query

# NOTE: This challenge is conceptual. It provides schemas and a function
# signature. You are to write the Ecto query code. A running Elixir
# application with a database is required to execute it.

# Instructions:
# 1. You are given two schemas: `User` and `Post`.
# 2. A User `has_many` Posts.
# 3. Complete the `get_user_with_recent_posts/1` function.
# 4. The function should accept a `user_id`.
# 5. It should return the `User` struct for that ID, with their 5 most recent
#    posts preloaded into the `:posts` field.

# --- Schemas (for context) ---
defmodule MyApp.User do
  use Ecto.Schema
  schema "users" do
    field :name, :string
    has_many :posts, MyApp.Post
  end
end

defmodule MyApp.Post do
  use Ecto.Schema
  schema "posts" do
    field :title, :string
    field :body, :string
    belongs_to :user, MyApp.User
    timestamps()
  end
end

# --- Your Code Here ---
defmodule UserQueries do
  import Ecto.Query

  # Assume `MyApp.Repo` is your Ecto Repo module.
  alias MyApp.Repo
  alias MyApp.User
  alias MyApp.Post

  def get_user_with_recent_posts(user_id) do
    # TODO: Create a query that finds the user by `user_id`.
    # TODO: The query should preload the 5 most recent posts.
    # Hint: You can create a separate query for the posts and pass it to `preload`.
  end
end
