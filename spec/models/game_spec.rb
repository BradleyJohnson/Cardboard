require 'rails_helper'

RSpec.describe Game, :type => :model do
  it "Can create a game when validations are passed" do
    new_game = Game.create!(
      name: "7 Wonders",
      description: "You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes, and affirm your military supremacy. Build your city and erect an architectural wonder which will transcend future times.",
      min_players: 3,
      max_players: 7
      )

    expect(Game.count).to eq(1)
    expect(new_game.errors.messages).to be_empty
  end


  it "validations prevent creating Game without a name" do
    new_game = Game.create(
      name: "",
      description: "You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes, and affirm your military supremacy. Build your city and erect an architectural wonder which will transcend future times.",
      min_players: 3,
      max_players: 7
      )

    expect(new_game.errors.messages).to include({:name => ["can't be blank"]})
  end

  it "validations prevent creating Game without :description" do
    new_game = Game.create(
      name: "7 Wonders",
      description: "",
      min_players: 3,
      max_players: 7
      )

    expect(new_game.errors.messages).to include({:description => ["can't be blank"]})
  end

  it "validations prevent creating Game without :max_players" do
    new_game = Game.create(
      name: "7 Wonders",
      description: "You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes, and affirm your military supremacy. Build your city and erect an architectural wonder which will transcend future times.",
      min_players: 3,
      )

    expect(new_game.errors.messages).to include({:max_players => ["can't be blank"]})
  end

  it "validations prevent creating Game without :min_players" do
    new_game = Game.create(
      name: "7 Wonders",
      description: "You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes, and affirm your military supremacy. Build your city and erect an architectural wonder which will transcend future times.",
      max_players: 7
      )

    expect(new_game.errors.messages).to include({:min_players => ["can't be blank"]})
  end

  it "validations prevent creating Game with a duplicate name" do
    new_game = Game.create!(
      name: "7 Wonders",
      description: "You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes, and affirm your military supremacy. Build your city and erect an architectural wonder which will transcend future times.",
      min_players: 3,
      max_players: 7
      )
    new_2 = Game.create(
      name: "7 Wonders",
      description: "You are the leader of one of the 7 great cities of the Ancient World. Gather resources, develop commercial routes, and affirm your military supremacy. Build your city and erect an architectural wonder which will transcend future times.",
      min_players: 3,
      max_players: 7
      )

    expect(new_2.errors.messages).to include({:name => ["has already been taken"]})
  end
end
