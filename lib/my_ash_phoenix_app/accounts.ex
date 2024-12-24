defmodule MyAshPhoenixApp.Accounts do
  use Ash.Domain

  resources do
    resource MyAshPhoenixApp.Accounts.Token
    resource MyAshPhoenixApp.Accounts.User
  end
end
