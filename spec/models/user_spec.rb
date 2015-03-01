require 'rails_helper'

RSpec.describe User, :type => :model do

  it "validations prevent creating User without a username" do
    no_name_user = User.new(username: "", email: "blob@blobby.com", password: "12345678")
    no_name_user.save

    expect(no_name_user.errors.messages).to include({:username => ["can't be blank"]})
  end

  it "validations prevent creating User with a duplicate username" do
    dup_user1 = User.new(username: "brad", email: "Quantic@boom.com", password: "12345678")
    dup_user2 = User.new(username: "brad", email: "Dauwd@boom.com", password: "12345678")
    dup_user1.save
    dup_user2.save

    expect(dup_user2.errors.messages).to include({:username => ["has already been taken"]})
  end

  it "validations prevent creating User without an email" do
    no_email_user = User.new(username: "brad", email: "", password: "12345678")
    no_email_user.save

    expect(no_email_user.errors.messages).to include({:email => ["can't be blank", "can't be blank"]})
  end

  it "validations prevent creating User with a duplicate email" do
    dup_user1 = User.new(username: "brad", email: "Quantic@boom.com", password: "12345678")
    dup_user2 = User.new(username: "not_brad", email: "Quantic@boom.com", password: "12345678")
    dup_user1.save
    dup_user2.save

    expect(dup_user2.errors.messages).to include({:email => ["has already been taken", "has already been taken"]})
  end

end
