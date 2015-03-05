# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(username: "bob", email: "bob@bob.com", password: "12345678")
User.create(username: "ted", email: "ted@ted.com", password: "12345678")
User.create(username: "stefanie", email: "kid-three@boom.com", password: "12345678")
User.create(username: "linda", email: "the-hen@boom.com", password: "12345678")
User.create(username: "kurt", email: "the-rooster@boom.com", password: "12345678")

Group.create(name: "Black Rebel Board Game Club")
Group.create(name: "Geeks from Beyond!")

Membership.create(user_id: 1, group_id: 1, is_admin: true, is_founder: true)
Membership.create(user_id: 1, group_id: 2, is_admin: true, is_founder: true)
Membership.create(user_id: 2, group_id: 1, is_admin: true, is_founder: false)
Membership.create(user_id: 2, group_id: 2, is_admin: true, is_founder: false)
Membership.create(user_id: 3, group_id: 1, is_admin: true, is_founder: false)
Membership.create(user_id: 3, group_id: 2, is_admin: true, is_founder: false)
Membership.create(user_id: 4, group_id: 1, is_admin: true, is_founder: false)
Membership.create(user_id: 5, group_id: 2, is_admin: true, is_founder: false)
