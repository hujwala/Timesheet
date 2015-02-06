require 'rails_helper'

RSpec.describe User::UsersController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}


describe "GET create" do
    it "should add a users" do
      user_params = {
        user: {
        	
          name: "Mystring",
          email: "ujwala@yopmail.com",
          password: ConfigCenter::Defaults::PASSWORD,
          password_confirmation: ConfigCenter::Defaults::PASSWORD
        }
      }
      post :create , user_params
      expect(User.count).to  eq 1
    end
  end
end