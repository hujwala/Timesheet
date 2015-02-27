FactoryGirl.define do
	factory :time_sheet do
		project_name "MyString"
		description "MyText"
		working_time 123
		date "02/27/2015"
		user
	end

end
