require 'rails_helper'

feature GroupsController do
  scenario "Users can create a group" do
    bob = User.create(username: "bob", email: "bob@bob.com", password: "12345678")
    log_in(bob, "12345678")
    click_on "Found a Group"

    fill_in "Name", with: "Bay Area Tabletop Guild"
    click_on "Create Group"

    expect(page).to have_content("Bay Area Tabletop Guild")
  end

end
