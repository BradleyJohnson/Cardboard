require 'rails_helper'

RSpec.describe Message, :type => :model do

  it "Can create a valid Message object" do
    new_message = Message.new(title: "A Sample Title", body: "A Sample Body", sender_id: 1, recipient_id: 2)
    new_message.save

    expect(new_message.errors.messages).to be_empty
  end

  it "Validations prevent creating Message without a title" do
    new_message = Message.new(body: "A Sample Body", sender_id: 1, recipient_id: 2)
    new_message.save

    expect(new_message.errors.messages).to include({:title => ["can't be blank"]})
  end

  it "Validations prevent creating Message without a body" do
    new_message = Message.new(title: "A Sample Title", sender_id: 1, recipient_id: 2)
    new_message.save

    expect(new_message.errors.messages).to include({:body => ["can't be blank"]})
  end

  it "Validations prevent creating Message without a sender_id" do
    new_message = Message.new(title: "A Sample Title", body: "A Sample Body", recipient_id: 2)
    new_message.save

    expect(new_message.errors.messages).to include({:sender_id => ["can't be blank"]})
  end

  it "Validations prevent creating Message without a recipient_id" do
    new_message = Message.new(title: "A Sample Title", body: "A Sample Body", sender_id: 1)
    new_message.save

    expect(new_message.errors.messages).to include({:recipient_id => ["can't be blank"]})
  end

  xit "Another test" do

  end

end
