require 'rails_helper'

RSpec.describe Message, :type => :model do

  it "Can create a valid Message object" do
    new_message = Message.new(title: "A Sample Title", body: "A Sample Body", sender_username: "bob", recipient_username: "ted")
    new_message.save

    expect(new_message.errors.messages).to be_empty
  end

  it "Validations prevent creating Message without a title" do
    new_message = Message.new(body: "A Sample Body", sender_username: "bob", recipient_username: "ted")
    new_message.save

    expect(new_message.errors.messages).to include({:title => ["can't be blank"]})
  end

  it "Validations prevent creating Message without a body" do
    new_message = Message.new(title: "A Sample Title", sender_username: "bob", recipient_username: "ted")
    new_message.save

    expect(new_message.errors.messages).to include({:body => ["can't be blank"]})
  end

  it "Validations prevent creating Message without a sender_username" do
    new_message = Message.new(title: "A Sample Title", body: "A Sample Body", recipient_username: "ted")
    new_message.save

    expect(new_message.errors.messages).to include({:sender_username => ["can't be blank"]})
  end

  it "Validations prevent creating Message without a recipient_username" do
    new_message = Message.new(title: "A Sample Title", body: "A Sample Body", sender_username: "bob")
    new_message.save

    expect(new_message.errors.messages).to include({:recipient_username => ["can't be blank"]})
  end

end
