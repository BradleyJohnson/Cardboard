require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it "Validations prevent creating Comment without a commentable_id" do
    new_comment = Comment.new(commentable_type: "Meetup", title: "Title", body: "Body", user_id: 1)
    new_comment.save

    expect(new_comment.errors.messages).to include({:commentable_id=>["can't be blank"]})
  end

  it "Validations prevent creating Comment without a user_id" do
    new_comment = Comment.new(commentable_id: 1, commentable_type: "Meetup", title: "Title", body: "Body")
    new_comment.save

    expect(new_comment.errors.messages).to include({:user_id=>["can't be blank"]})
  end

  it "Validations prevent creating Comment without a commentable_type" do
    new_comment = Comment.new(commentable_id: 1, user_id: 1, title: "Title", body: "Body")
    new_comment.save

    expect(new_comment.errors.messages).to include({:commentable_type=>["can't be blank"]})
  end

  it "Validations prevent creating Comment without a title" do
    new_comment = Comment.new(commentable_id: 1, commentable_type: "Meetup", body: "Body", user_id: 1)
    new_comment.save

    expect(new_comment.errors.messages).to include({:title=>["can't be blank"]})
  end

  it "Validations prevent creating Comment without a body" do
    new_comment = Comment.new(commentable_id: 1, commentable_type: "Meetup", title: "Title", user_id: 1)
    new_comment.save

    expect(new_comment.errors.messages).to include({:body=>["can't be blank"]})
  end

end
