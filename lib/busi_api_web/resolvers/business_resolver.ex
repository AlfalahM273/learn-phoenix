defmodule BusiApiWeb.BusinessResolver do
  alias BusiApi.Directory

  def all_businesses(_root, _args, _info) do
    {:ok, Directory.list_businesses()}
  end

  def create_bussiness(_root, args, _info) do
    case Directory.create_business(args) do
      {:ok, business} ->
        {:ok, business}

      _error ->
        {:error, "could not create business"}
    end
  end
end
