require 'open-uri'
require 'nokogiri'
require 'pry'
require 'json'
require 'active_support/core_ext'

class GameIdGetter
  attr_reader :id_array

  def initialize(array)
    @url_array = array
    @id_array = []
  end

  def call
    @url_array.each do |page|
      document = Nokogiri::HTML(open(page))
      anchors = document.css("table.collection_table td.collection_thumbnail a")

      anchors.each do |x|
        array = x.attr("href").split("/")
        @id_array.push(array[2])
      end
      print "."
      sleep 1
    end

  end

end

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

    if Game.find_by(name: @name) == nil
      new_game = Game.create!(
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
        Mechanic.create(mechanic_type: mech_string, game_id: new_game.id)
      end
    end
    puts @name
    sleep 1
  end
end


# Create groups and memberships
# 5.times do
#   Group.create!(name: "#{Faker::Company.name} #{Faker::Company.suffix}")
# end
# @groups = Group.all
#
# 30.times do
#   rand(6) >= 4 ? admin = true : admin = false
#   grp_index = rand(5)
#   new_user = User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "12345678")
#   Membership.create(user_id: new_user.id, group_id: @groups[grp_index].id, is_admin: admin, is_founder: false)
# end
#
# 5.times do |i|
#   new_user = User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "12345678")
#   Membership.create(user_id: new_user.id, group_id: @groups[i].id, is_admin: true, is_founder: true)
# end


# Do the stuff for games
top_thousand = [
  "https://boardgamegeek.com/browse/boardgame/page/1",
  "https://boardgamegeek.com/browse/boardgame/page/2",
  "https://boardgamegeek.com/browse/boardgame/page/3",
  "https://boardgamegeek.com/browse/boardgame/page/4",
  "https://boardgamegeek.com/browse/boardgame/page/5",
  "https://boardgamegeek.com/browse/boardgame/page/6",
  "https://boardgamegeek.com/browse/boardgame/page/7",
  "https://boardgamegeek.com/browse/boardgame/page/8",
  "https://boardgamegeek.com/browse/boardgame/page/9",
  "https://boardgamegeek.com/browse/boardgame/page/10"
]

results = GameIdGetter.new(top_thousand)
results.call

results.id_array.each do |id|
  GameMaker.new(id).build
end
