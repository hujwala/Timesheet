require 'rails_helper'

RSpec.describe User::UsersController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}

  it "should add a users" do
    user_params = {
      user: {
        name: "Mystring",
        email: "ujwala@yopmail.com",
        password: ConfigCenter::Defaults::PASSWORD,
        password_confirmation: ConfigCenter::Defaults::PASSWORD
      }
    }
    session[:user_id] = nil
    expect do
      post :create , user_params
    end.to change(User, :count).by(1)
    expect(session[:user_id]).not_to eq nil
  end
end