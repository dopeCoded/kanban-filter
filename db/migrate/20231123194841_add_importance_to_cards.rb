class AddImportanceToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :importance, :string
  end
end
