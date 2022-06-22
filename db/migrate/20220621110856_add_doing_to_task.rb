class AddDoingToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :doing, :boolean, default: false, null: false
  end
end
