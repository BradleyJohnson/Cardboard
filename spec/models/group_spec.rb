require 'rails_helper'

RSpec.describe Group, :type => :model do

  it "validations prevent creating Group without a name" do
    new_group = Group.new(name: "")
    new_group.save

    expect(Group.count).to eq(0)
  end

  it "validations prevent creating Group with a duplicate name" do
    new_group_1 = Group.new(name: "The Geeks From BEYOND!")
    new_group_2 = Group.new(name: "The Geeks From BEYOND!")
    new_group_1.save
    new_group_2.save

    expect(Group.count).to eq(1)
  end

  it "Founder is automatically added to group set to admin set to admin." do
    new_user = User.create!(username: "brad", email: "blob@blobby.com", password: "12345678")
    new_group = new_user.groups.create(name: "The Geeks From BEYOND!")
    new_group.save

    puts new
  end

end
