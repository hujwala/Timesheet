class AddUserIdToTimeSheets < ActiveRecord::Migration
  def change
    add_column :time_sheets, :user_id, :integer
    add_index :time_sheets, :user_id
  end
end
