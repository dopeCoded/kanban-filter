class AddOrderToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :order, :integer
  end
end
