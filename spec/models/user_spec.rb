 require 'rails_helper'
RSpec.describe User, :type => :model do
let(:user) {FactoryGirl.create(:user)}
context "Factory settings for users" do

    it "should validate the user factories" do
      expect(FactoryGirl.build(:user).valid?).to be true
    end
  end

 describe User do
    it { should validate_presence_of :name }
      it { should validate_presence_of :email}
    it { should validate_presence_of :password }
end

  it "should validate first character to be uppercase" do

    user.name = "sg"*256
    user.valid?
    expect(user.errors[:name].size).to be 1
    expect(user).to be_invalid

    user.name = "s"

    user.valid?
    expect(user.errors[:name].size).to be 1
    expect(user).to be_invalid

    user.name = "RsdfKjdh"
    user.valid?
    expect(user.errors[:name].size).to be 0
    expect(user).to be_valid
  end
  it "should validate email" do

    # checking valid email
    ["something.123@domain.com", "something_123@domain.com"].each do |n|
      user.email = n
      value = user.valid?
      expect(value).to be_truthy
    end

    # checking invalid email
    ["something.123.domain.com", "something.com"].each do |n|
      user.email = n
      value = user.valid?

      expect(value).to be_falsy
    end
  end

  it "should validate password lenght" do

    user.password = "sgd"*256
    user.valid?

    expect(user.errors[:password].size).to be 0
    expect(user).to be_valid

    user.password = "sg"

    user.valid?
    expect(user.errors[:password].size).to be 1
    expect(user).to be_invalid

    user.password = "Password@1"
    user.valid?
    expect(user.errors[:password].size).to be 0
    expect(user).to be_valid
  end
end