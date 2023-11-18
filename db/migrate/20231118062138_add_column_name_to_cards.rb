class AddColumnNameToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :deadline, :text
  end
end
