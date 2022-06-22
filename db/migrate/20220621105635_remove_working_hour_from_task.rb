class RemoveWorkingHourFromTask < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :working_hour, :string
  end
end
