class TimeSheet < ActiveRecord::Base
	belongs_to :user
	
	validates :project_name, :presence =>true,:length => {:maximum =>30}
	validates :description, :presence =>true
    validates :working_time, :presence =>true
    validates :user_id, :presence =>true
    validates :date, :presence =>true
end
