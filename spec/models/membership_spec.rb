require 'rails_helper'

RSpec.describe Membership, :type => :model do


  it "Validations prevent creating Membership without a user_id" do
    new_membership = Membership.new(group_id: 1)
    new_membership.save

    expect(new_membership.errors.messages).to include({:user_id=>["can't be blank"]})
  end

  it "Validations prevent creating Membership without a group_id" do
    new_membership = Membership.new(user_id: 1)
    new_membership.save

    expect(new_membership.errors.messages).to include({:group_id=>["can't be blank"]})
  end

  it "Validations prevent creating a duplicate Membership" do
    new_membership = Membership.new(user_id: 1, group_id: 1)
    dup_membership = Membership.new(group_id: 1, user_id: 1)
    new_membership.save
    dup_membership.save

    expect(dup_membership.errors.messages).to include({:group_id => ["You're already a member of this group!"]})
  end

  it "Memberships support multiple Users on the same group" do
    new_membership = Membership.new(user_id: 1, group_id: 1)
    second_membership = Membership.new(user_id: 2, group_id: 1)
    new_membership.save
    second_membership.save

    expect(Membership.count).to eq(2)
  end

  it "Membership query renders appropriate group and user associations" do
    new_user = User.create!(username: "brad", email: "blob@blobby.com", password: "12345678")
    new_group = Group.create!(name: "The Geeks From BEYOND!")
    membership = Membership.create!(user: new_user, group: new_group)


    expect(new_group.users).to include(new_user)
    expect(new_user.groups).to include(new_group)
  end

end
