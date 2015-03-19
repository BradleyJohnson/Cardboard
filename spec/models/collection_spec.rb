require 'rails_helper'

RSpec.describe Collection, :type => :model do
  it "Validations prevent creating Collection without a user_id" do
    new_collection = Collection.new(game_id: 1)
    new_collection.save

    expect(new_collection.errors.messages).to include({:user_id=>["can't be blank"]})
  end

  it "Validations prevent creating Collection without a game_id" do
    new_collection = Collection.new(user_id: 1)
    new_collection.save

    expect(new_collection.errors.messages).to include({:game_id=>["can't be blank"]})
  end

  it "Validations prevent creating a duplicate Collection" do
    new_collection = Collection.new(user_id: 1, game_id: 1)
    dup_collection = Collection.new(game_id: 1, user_id: 1)
    new_collection.save
    dup_collection.save

    expect(dup_collection.errors.messages).to include({:game_id => ["You already have this game in your collection!"]})
  end

  it "Collections support multiple Users on the same game" do
    new_collection = Collection.new(user_id: 1, game_id: 1)
    second_membership = Collection.new(user_id: 2, game_id: 1)
    new_collection.save
    second_membership.save

    expect(Collection.count).to eq(2)
  end

  it "Collection query renders appropriate game and user associations" do
    new_user = User.create!(username: "brad", email: "blob@blobby.com", password: "12345678")
    new_game = Game.create!(
      name: "7 Wonders",
      description: "You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes, and affirm your military supremacy. Build your city and erect an architectural wonder which will transcend future times.",
      min_players: 3,
      max_players: 7
      )
    membership = Collection.create!(user: new_user, game: new_game)


    expect(new_game.users).to include(new_user)
    expect(new_user.games).to include(new_game)
  end
end
