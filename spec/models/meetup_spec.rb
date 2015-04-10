require 'rails_helper'

RSpec.describe Meetup, :type => :model do
  it "validations prevent saving of Meetup without required attributes" do
    new_meetup = Meetup.new()
    new_meetup.save

    expect(new_meetup.errors.messages).to include({:location_string=>["can't be blank"]})
    expect(new_meetup.errors.messages).to include({:location_address=>["can't be blank"]})
    expect(new_meetup.errors.messages).to include({:meetup_notes=>["can't be blank"]})
    expect(new_meetup.errors.messages).to include({:meetup_date=>["can't be blank"]})
    expect(new_meetup.errors.messages).to include({:start_time=>["can't be blank"]})
    expect(new_meetup.errors.messages).to include({:end_time=>["can't be blank"]})
    expect(new_meetup.errors.messages).to include({:group_id=>["can't be blank"]})
  end
end
