require 'rails_helper'

feature MembershipsController do
  before :each do
    bob = User.create(username: "bob", email: "bob@bob.com", password: "12345678")
    ted = User.create(username: "ted", email: "ted@ted.com", password: "12345678")
    new_group = Group.create(name: "Redwood City Board Games Meetup")
    Membership.create(user_id: bob.id, group_id: new_group.id, is_admin: true, is_founder: true)
    log_in(bob, "12345678")

    click_on "Groups"
    click_on "My Groups"
  end

  scenario "Users should be added to group autmatically after founding group." do
    expect(page).to have_content("Your Groups")
    expect(page).to have_content("Redwood City Board Games Meetup")
  end

  scenario "Users can join a group if they are logged in" do
    ted = User.find_by(username: "ted")
    log_out
    log_in(ted, "12345678")
    click_on "Find a Group"

    expect(page).to have_content("Redwood City Board Games Meetup")

    click_on "View Group"
    click_on "Join this group"

    expect(page).to have_content("Successfully joined group")
  end


  scenario "Users can leave a group" do
    expect(page).to have_content("Your Groups")
    expect(page).to have_content("Redwood City Board Games Meetup")
    click_on "View Group"
    click_on "Leave Group"

    expect(page).to have_content("Your Groups")
    expect(page).to have_no_content("Redwood City Board Games Meetup")
  end

end
