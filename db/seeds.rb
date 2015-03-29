require 'open-uri'
require 'nokogiri'
require 'json'
require 'active_support/core_ext'

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
