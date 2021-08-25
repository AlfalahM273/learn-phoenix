defmodule BusiApiWeb.Schema do
  use Absinthe.Schema
  import_types(BusiApiWeb.Types)
  alias BusiApiWeb.BusinessResolver

  query do
    @desc "Get all links"
    field :all_businesses, non_null(list_of(non_null(:bussiness))) do
      resolve(&BusinessResolver.all_businesses/3)
    end
  end

  mutation do
    @desc "create links"
    field :create_bussiness, :bussiness do
      arg :name, non_null(:string)
      arg :tag, non_null(:string)
      arg :description, non_null(:string)

      resolve &BusinessResolver.create_bussiness/3

    end

  end

end
