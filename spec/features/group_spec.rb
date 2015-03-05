require 'rails_helper'

feature GroupsController do
  before :each do
    visit root_path
    click_on "Sign up"
    fill_in "Username", with: "TreeFiddy"
    fill_in "Email", with: "you@got.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"

    click_on "Groups"
    click_on "Found a Group"

    fill_in "Name", with: "Redwood City Board Games Meetup"
    click_on "Create Group"
  end

  scenario "Users can create a group" do
    visit root_path
    click_on "Found a Group"

    fill_in "Name", with: "Bay Area Tabletop Guild"
    click_on "Create Group"

    expect(page).to have_content("Bay Area Tabletop Guild")
  end

end
