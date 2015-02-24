require 'rails_helper'

RSpec.describe TimesheetsController, :type => :controller do

	let(:time_sheet) {FactoryGirl.create(:time_sheet)}
	let(:user) {FactoryGirl.create(:user)}

	it "should create timesheet" do
		time_sheet_params = {
			time_sheet: {
				project_name: "timesheet",
				description: "timesheet",
				working_time: "21:12"
			}
		}
		session[:user_id] = user.id
		post :create,  time_sheet_params
		expect(TimeSheet.count).to  eq 1
	end
end

