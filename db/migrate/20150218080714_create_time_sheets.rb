class CreateTimeSheets < ActiveRecord::Migration
  def change
    create_table :time_sheets do |t|
      t.string :project_name
      t.text :description
      t.datetime :working_time

      t.timestamps
    end
  end
end
