class ChangeDataTypeInTimeSheet < ActiveRecord::Migration
 def up
   change_column :time_sheets, :working_time, :string
  end

  def down
   change_column :time_sheets, :working_time, :datetime
  end
end