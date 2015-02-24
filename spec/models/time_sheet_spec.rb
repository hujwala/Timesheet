require 'rails_helper'

RSpec.describe TimeSheet, type: :model do
 let(:time_sheet){FactoryGirl.create(:time_sheet)}

  context "Factory settings for users" do
    it "should validate the user factories" do
      expect(FactoryGirl.build(:time_sheet).valid?).to be true
end
end

    describe TimeSheet do
      it{should validate_presence_of :project_name}
      it { should allow_value('plist').for(:project_name )}
      it{should validate_presence_of :description}
      it { should allow_value('worked on bugs').for(:description )}
      it{should validate_presence_of :working_time}
      it { should allow_value('12:22').for(:working_time )}
  end 
it "should validate project_name lenght" do

    time_sheet.project_name = "ujwala"*30
    time_sheet.valid?
    expect(time_sheet.errors[:project_name].size).to be 1
    expect(time_sheet).to be_invalid

    time_sheet.project_name = "plis"
    time_sheet.valid?
    expect(time_sheet.errors[:project_name].size).to be 0
    expect(time_sheet).to be_valid
  end
  it "should validate working_time lenght" do

    time_sheet.working_time = "ujwala"
    time_sheet.valid?
    expect(time_sheet.errors[:working_time].size).to be 1
    expect(time_sheet).to be_invalid

    time_sheet.working_time = "12:12"
    time_sheet.valid?
    expect(time_sheet.errors[:working_time].size).to be 0
    expect(time_sheet).to be_valid
  end
end
