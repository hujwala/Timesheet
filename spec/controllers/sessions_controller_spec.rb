require 'rails_helper'

RSpec.describe User::SessionsController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}
  
  it "should create session" do
      user_params = {
        email: "ujwala@yopmail.com",
          password: ConfigCenter::Defaults::PASSWORD
         }
      session[:user_id] = nil
      post :create, user_params
      expect(session[:user_id]).should_not be_nil
    end

 
end