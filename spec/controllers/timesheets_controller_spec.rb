require 'rails_helper'

RSpec.describe TimeSheetsController, :type => :controller do
let(:user) {FactoryGirl.create(:user)}
	let(:time_sheet) {FactoryGirl.create(:time_sheet)}
	

	it "should create timesheet" do
		time_sheet_params = {
			time_sheet: {
				project_name: "timesheet",
				description: "timesheet",
				working_time: 21,
				date: "02/27/2015"
			},
			format: :js
		}
		
		session[:user_id] = user.id
      expect do
        post :create, time_sheet_params
      end.to change(TimeSheet, :count).by(1)
    end


	it "should  not create timesheet" do
		time_sheet_params = {
			time_sheet: {
				project_name: "timesheet",
				description: "timesheet",
				working_time: 21,
				date: "02/27/2015"
			},
		}
		
		post :create,  time_sheet_params
		expect(TimeSheet.count).to  eq 0

	end


describe "PATCH update" do
    it "should update a timesheet" do
      value = time_sheet
      patch :update,  {:id => time_sheet.id, :time_sheet => {project_name: "new name", description: "ujwala"}}
      assigns(value).should_not eq(time_sheet)
    end
  end
end




