require 'rails_helper'

RSpec.describe Rsvp, :type => :model do
  it "validations prevent saving of Rsvp without required attributes" do
    new_rsvp = Rsvp.new()
    new_rsvp.save

    expect(new_rsvp.errors.messages).to include({:meetup_id=>["can't be blank"]})
    expect(new_rsvp.errors.messages).to include({:user_id=>["can't be blank"]})
  end

  it "validations prevent duplication of Rsvp" do
    new_rsvp1 = Rsvp.new(user_id: 1, meetup_id: 1)
    new_rsvp1.save

    new_rsvp2 = Rsvp.new(user_id: 1, meetup_id: 1)
    new_rsvp2.save

    expect(new_rsvp2.errors.messages).to include({:user_id=>["You're already a member of this group!"]})
  end
end
