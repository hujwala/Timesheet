class ChangeDateFormatInTimeSheets < ActiveRecord::Migration
  def up
   change_column :time_sheets, :date, :string
  end

  def down
   change_column :time_sheets, :date, :datetime
  end
end
