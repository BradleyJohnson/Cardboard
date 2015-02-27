require 'rails_helper'

RSpec.describe User, :type => :model do

  it "validations prevent creating User without a username" do
    no_name_user = User.new(username: "", email: "blob@blobby.com", password: "12345678")
    no_name_user.save

    expect(User.count).to eq(0)
  end

  it "validations prevent creating User with a duplicate username" do
    dup_user1 = User.new(username: "brad", email: "Quantic@boom.com", password: "12345678")
    dup_user2 = User.new(username: "brad", email: "Dauwd@boom.com", password: "12345678")
    dup_user1.save
    dup_user2.save

    expect(User.count).to eq(1)
  end

  it "validations prevent creating User without an email" do
    no_email_user = User.new(username: "brad", email: "", password: "12345678")
    no_email_user.save

    expect(User.count).to eq(0)
  end

  it "validations prevent creating User with a duplicate email" do
    dup_user1 = User.new(username: "brad", email: "Quantic@boom.com", password: "12345678")
    dup_user2 = User.new(username: "not_brad", email: "Quantic@boom.com", password: "12345678")
    dup_user1.save
    dup_user2.save

    expect(User.count).to eq(1)
  end

end
