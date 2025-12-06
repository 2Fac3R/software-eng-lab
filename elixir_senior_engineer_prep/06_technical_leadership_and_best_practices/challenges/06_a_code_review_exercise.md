# Challenge: Performing a Code Review

As a senior engineer, you are asked to review a Pull Request from a junior developer. The goal of the code is to fetch a user from a database and check if they are an admin.

**Instructions:**

Read the code snippet below. Write a constructive code review. Your review should:

1.  Be polite and encouraging.
2.  Identify at least **three** distinct issues (they could be related to correctness, style, maintainability, or testing).
3.  For each issue, explain *why* it's a concern.
4.  Suggest a specific, actionable improvement.

---

### Code to be Reviewed

```elixir
# file: my_app/permissions.ex

defmodule MyApp.Permissions do

  alias MyApp.Repo
  alias MyApp.User

  def check_if_admin(id) do
    user = Repo.get(User, id)

    if user != nil do
      if user.role == "admin" do
        true
      else
        false
      end
    else
      false
    end
  end
end
```

### Your Code Review

(Write your review here in Markdown format)

