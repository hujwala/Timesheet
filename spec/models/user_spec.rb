require 'rails_helper'

RSpec.describe User,:type => :model do
  
  let(:user){FactoryGirl.create(:user)}

  context "Factory settings for users" do
    it "should validate the user factories" do
      expect(FactoryGirl.build(:user).valid?).to be true
    end
    
    describe User do
      it{should validate_presence_of :name}
      it { should allow_value('ujwala').for(:name )}
      it{should validate_presence_of :email}
      it { should allow_value('ujwala@qwinixtech.com').for(:email )}
      it { should validate_presence_of :password }
     
    end
  end

  
  it "should validate password lenght" do

    user.password = "ujwal"
    user.valid?
    expect(user.errors[:password].size).to be 1
    expect(user).to be_invalid

    user.password = "Password@1"
    user.valid?
    expect(user.errors[:password].size).to be 0
    expect(user).to be_valid
  end

  

  it "should validate email" do
    
    ["ujwala@qwinixtech.com", "ujwala@gmail.com"].each do |n|
      user.email = n
      value = user.valid?
      expect(value).to be_truthy
    end

    # checking invalid email
    ["ujwala.007.gmail.com", "ujwala.com"].each do |n|
      user.email = n
      value = user.valid?
      expect(value).to be_falsy
    end
  end

  it "should validate password" do
    
    ["Password@1", "Password@1"].each do |n|
      user.password = n
      value = user.valid?
      expect(value).to be_truthy
    end

    
    ["Pass", "Pa"].each do |n|
      user.password = n
      value = user.valid?
      expect(value).to be_falsy
    end
  end

end