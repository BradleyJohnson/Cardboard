require 'rails_helper'

feature GroupsController do
  scenario "Users can create a group" do
    bob = User.create(username: "bob", email: "bob@bob.com", password: "12345678")
    log_in(bob, "12345678")
    click_on "Create a new Group"

    fill_in "name-input", with: "Bay Area Tabletop Guild"
    fill_in "location-input", with: "Somewhere"
    fill_in "description-input", with: "Something"

    click_on "Create Group"

    expect(page).to have_content("Bay Area Tabletop Guild")
  end

end
