defmodule MyAshPhoenixApp.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        MyAshPhoenixApp.Accounts.User,
        _opts
      ) do
    Application.fetch_env(:my_ash_phoenix_app, :token_signing_secret)
  end
end
