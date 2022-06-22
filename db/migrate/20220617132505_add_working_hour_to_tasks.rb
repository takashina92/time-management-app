class AddWorkingHourToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :working_hour, :string, default: '00:00:00'
  end
end
