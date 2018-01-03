defmodule MastaniServerWeb.Resolvers.Accounts do
  alias MastaniServer.Accounts

  def all_users(_root, _args, _info) do
    users = Accounts.list_users()
    {:ok, users}
  end

  def all_users2(_root, _args, _info) do
    users = Accounts.list_users()
    # test = Accounts.User
    # |> MastaniServer.Repo.paginate(page: 1, page_size: 2)
    # IO.inspect test, label: "see ? "
    {:ok, token, claims} = Accounts.login(39)
    IO.inspect(token, label: 'token: ')
    IO.inspect(claims, label: 'claims: ')

    {:ok, %{entries: users, total_count: 100, page_size: 2}}
  end

  def create_user(_root, args, %{context: %{current_user: %{root: true}}}) do
    # IO.inspect(user, label: "create_post current_user")
    # IO.inspect(args, label: "create_post args")
    case Accounts.create_user(args) do
      {:ok, user} ->
        {:ok, user}

      {:error, errors} ->
        {:error, errors}
    end
  end

  def create_user(_root, _args, _info) do
    {:error, "Access denied."}
  end
end