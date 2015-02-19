class TimeSheet < ActiveRecord::Base
validates :project_name, :presence =>true,
:length => {:maximum =>30}

validates :description, :presence =>true

validates :working_time, :presence =>true,
:format => {:with => ConfigCenter::GeneralValidations::TIME_FORMAT }
end
