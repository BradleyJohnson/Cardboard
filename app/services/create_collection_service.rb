require 'game_maker_service'

class CreateCollectionService
  def initialize(bgg_data, user)
    @bgg_data = bgg_data
    @user_id = user
  end

  def call
    @bgg_data["items"]["item"].each do |item|
      geek_id = item[1]["objectid"]
      game = Game.find_by(bgg_id: geek_id)

      if !game
        new_game = GameMaker.new(geek_id).build
        collection = Collection.new(game_id: new_game.id, user_id: @user_id)
        collection.save! if collection.valid?
      else
        collection = Collection.new(game_id: game.id, user_id: @user_id)
        collection.save! if collection.valid?
      end
    end
  end
end
