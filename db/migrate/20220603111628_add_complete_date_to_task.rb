class AddCompleteDateToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :complete_date, :date
  end
end
