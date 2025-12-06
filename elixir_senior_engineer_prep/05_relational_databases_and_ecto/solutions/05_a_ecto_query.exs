# Solution for: Writing an Ecto Query

defmodule UserQueries do
  import Ecto.Query

  # In a real app, these would be defined elsewhere.
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

  # A mock Repo for demonstration purposes.
  defmodule MyApp.Repo do
    def get(User, _id), do: %MyApp.User{id: 1, name: "Alice"}
    def preload(_, _), do: %MyApp.User{id: 1, name: "Alice", posts: [%MyApp.Post{title: "Post 5"}] }
  end

  alias MyApp.Repo
  alias MyApp.User
  alias MyApp.Post

  def get_user_with_recent_posts(user_id) do
    # First, we define a query for the posts we want to preload.
    # We want the 5 most recent, so we order by the `inserted_at` timestamp
    # in descending order and take the top 5.
    recent_posts_query = from(p in Post, order_by: [desc: p.inserted_at], limit: 5)

    # Now, we build the main query for the user.
    user_query = from(u in User, where: u.id == ^user_id)

    # We fetch the user and use `preload` with our specific posts query.
    # Ecto is smart enough to fetch the user and then run a second query
    # to get only the posts related to that user that match the query criteria.
    Repo.one(user_query)
    |> Repo.preload(posts: recent_posts_query)
  end
end

# --- Conceptual Test ---
IO.puts("Conceptual test for get_user_with_recent_posts/1")
IO.puts("This function would execute the following logic:")
IO.puts("1. Find the user with the given ID.")
IO.puts("2. Preload their posts association, but only for the 5 most recent ones.")

# In a real app, you would call it like this:
# UserQueries.get_user_with_recent_posts(1)
