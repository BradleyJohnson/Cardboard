require 'rails_helper'

RSpec.describe Result, :type => :model do
  it "validations prevent saving of Result without required attributes" do
    new_result = Result.new()
    new_result.save

    expect(new_result.errors.messages).to include({:meetup_id=>["can't be blank"]})
    expect(new_result.errors.messages).to include({:user_id=>["can't be blank"]})
    expect(new_result.errors.messages).to include({:game_id=>["can't be blank"]})
  end
end
