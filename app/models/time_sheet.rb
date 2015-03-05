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
    	self.total_time(total_minutes)
    end

    def self.total_time(minutes)
    	hours = minutes/60
		minutes = minutes%60
		if hours > 23
		
			@time_sheet = nil
			flash[:error] = "Exceeds 24 hours"
		else 
		
			"#{hours}:#{minutes}"
		end
    end
end
