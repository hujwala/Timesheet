class RemoveWorkingTimeFromTimeSheets < ActiveRecord::Migration
  def change
    remove_column :time_sheets, :working_time, :string
  end
end
