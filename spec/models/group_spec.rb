require 'rails_helper'

RSpec.describe Group, :type => :model do

  it "validations prevent creating Group without required attributes" do
    new_group = Group.new()
    new_group.save

    expect(new_group.errors.messages).to include({:name=>["can't be blank"]})
    expect(new_group.errors.messages).to include({:location=>["can't be blank"]})
    expect(new_group.errors.messages).to include({:description=>["can't be blank"]})
  end

  it "Founder is automatically added to group set to admin set to admin." do
    new_user = User.create!(username: "brad", email: "blob@blobby.com", password: "12345678")
    new_group = new_user.groups.create(name: "The Geeks From BEYOND!", location: "Uhh, The Great Beyond???", description: "Interstellar space geeks")
    new_group.save

    expect(new_group.users).to include(User.find_by(email: "blob@blobby.com"))
  end

end
