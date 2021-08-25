defmodule BusiApiWeb.Types do
  use Absinthe.Schema.Notation

  object :bussiness do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :tag, non_null(:string)
    field :description, non_null(:string)
  end

end
