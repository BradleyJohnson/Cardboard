require 'rails_helper'

RSpec.describe Mechanic, :type => :model do
  it "Can create a Mechanic when validations are passed" do
    new_mechanic = Mechanic.create!(mechanic_type: "Deck Building")

    expect(Mechanic.count).to eq(1)
    expect(new_mechanic.errors.messages).to be_empty
  end


  it "validations prevent creating Mechanic without a name" do
    new_mechanic = Mechanic.create(mechanic_type: "")

    expect(new_mechanic.errors.messages).to include({:mechanic_type => ["can't be blank"]})
  end
end
