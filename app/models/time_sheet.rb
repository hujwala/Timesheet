class TimeSheet < ActiveRecord::Base
	belongs_to :user
	
	validates :project_name, :presence =>true,:length => {:maximum =>30}
	validates :description, :presence =>true
    validates :working_time, :presence =>true
    validates :user_id, :presence =>true
    validates :date, :presence =>true

    def self.saved_minutes(object)
    	saved_minutes = TimeSheet.where(date: object.date ).all
    	sum = 0;
    	saved_minutes.each { |u| sum += u.working_time }; 
    	sum
    	total_minutes = sum + object.working_time;
    end
end
