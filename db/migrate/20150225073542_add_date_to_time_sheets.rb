class AddDateToTimeSheets < ActiveRecord::Migration
  def change
    add_column :time_sheets, :date, :datetime
    add_index :time_sheets, :date
  end
end
