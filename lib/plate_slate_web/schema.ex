# ---
# Excerpted from "Craft GraphQL APIs in Elixir with Absinthe",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/wwgraphql for more book information.
# ---
defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema
  alias PlateSlate.Menu.Item
  alias PlateSlate.Repo

  query do
    @desc "The list of available items on the menu"
    field :menu_items, list_of(:menu_item) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Item)}
      end
    end
  end

  object :menu_item do
    @desc "The id for the menu item"
    field :id, :id
    @desc "Name for the menu item"
    field :name, :string
    @desc "The description of the menu item"
    field :description, :string
    @desc "The price for the item on the menu"
    field :price, :string
  end
end
