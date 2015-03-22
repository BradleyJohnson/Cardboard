require 'open-uri'
require 'nokogiri'
require 'pry'
require 'json'
require 'active_support/core_ext'

class GameMaker
  def initialize(game_id)
    @game = game_id
    @mechanics = []
    @designer = ""
    @name = ""
  end

  def build
    buffer = open("http://www.boardgamegeek.com/xmlapi2/thing?id=#{@game}").read
    game_json =  JSON.parse(Hash.from_xml(buffer).to_json)

    game_json["items"]["item"]["link"].each do |link|
      if link.has_value?("boardgamemechanic")
        @mechanics.push(link["value"])
      elsif link.has_value?("boardgamedesigner")
        @designer = link["value"]
      end
    end

    if game_json["items"]["item"]["name"].class == Hash
      @name = game_json["items"]["item"]["name"]["value"]
    elsif game_json["items"]["item"]["name"].class == Array
      game_json["items"]["item"]["name"].each do |name|
        if name.has_value?("primary")
          @name = name["value"]
        end
      end
    end

    @new_game = Game.new(
        name: @name,
        description: game_json["items"]["item"]["description"],
        thumbnail: game_json["items"]["item"]["thumbnail"],
        year_published: game_json["items"]["item"]["yearpublished"]["value"],
        game_designer: @designer,
        min_players: game_json["items"]["item"]["minplayers"]["value"],
        max_players: game_json["items"]["item"]["maxplayers"]["value"],
        bgg_id: game_json["items"]["item"]["id"]
      )
    @mechanics.each do |mech_string|
      Mechanic.create(mechanic_type: mech_string, game_id: @new_game.id)
    end
    
    if @new_game.valid?
      @new_game.save!
    end

    sleep 1
    @new_game
  end
end
