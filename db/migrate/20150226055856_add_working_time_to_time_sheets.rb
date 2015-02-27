class AddWorkingTimeToTimeSheets < ActiveRecord::Migration
  def change
    add_column :time_sheets, :working_time, :integer
  end
end
